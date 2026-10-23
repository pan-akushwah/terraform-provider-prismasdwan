# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_qos_policy_stack: Manages a Prisma SD-WAN Qos Policy Stack.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Use the tenant's built-in default-rule QoS set as defaultrule_policyset_id.
#
# Tested end to end by the provider suite: resources/qos_policy_stack/example,
# data_sources/qos_policy_stack/filters.
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

resource "prismasdwan_resource_locator" "default_qos_policy_set" {
  resource_type           = "prismasdwan_qos_policy_set"
  resource_property       = "name"
  resource_property_value = "Default QoS Simple Stack Default Rule Policy Set (Simple)"
}

resource "prismasdwan_qos_policy_stack" "test_qos_policy_stack_1" {
  name        = "example_qos_stack"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example", "qos"]
  policyset_ids = [
    prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  ]
  defaultrule_policyset_id = prismasdwan_resource_locator.default_qos_policy_set.result
  default_policysetstack   = false
}

#
# Reading qos policy stack objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_qos_policy_stack" "find_by_name" {
  filters = {
    "name" = prismasdwan_qos_policy_stack.test_qos_policy_stack_1.name
  }
  depends_on = [prismasdwan_qos_policy_stack.test_qos_policy_stack_1]
}

# by id
data "prismasdwan_qos_policy_stack" "find_by_id" {
  filters = {
    "id" = prismasdwan_qos_policy_stack.test_qos_policy_stack_1.id
  }
  depends_on = [prismasdwan_qos_policy_stack.test_qos_policy_stack_1]
}

# by a reference: every object with this defaultrule_policyset_id
data "prismasdwan_qos_policy_stack" "find_by_defaultrule_policyset_id" {
  filters = {
    "defaultrule_policyset_id" = prismasdwan_qos_policy_stack.test_qos_policy_stack_1.defaultrule_policyset_id
  }
  depends_on = [prismasdwan_qos_policy_stack.test_qos_policy_stack_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_qos_policy_stack" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_qos_policy_stack.test_qos_policy_stack_1]
}

output "qos_policy_stack_found" {
  value = [for o in coalesce(data.prismasdwan_qos_policy_stack.find_by_name.items, []) : o.id]
}
