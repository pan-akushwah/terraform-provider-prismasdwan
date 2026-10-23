# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_iot_device_id_config: Manages a Prisma SD-WAN Element Iot Device Id Config.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - snmp_discovery_source_interface_id must be a configured LAN interface.
#
# Tested end to end by the provider suite: resources/element_iot_device_id_config/example,
# data_sources/element_iot_device_id_config/filters.
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
# Ports already exist on the shell: x_parameters.id adopts port "6" instead of creating an interface.
# Destroying the resource hands the port back unconfigured (used_for = none, DHCP).
#
resource "prismasdwan_resource_locator" "port_6" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  resource_type           = "prismasdwan_element_shell_interface"
  resource_property       = "name"
  resource_property_value = "6"
}

resource "prismasdwan_element_shell_interface" "discovery_port" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
    id               = prismasdwan_resource_locator.port_6.result
  }
  name           = "6"
  type           = "port"
  admin_up       = true
  used_for       = "lan"
  scope          = "local"
  vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
  ipv4_config = {
    type          = "static"
    static_config = { address = "10.60.6.1/24" }
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

resource "prismasdwan_element_iot_device_id_config" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name                               = "tf example device id config"
  description                        = "Managed by Prisma SDWAN Terraform IaaC Provider"
  snmp_discovery_source_interface_id = prismasdwan_element_shell_interface.discovery_port.id
}

#
# Reading element iot device id config objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_iot_device_id_config" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_iot_device_id_config.example.name
  }
  depends_on = [prismasdwan_element_iot_device_id_config.example]
}

# by id
data "prismasdwan_element_iot_device_id_config" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_iot_device_id_config.example.id
  }
  depends_on = [prismasdwan_element_iot_device_id_config.example]
}

# by a reference: every object with this snmp_discovery_source_interface_id
data "prismasdwan_element_iot_device_id_config" "find_by_snmp_discovery_source_interface_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "snmp_discovery_source_interface_id" = prismasdwan_element_iot_device_id_config.example.snmp_discovery_source_interface_id
  }
  depends_on = [prismasdwan_element_iot_device_id_config.example]
}

output "element_iot_device_id_config_found" {
  value = [for o in coalesce(data.prismasdwan_element_iot_device_id_config.find_by_name.items, []) : o.id]
}
