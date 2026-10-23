# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_nat_policy_set_stack: Manages a Prisma SD-WAN Nat Policy Set Stack.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/nat_policy_set_stack/example,
# data_sources/nat_policy_set_stack/filters.
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

resource "prismasdwan_nat_policy_set_stack" "example_nat_policy_set_stack" {
  name                   = "example_stack_alice"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["alice"]
  default_policysetstack = false
  policyset_ids          = [prismasdwan_nat_policy_set.example_nat_policy_set.id]
}

#
# Reading nat policy set stack objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_nat_policy_set_stack" "find_by_name" {
  filters = {
    "name" = prismasdwan_nat_policy_set_stack.example_nat_policy_set_stack.name
  }
  depends_on = [prismasdwan_nat_policy_set_stack.example_nat_policy_set_stack]
}

# by id
data "prismasdwan_nat_policy_set_stack" "find_by_id" {
  filters = {
    "id" = prismasdwan_nat_policy_set_stack.example_nat_policy_set_stack.id
  }
  depends_on = [prismasdwan_nat_policy_set_stack.example_nat_policy_set_stack]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_nat_policy_set_stack" "find_by_tags_member" {
  filters = {
    "tags.#(==\"alice\")" = "alice"
  }
  depends_on = [prismasdwan_nat_policy_set_stack.example_nat_policy_set_stack]
}

output "nat_policy_set_stack_found" {
  value = [for o in coalesce(data.prismasdwan_nat_policy_set_stack.find_by_name.items, []) : o.id]
}
