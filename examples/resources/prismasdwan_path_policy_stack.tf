# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_path_policy_stack: Manages a Prisma SD-WAN Path Policy Stack.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The default-rule set must be created with defaultrule_policyset = true.
#
# Tested end to end by the provider suite: resources/path_policy_stack/example,
# data_sources/path_policy_stack/filters.
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

resource "prismasdwan_path_policy_set" "default_rule_policy_set" {
  name                  = "example_default_rule_path_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  defaultrule_policyset = true
}

resource "prismasdwan_path_policy_stack" "example_path_policy_stack" {
  name                   = "example_test_path_policy_stack"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["test", "example", "path_policy"]
  default_policysetstack = false
  policyset_ids = [
    prismasdwan_path_policy_set.branch_office_policy_set.id,
    prismasdwan_path_policy_set.cloud_policy_set.id
  ]
  defaultrule_policyset_id = prismasdwan_path_policy_set.default_rule_policy_set.id
}

#
# Reading path policy stack objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_path_policy_stack" "find_by_name" {
  filters = {
    "name" = prismasdwan_path_policy_stack.example_path_policy_stack.name
  }
  depends_on = [prismasdwan_path_policy_stack.example_path_policy_stack]
}

# by id
data "prismasdwan_path_policy_stack" "find_by_id" {
  filters = {
    "id" = prismasdwan_path_policy_stack.example_path_policy_stack.id
  }
  depends_on = [prismasdwan_path_policy_stack.example_path_policy_stack]
}

# by a reference: every object with this defaultrule_policyset_id
data "prismasdwan_path_policy_stack" "find_by_defaultrule_policyset_id" {
  filters = {
    "defaultrule_policyset_id" = prismasdwan_path_policy_stack.example_path_policy_stack.defaultrule_policyset_id
  }
  depends_on = [prismasdwan_path_policy_stack.example_path_policy_stack]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_path_policy_stack" "find_by_tags_member" {
  filters = {
    "tags.#(==\"test\")" = "test"
  }
  depends_on = [prismasdwan_path_policy_stack.example_path_policy_stack]
}

output "path_policy_stack_found" {
  value = [for o in coalesce(data.prismasdwan_path_policy_stack.find_by_name.items, []) : o.id]
}
