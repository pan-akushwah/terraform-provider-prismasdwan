# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_security_policy_rule: Manages a Prisma SD-WAN Security Policy Rule.
#
# Required x_parameters (the parent's ids; the plan fails without them): policy_set_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/security_policy_rule/example,
# data_sources/security_policy_rule/filters.
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

resource "prismasdwan_resource_locator" "icmp_app_def" {
  resource_type           = "prismasdwan_app_def"
  resource_property       = "display_name"
  resource_property_value = "icmp"
}

resource "prismasdwan_security_policy_rule" "example_security_policy_rule" {
  x_parameters = {
    policy_set_id = prismasdwan_security_policy_set.development_policy_set.id
  }
  name                   = "example_security_policy_rule"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["production", "firewall"]
  app_def_ids            = [prismasdwan_resource_locator.icmp_app_def.result]
  source_zone_ids        = [prismasdwan_security_zone.dmz_zone.id]
  source_prefix_ids      = [prismasdwan_security_policy_local_prefix.development_local_prefix.id]
  destination_prefix_ids = [prismasdwan_security_policy_global_prefix.corporate_security_global_prefix.id]
  destination_zone_ids   = [prismasdwan_security_zone.production_zone.id]
  action                 = "allow" # one of: ALLOW, REJECT, DENY
  enabled                = true
  services               = []
}

#
# Reading security policy rule objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_security_policy_rule" "find_by_name" {
  x_parameters = {
    policy_set_id = prismasdwan_security_policy_set.development_policy_set.id
  }
  filters = {
    "name" = prismasdwan_security_policy_rule.example_security_policy_rule.name
  }
  depends_on = [prismasdwan_security_policy_rule.example_security_policy_rule]
}

# by id
data "prismasdwan_security_policy_rule" "find_by_id" {
  x_parameters = {
    policy_set_id = prismasdwan_security_policy_set.development_policy_set.id
  }
  filters = {
    "id" = prismasdwan_security_policy_rule.example_security_policy_rule.id
  }
  depends_on = [prismasdwan_security_policy_rule.example_security_policy_rule]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_security_policy_rule" "find_by_tags_member" {
  x_parameters = {
    policy_set_id = prismasdwan_security_policy_set.development_policy_set.id
  }
  filters = {
    "tags.#(==\"production\")" = "production"
  }
  depends_on = [prismasdwan_security_policy_rule.example_security_policy_rule]
}

output "security_policy_rule_found" {
  value = [for o in coalesce(data.prismasdwan_security_policy_rule.find_by_name.items, []) : o.id]
}
