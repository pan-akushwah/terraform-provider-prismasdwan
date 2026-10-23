# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_nat_local_prefix: Manages a Prisma SD-WAN Nat Local Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/nat_local_prefix/example,
# data_sources/nat_local_prefix/filters.
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

resource "prismasdwan_nat_local_prefix" "test_nat_local_prefix_01" {
  name        = "example_nat_local_prefix_001"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example_tag"]
}

#
# Reading nat local prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_nat_local_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_nat_local_prefix.test_nat_local_prefix_01.name
  }
  depends_on = [prismasdwan_nat_local_prefix.test_nat_local_prefix_01]
}

# by id
data "prismasdwan_nat_local_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_nat_local_prefix.test_nat_local_prefix_01.id
  }
  depends_on = [prismasdwan_nat_local_prefix.test_nat_local_prefix_01]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_nat_local_prefix" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example_tag\")" = "example_tag"
  }
  depends_on = [prismasdwan_nat_local_prefix.test_nat_local_prefix_01]
}

output "nat_local_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_nat_local_prefix.find_by_name.items, []) : o.id]
}
