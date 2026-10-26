# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_toolkit: Manages a Prisma SD-WAN Element Toolkit.
#
# Required x_parameters (the parent's ids; the plan fails without them): element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Every element has exactly one toolkit (device access) configuration; read its id with the data source and
#     manage it. Destroying does not restore previous values.
#
# Tested end to end by the provider suite: resources/element_toolkit/example, data_sources/element_toolkit/filters.
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

#
# Every element has exactly one toolkit (device access) configuration. Read its id and manage it.
# Destroying stops managing it; it does not restore previous values.
#
data "prismasdwan_element_toolkit" "existing" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_element_toolkit" "example" {
  x_parameters = {
    element_id        = prismasdwan_resource_locator.element_shell.result
    element_access_id = data.prismasdwan_element_toolkit.existing.items[0].id
  }
  ssh_enabled              = true  # SSH to the element's toolkit
  ssh_outbound_enabled     = false # SSH from the element to other hosts
  inactive_interval        = 20    # minutes before an idle session is closed
  retry_login_count        = 5     # failed logins before the account is locked
  account_disable_interval = 5     # minutes the account stays locked
}

#
# Reading element toolkit objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_element_toolkit" "find_by_id" {
  x_parameters = {
    element_id        = prismasdwan_resource_locator.element_shell.result
    element_access_id = data.prismasdwan_element_toolkit.existing.items[0].id
  }
  filters = {
    "id" = prismasdwan_element_toolkit.example.id
  }
  depends_on = [prismasdwan_element_toolkit.example]
}

output "element_toolkit_found" {
  value = [for o in coalesce(data.prismasdwan_element_toolkit.find_by_id.items, []) : o.id]
}
