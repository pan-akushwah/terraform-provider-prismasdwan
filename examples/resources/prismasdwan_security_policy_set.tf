# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_security_policy_set: Manages a Prisma SD-WAN Security Policy Set.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Rule order is a chicken-and-egg problem: create the set and rules first, then set policyrule_order in a second
#     apply (see the commented stage 2).
#
# Tested end to end by the provider suite: resources/security_policy_set/example,
# data_sources/security_policy_set/filters.
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

resource "prismasdwan_security_policy_set" "production_policy_set" {
  name                  = "production_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["production", "high_priority"]
  defaultrule_policyset = false
}

resource "prismasdwan_security_policy_set" "development_policy_set" {
  name                  = "development_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["development", "testing"]
  defaultrule_policyset = false
}

resource "prismasdwan_security_policy_set" "compliance_policy_set" {
  name                  = "compliance_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["compliance", "audit"]
  defaultrule_policyset = true
}

#
# Below Example will create a set named `rule_ordered_policy_set`
# with three rules in Order [rule_1, rule_2, rule_3]
# NOTE THE `depends_on` between rules
# 
resource "prismasdwan_security_policy_set" "rule_ordered_policy_set" {
  defaultrule_policyset = false
  name                  = "rule_ordered_policy_set"
}


#
# rule_1 will be created after rule_ordered_policy_set is created
# this is due to reference of rule_ordered_policy_set in x_parameters
#
resource "prismasdwan_security_policy_rule" "rule_1" {
  x_parameters = {
    "policy_set_id" = prismasdwan_security_policy_set.rule_ordered_policy_set.id
  }

  name        = "rule_1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  action      = "allow"

  # List attributes
  app_def_ids            = []
  source_zone_ids        = []
  source_prefix_ids      = []
  destination_prefix_ids = []
  destination_zone_ids   = []
  services               = []

  # Nullable attributes
  tags = ["tag1", "tag2"]
}


#
# rule_2 will be created after rule_1 is created
# this will cause rule_2 to be set after rule_1
#
resource "prismasdwan_security_policy_rule" "rule_2" {
  x_parameters = {
    "policy_set_id" = prismasdwan_security_policy_set.rule_ordered_policy_set.id
  }
  depends_on  = [prismasdwan_security_policy_rule.rule_1]
  name        = "rule_2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  action      = "allow"

  # List attributes
  app_def_ids            = []
  source_zone_ids        = []
  source_prefix_ids      = []
  destination_prefix_ids = []
  destination_zone_ids   = []
  services               = []

  # Nullable attributes
  tags = ["tag1", "tag2"]
}

#
# rule_3 will be created after rule_2 is created
# this will cause rule_3 to be set after rule_2
#
resource "prismasdwan_security_policy_rule" "rule_3" {
  x_parameters = {
    "policy_set_id" = prismasdwan_security_policy_set.rule_ordered_policy_set.id
  }
  depends_on  = [prismasdwan_security_policy_rule.rule_2]
  name        = "rule_3"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  action      = "allow"

  # List attributes
  app_def_ids            = []
  source_zone_ids        = []
  source_prefix_ids      = []
  destination_prefix_ids = []
  destination_zone_ids   = []
  services               = []

  # Nullable attributes
  tags = ["tag1", "tag2"]
}


# Solving chicken egg problem with 
# Two-Stage Apply with Explicit Order Control
# If you need to control the exact order of rules:
# Stage 1: Create policy set and rules without specifying policyrule_order:

resource "prismasdwan_security_policy_set" "cross_reference_policy_set" {
  defaultrule_policyset = false
  name                  = "cross_reference_policy_set"
  # Don't specify policyrule_order yet
}

#
# create rules
resource "prismasdwan_security_policy_rule" "rule_001" {
  x_parameters = {
    "policy_set_id" = prismasdwan_security_policy_set.cross_reference_policy_set.id
  }
  name                   = "Rule001"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled                = true
  action                 = "allow"
  app_def_ids            = []
  source_zone_ids        = []
  source_prefix_ids      = []
  destination_prefix_ids = []
  destination_zone_ids   = []
  services               = []
}
resource "prismasdwan_security_policy_rule" "rule_002" {
  x_parameters = {
    "policy_set_id" = prismasdwan_security_policy_set.cross_reference_policy_set.id
  }
  depends_on             = [prismasdwan_security_policy_rule.rule_001]
  name                   = "Rule002"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled                = true
  action                 = "allow"
  app_def_ids            = []
  source_zone_ids        = []
  source_prefix_ids      = []
  destination_prefix_ids = []
  destination_zone_ids   = []
  services               = []
}
# Stage 2: after the first apply, replace the block above with this one to set an explicit order:
# resource "prismasdwan_security_policy_set" "cross_reference_policy_set" {
#   defaultrule_policyset = false
#   name                  = "cross_reference_policy_set"
#   # Now specify the order explicitly
#   policyrule_order = [
#     prismasdwan_security_policy_rule.rule_002.id, # Rule 002 first
#     prismasdwan_security_policy_rule.rule_001.id, # Rule 001 second
#   ]
# }

#
# Reading security policy set objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_security_policy_set" "find_by_name" {
  filters = {
    "name" = prismasdwan_security_policy_set.production_policy_set.name
  }
  depends_on = [prismasdwan_security_policy_set.production_policy_set]
}

# by id
data "prismasdwan_security_policy_set" "find_by_id" {
  filters = {
    "id" = prismasdwan_security_policy_set.production_policy_set.id
  }
  depends_on = [prismasdwan_security_policy_set.production_policy_set]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_security_policy_set" "find_by_tags_member" {
  filters = {
    "tags.#(==\"production\")" = "production"
  }
  depends_on = [prismasdwan_security_policy_set.production_policy_set]
}

output "security_policy_set_found" {
  value = [for o in coalesce(data.prismasdwan_security_policy_set.find_by_name.items, []) : o.id]
}
