# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_global_prefix_filter: Manages a Prisma SD-WAN Global Prefix Filter.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/global_prefix_filter/example,
# data_sources/global_prefix_filter/filters.
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

resource "prismasdwan_global_prefix_filter" "global_filter_1" {
  name = "tf managed prefix filter 1"
  filters = [
    {
      type = "ipv4",
      ip_prefixes = [
        "10.10.10.0/24"
      ]
    }
  ]
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

#
# Reading global prefix filter objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_global_prefix_filter" "find_by_name" {
  filters = {
    "name" = prismasdwan_global_prefix_filter.global_filter_1.name
  }
  depends_on = [prismasdwan_global_prefix_filter.global_filter_1]
}

# by id
data "prismasdwan_global_prefix_filter" "find_by_id" {
  filters = {
    "id" = prismasdwan_global_prefix_filter.global_filter_1.id
  }
  depends_on = [prismasdwan_global_prefix_filter.global_filter_1]
}

output "global_prefix_filter_found" {
  value = [for o in coalesce(data.prismasdwan_global_prefix_filter.find_by_name.items, []) : o.id]
}
