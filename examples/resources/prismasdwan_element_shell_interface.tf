# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_shell_interface: Manages a Prisma SD-WAN Element Shell Interface.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_shell_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Ports already exist on a shell: setting x_parameters.id to the port's id adopts the port instead of creating
#     an interface. Destroying hands the port back unconfigured (used_for = none, DHCP).
#   - Set ethernet_port and multicast_config to the server defaults shown, or every plan will show a change.
#
# Tested end to end by the provider suite: resources/element_shell_interface/example,
# data_sources/element_shell_interface/filters.
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

# The element shell whose ports are configured
resource "prismasdwan_resource_locator" "element_shell_object" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_shell"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

#
# Ports already exist on the shell: x_parameters.id adopts port "4" instead of creating an interface.
# Destroying the resource hands the port back unconfigured (used_for = none, DHCP).
#
resource "prismasdwan_resource_locator" "port_4" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  resource_type           = "prismasdwan_element_shell_interface"
  resource_property       = "name"
  resource_property_value = "4"
}

resource "prismasdwan_element_shell_interface" "lan_port" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
    id               = prismasdwan_resource_locator.port_4.result
  }
  name           = "4"
  type           = "port" # one of: service_link, loopback, bypasspair, subinterface, pppoe, port, virtual_interface, cellular, ...
  admin_up       = true
  used_for       = "lan"   # one of: none, public, private, lan, private-l2, private_wan, switch-access, control, ...
  scope          = "local" # one of: global, local
  vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
  ipv4_config = {
    type          = "static"
    static_config = { address = "10.60.4.1/24" }
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

#
# Reading element shell interface objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_shell_interface" "find_by_name" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  filters = {
    "name" = prismasdwan_element_shell_interface.lan_port.name
  }
  depends_on = [prismasdwan_element_shell_interface.lan_port]
}

# by id
data "prismasdwan_element_shell_interface" "find_by_id" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  filters = {
    "id" = prismasdwan_element_shell_interface.lan_port.id
  }
  depends_on = [prismasdwan_element_shell_interface.lan_port]
}

# by a reference: every object with this vrf_context_id
data "prismasdwan_element_shell_interface" "find_by_vrf_context_id" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  filters = {
    "vrf_context_id" = prismasdwan_element_shell_interface.lan_port.vrf_context_id
  }
  depends_on = [prismasdwan_element_shell_interface.lan_port]
}

output "element_shell_interface_found" {
  value     = [for o in coalesce(data.prismasdwan_element_shell_interface.find_by_name.items, []) : o.id]
  sensitive = true
}
