# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_performance_policy_stack: Manages a Prisma SD-WAN Performance Policy Stack.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - A tenant has exactly one default-rule performance set: look it up rather than creating one.
#
# Tested end to end by the provider suite: resources/performance_policy_stack/example,
# data_sources/performance_policy_stack/filters.
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

resource "prismasdwan_resource_locator" "default_performance_policy_set" {
  resource_type           = "prismasdwan_performance_policy_set"
  resource_property       = "name"
  resource_property_value = "Default Performance Policy Set"
}

resource "prismasdwan_performance_policy_stack" "performance_policy_stack_1" {
  name                   = "example_performance_stack_alpha"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["terraform"]
  default_policysetstack = false
  policyset_ids = [
    prismasdwan_performance_policy_set.performance_policy_set_1.id
  ]
  defaultrule_policyset_id = prismasdwan_resource_locator.default_performance_policy_set.result
}

#
# Reading performance policy stack objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_performance_policy_stack" "find_by_name" {
  filters = {
    "name" = prismasdwan_performance_policy_stack.performance_policy_stack_1.name
  }
  depends_on = [prismasdwan_performance_policy_stack.performance_policy_stack_1]
}

# by id
data "prismasdwan_performance_policy_stack" "find_by_id" {
  filters = {
    "id" = prismasdwan_performance_policy_stack.performance_policy_stack_1.id
  }
  depends_on = [prismasdwan_performance_policy_stack.performance_policy_stack_1]
}

# by a reference: every object with this defaultrule_policyset_id
data "prismasdwan_performance_policy_stack" "find_by_defaultrule_policyset_id" {
  filters = {
    "defaultrule_policyset_id" = prismasdwan_performance_policy_stack.performance_policy_stack_1.defaultrule_policyset_id
  }
  depends_on = [prismasdwan_performance_policy_stack.performance_policy_stack_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_performance_policy_stack" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_performance_policy_stack.performance_policy_stack_1]
}

output "performance_policy_stack_found" {
  value = [for o in coalesce(data.prismasdwan_performance_policy_stack.find_by_name.items, []) : o.id]
}
