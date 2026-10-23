# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_local_prefix_filter: Manages a Prisma SD-WAN Local Prefix Filter.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/local_prefix_filter/example,
# data_sources/local_prefix_filter/filters.
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

resource "prismasdwan_local_prefix_filter" "example" {
  name        = "Terraform Managed Local Prefix Filter"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

#
# Reading local prefix filter objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_local_prefix_filter" "find_by_name" {
  filters = {
    "name" = prismasdwan_local_prefix_filter.example.name
  }
  depends_on = [prismasdwan_local_prefix_filter.example]
}

# by id
data "prismasdwan_local_prefix_filter" "find_by_id" {
  filters = {
    "id" = prismasdwan_local_prefix_filter.example.id
  }
  depends_on = [prismasdwan_local_prefix_filter.example]
}

output "local_prefix_filter_found" {
  value = [for o in coalesce(data.prismasdwan_local_prefix_filter.find_by_name.items, []) : o.id]
}
