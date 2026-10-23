# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_security_policy_stack: Manages a Prisma SD-WAN Security Policy Stack.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The default-rule set must be created with defaultrule_policyset = true.
#
# Tested end to end by the provider suite: resources/security_policy_stack/example,
# data_sources/security_policy_stack/filters.
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

resource "prismasdwan_security_policy_set" "development_policy_set" {
  name                  = "development_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["development", "testing"]
  defaultrule_policyset = false
}

# create a set for compliance
resource "prismasdwan_security_policy_set" "compliance_policy_set" {
  name                  = "compliance_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["compliance", "audit"]
  defaultrule_policyset = true
}

resource "prismasdwan_security_policy_stack" "development_security_policy_stack" {
  # Required fields
  name = "development_policy_stack"
  # the default-rule set must have defaultrule_policyset = true
  defaultrule_policyset_id = prismasdwan_security_policy_set.compliance_policy_set.id
  # Optional fields
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["tag1", "tag2"]
  # Policy set IDs (0-4 policy sets max, converted from names)
  policyset_ids = [
    prismasdwan_security_policy_set.development_policy_set.id
  ]
}

#
# Reading security policy stack objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_security_policy_stack" "find_by_name" {
  filters = {
    "name" = prismasdwan_security_policy_stack.development_security_policy_stack.name
  }
  depends_on = [prismasdwan_security_policy_stack.development_security_policy_stack]
}

# by id
data "prismasdwan_security_policy_stack" "find_by_id" {
  filters = {
    "id" = prismasdwan_security_policy_stack.development_security_policy_stack.id
  }
  depends_on = [prismasdwan_security_policy_stack.development_security_policy_stack]
}

# by a reference: every object with this defaultrule_policyset_id
data "prismasdwan_security_policy_stack" "find_by_defaultrule_policyset_id" {
  filters = {
    "defaultrule_policyset_id" = prismasdwan_security_policy_stack.development_security_policy_stack.defaultrule_policyset_id
  }
  depends_on = [prismasdwan_security_policy_stack.development_security_policy_stack]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_security_policy_stack" "find_by_tags_member" {
  filters = {
    "tags.#(==\"tag1\")" = "tag1"
  }
  depends_on = [prismasdwan_security_policy_stack.development_security_policy_stack]
}

output "security_policy_stack_found" {
  value = [for o in coalesce(data.prismasdwan_security_policy_stack.find_by_name.items, []) : o.id]
}
