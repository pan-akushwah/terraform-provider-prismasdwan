# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_path_policy_rule: Manages a Prisma SD-WAN Path Policy Rule.
#
# Required x_parameters (the parent's ids; the plan fails without them): policy_set_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Path labels are public-N or private-N (public-1, private-1, public-*), not free text.
#
# Tested end to end by the provider suite: resources/path_policy_rule/example,
# data_sources/path_policy_rule/filters.
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

resource "prismasdwan_path_policy_rule" "example_path_policy_rule" {
  // needed when a new policy set is created via terraform
  x_parameters = {
    policy_set_id = prismasdwan_path_policy_set.corporate_policy_set.id
  }
  name               = "example_test_path_policy_rule"
  description        = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags               = ["example", "demo"]
  order_number       = 1024
  enabled            = true
  network_context_id = prismasdwan_network_context.development_network_context.id
  paths_allowed = {
    active_paths = [
      {
        label     = "public-1"
        path_type = "direct"
      }
    ]
    backup_paths = [
      {
        label     = "private-1"
        path_type = "vpn"
      }
    ]
  }
}

#
# Reading path policy rule objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_path_policy_rule" "find_by_name" {
  x_parameters = {
    policy_set_id = prismasdwan_path_policy_set.corporate_policy_set.id
  }
  filters = {
    "name" = prismasdwan_path_policy_rule.example_path_policy_rule.name
  }
  depends_on = [prismasdwan_path_policy_rule.example_path_policy_rule]
}

# by id
data "prismasdwan_path_policy_rule" "find_by_id" {
  x_parameters = {
    policy_set_id = prismasdwan_path_policy_set.corporate_policy_set.id
  }
  filters = {
    "id" = prismasdwan_path_policy_rule.example_path_policy_rule.id
  }
  depends_on = [prismasdwan_path_policy_rule.example_path_policy_rule]
}

# by a reference: every object with this network_context_id
data "prismasdwan_path_policy_rule" "find_by_network_context_id" {
  x_parameters = {
    policy_set_id = prismasdwan_path_policy_set.corporate_policy_set.id
  }
  filters = {
    "network_context_id" = prismasdwan_path_policy_rule.example_path_policy_rule.network_context_id
  }
  depends_on = [prismasdwan_path_policy_rule.example_path_policy_rule]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_path_policy_rule" "find_by_tags_member" {
  x_parameters = {
    policy_set_id = prismasdwan_path_policy_set.corporate_policy_set.id
  }
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_path_policy_rule.example_path_policy_rule]
}

output "path_policy_rule_found" {
  value = [for o in coalesce(data.prismasdwan_path_policy_rule.find_by_name.items, []) : o.id]
}
