# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_service_group: Manages a Prisma SD-WAN Service Group.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/service_group/example, data_sources/service_group/filters.
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

resource "prismasdwan_service_group" "service_group_1" {
  type = "non-cg-transit" # one of: cg-transit, non-cg-transit, sase
  name = "test_group"
}

#
# Reading service group objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_service_group" "find_by_name" {
  filters = {
    "name" = prismasdwan_service_group.service_group_1.name
  }
  depends_on = [prismasdwan_service_group.service_group_1]
}

# by id
data "prismasdwan_service_group" "find_by_id" {
  filters = {
    "id" = prismasdwan_service_group.service_group_1.id
  }
  depends_on = [prismasdwan_service_group.service_group_1]
}

output "service_group_found" {
  value = [for o in coalesce(data.prismasdwan_service_group.find_by_name.items, []) : o.id]
}
