# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_ospf_config: Manages a Prisma SD-WAN Element Ospf Config.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The VRF must already have an interface (here a LAN port adopted on the shell).
#   - area_type is lowercase (normal); the API rejects NORMAL.
#   - SPOKE elements require advertise_fabric_default_route = true.
#
# Tested end to end by the provider suite: resources/element_ospf_config/example,
# data_sources/element_ospf_config/filters.
#
# Provider configuration (see the provider documentation):
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

resource "prismasdwan_resource_locator" "element_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "element_shell_site"
}

resource "prismasdwan_resource_locator" "element_shell" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}


# The element shell whose ports are configured
resource "prismasdwan_resource_locator" "element_shell_object" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_shell"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

#
# Ports already exist on the shell: x_parameters.id adopts port "5" instead of creating an interface.
# Destroying the resource hands the port back unconfigured (used_for = none, DHCP).
#
resource "prismasdwan_resource_locator" "port_5" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  resource_type           = "prismasdwan_element_shell_interface"
  resource_property       = "name"
  resource_property_value = "5"
}

resource "prismasdwan_element_shell_interface" "ospf_port" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
    id               = prismasdwan_resource_locator.port_5.result
  }
  name           = "5"
  type           = "port"
  admin_up       = true
  used_for       = "lan"
  scope          = "local"
  vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
  ipv4_config = {
    type          = "static"
    static_config = { address = "10.60.5.1/24" }
  }
  # the API fills these nested objects in; set them so plan and state agree
  ethernet_port = {
    full_duplex = false
    speed       = 0
  }
  multicast_config = {
    multicast_enabled = false
    igmp_version      = "IGMPV3"
    dr_priority       = 1
  }
}

resource "prismasdwan_element_ospf_config" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name           = "tf example ospf"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  router_id      = "10.255.0.1"
  vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
  scope          = "local"
  shutdown       = false
  # required on SPOKE elements
  advertise_fabric_default_route = true
  areas = [
    {
      area_id   = 0
      area_type = "normal" # lowercase; the API rejects the spec's NORMAL
    }
  ]
  # OSPF needs an interface in the VRF
  interfaces = [
    {
      interface_id = prismasdwan_element_shell_interface.ospf_port.id
      area_id      = 0
    }
  ]
}

#
# Reading element ospf config objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_ospf_config" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_ospf_config.example.name
  }
  depends_on = [prismasdwan_element_ospf_config.example]
}

# by id
data "prismasdwan_element_ospf_config" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_ospf_config.example.id
  }
  depends_on = [prismasdwan_element_ospf_config.example]
}

# by a reference: every object with this vrf_context_id
data "prismasdwan_element_ospf_config" "find_by_vrf_context_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "vrf_context_id" = prismasdwan_element_ospf_config.example.vrf_context_id
  }
  depends_on = [prismasdwan_element_ospf_config.example]
}

output "element_ospf_config_found" {
  value     = [for o in coalesce(data.prismasdwan_element_ospf_config.find_by_name.items, []) : o.id]
  sensitive = true
}
