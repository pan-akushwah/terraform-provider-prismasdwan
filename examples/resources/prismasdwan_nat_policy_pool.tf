# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_nat_policy_pool: Manages a Prisma SD-WAN Nat Policy Pool.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/nat_policy_pool/example, data_sources/nat_policy_pool/filters.
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

resource "prismasdwan_nat_policy_pool" "example_pool" {
  name        = "example_nat_pool_alpha"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["alpha", "production"]
}

#
# Reading nat policy pool objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_nat_policy_pool" "find_by_name" {
  filters = {
    "name" = prismasdwan_nat_policy_pool.example_pool.name
  }
  depends_on = [prismasdwan_nat_policy_pool.example_pool]
}

# by id
data "prismasdwan_nat_policy_pool" "find_by_id" {
  filters = {
    "id" = prismasdwan_nat_policy_pool.example_pool.id
  }
  depends_on = [prismasdwan_nat_policy_pool.example_pool]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_nat_policy_pool" "find_by_tags_member" {
  filters = {
    "tags.#(==\"alpha\")" = "alpha"
  }
  depends_on = [prismasdwan_nat_policy_pool.example_pool]
}

output "nat_policy_pool_found" {
  value = [for o in coalesce(data.prismasdwan_nat_policy_pool.find_by_name.items, []) : o.id]
}
