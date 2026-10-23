# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_qos_policy_rule: Manages a Prisma SD-WAN Qos Policy Rule.
#
# Required x_parameters (the parent's ids; the plan fails without them): policy_set_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/qos_policy_rule/example, data_sources/qos_policy_rule/filters.
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

resource "prismasdwan_qos_policy_rule" "test_qos_policy_rule_1" {
  # Needed for path parameters
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  name                    = "example qos rule"
  description             = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                    = ["tag1", "tag2"]
  network_context_id      = prismasdwan_network_context.development_network_context.id
  order_number            = 1024
  enabled                 = true
  source_prefixes_id      = prismasdwan_qos_policy_local_prefix.test_qos_local_prefix.id
  destination_prefixes_id = prismasdwan_qos_policy_global_prefix.test_qos_global_prefix.id
  dscp = {
    value = 8
  }
  priority_number = 2
}

#
# Reading qos policy rule objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_qos_policy_rule" "find_by_name" {
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  filters = {
    "name" = prismasdwan_qos_policy_rule.test_qos_policy_rule_1.name
  }
  depends_on = [prismasdwan_qos_policy_rule.test_qos_policy_rule_1]
}

# by id
data "prismasdwan_qos_policy_rule" "find_by_id" {
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  filters = {
    "id" = prismasdwan_qos_policy_rule.test_qos_policy_rule_1.id
  }
  depends_on = [prismasdwan_qos_policy_rule.test_qos_policy_rule_1]
}

# by a reference: every object with this network_context_id
data "prismasdwan_qos_policy_rule" "find_by_network_context_id" {
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  filters = {
    "network_context_id" = prismasdwan_qos_policy_rule.test_qos_policy_rule_1.network_context_id
  }
  depends_on = [prismasdwan_qos_policy_rule.test_qos_policy_rule_1]
}

# by a reference: every object with this source_prefixes_id
data "prismasdwan_qos_policy_rule" "find_by_source_prefixes_id" {
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  filters = {
    "source_prefixes_id" = prismasdwan_qos_policy_rule.test_qos_policy_rule_1.source_prefixes_id
  }
  depends_on = [prismasdwan_qos_policy_rule.test_qos_policy_rule_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_qos_policy_rule" "find_by_tags_member" {
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  filters = {
    "tags.#(==\"tag1\")" = "tag1"
  }
  depends_on = [prismasdwan_qos_policy_rule.test_qos_policy_rule_1]
}

output "qos_policy_rule_found" {
  value = [for o in coalesce(data.prismasdwan_qos_policy_rule.find_by_name.items, []) : o.id]
}
