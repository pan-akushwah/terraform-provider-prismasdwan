# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_snmp_trap: Manages a Prisma SD-WAN Element Snmp Trap.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The API returns the v2 community masked; the provider keeps the configured value encrypted in private state.
#
# Tested end to end by the provider suite: resources/element_snmp_trap/example,
# data_sources/element_snmp_trap/filters.
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

resource "prismasdwan_element_snmp_trap" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  server_ip   = "10.1.1.10"
  version     = "v2" # one of: v2, v3
  v2_config = {
    community = "example-community"
  }
}

#
# Reading element snmp trap objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_element_snmp_trap" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_snmp_trap.example.id
  }
  depends_on = [prismasdwan_element_snmp_trap.example]
}

# by server_ip
data "prismasdwan_element_snmp_trap" "find_by_server_ip" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "server_ip" = prismasdwan_element_snmp_trap.example.server_ip
  }
  depends_on = [prismasdwan_element_snmp_trap.example]
}

output "element_snmp_trap_found" {
  value     = [for o in coalesce(data.prismasdwan_element_snmp_trap.find_by_id.items, []) : o.id]
  sensitive = true
}
