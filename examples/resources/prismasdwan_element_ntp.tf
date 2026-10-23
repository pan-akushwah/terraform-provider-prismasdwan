# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_ntp: Manages a Prisma SD-WAN Element Ntp.
#
# Required x_parameters (the parent's ids; the plan fails without them): element_id, ntp_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Every element has exactly one NTP configuration ("default"); read its id with the data source and manage it.
#     Destroying stops managing it but does not restore the previous servers.
#
# Tested end to end by the provider suite: resources/element_ntp/example, data_sources/element_ntp/filters.
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
# Every element has exactly one NTP configuration, named "default". Read it and manage it.
#
data "prismasdwan_element_ntp" "existing" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_element_ntp" "example" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    ntp_id     = data.prismasdwan_element_ntp.existing.items[0].id
  }
  name        = "default"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  ntp_servers = [
    {
      host     = "0.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    },
    {
      host     = "time.nist.gov"
      version  = 4
      min_poll = 9
      max_poll = 10
    }
  ]
}

#
# Reading element ntp objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_ntp" "find_by_name" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    ntp_id     = data.prismasdwan_element_ntp.existing.items[0].id
  }
  filters = {
    "name" = prismasdwan_element_ntp.example.name
  }
  depends_on = [prismasdwan_element_ntp.example]
}

# by id
data "prismasdwan_element_ntp" "find_by_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    ntp_id     = data.prismasdwan_element_ntp.existing.items[0].id
  }
  filters = {
    "id" = prismasdwan_element_ntp.example.id
  }
  depends_on = [prismasdwan_element_ntp.example]
}

output "element_ntp_found" {
  value = [for o in coalesce(data.prismasdwan_element_ntp.find_by_name.items, []) : o.id]
}
