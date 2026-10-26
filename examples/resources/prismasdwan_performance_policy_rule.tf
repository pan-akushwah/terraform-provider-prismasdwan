# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_performance_policy_rule: Manages a Prisma SD-WAN Performance Policy Rule.
#
# Required x_parameters (the parent's ids; the plan fails without them): perfmgmtpolicyset_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Rules are stored in their policy set, so the provider creates rules of the same set one at a time (parallel
#     creates conflict on the set).
#
# Tested end to end by the provider suite: resources/performance_policy_rule/example,
# data_sources/performance_policy_rule/filters.
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

resource "prismasdwan_performance_policy_rule" "performance_policy_rule_1" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  name                = "example_system_health_rule"
  description         = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                = ["123"]
  thresholdprofile_id = prismasdwan_performance_profile.performance_profile_5.id
  actions = [
    {
      action_type = "raise_alarm"
      always_on   = false
    }
  ]
  enabled = true
  type    = "system_site_health" # one of: app_circuit_health, system_site_health
}

resource "prismasdwan_performance_policy_rule" "performance_policy_rule_2" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  name                = "example_app_circuit_health_rule"
  description         = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                = ["123"]
  thresholdprofile_id = prismasdwan_performance_profile.performance_profile_2.id
  enabled             = true
  type                = "app_circuit_health" # one of: app_circuit_health, system_site_health
  app_filters = {
    app_transfer_types = [
      "bulk",
      "rt-audio",
      "rt-video",
      "transactional"
    ]
  }
  path_filters = [
    {
      label     = "public-*",
      path_type = "direct"
    },
    {
      label     = "public-*",
      path_type = "vpn"
    },
    {
      label     = "public-*",
      path_type = "servicelink"
    }
  ]
  actions = [
    {
      app_perf = {
        bad_health_thresholds = {
          raise_above = 70
          clear_below = 50
        }
        monitoring_approach = "moderate"
      }
      action_type = "raise_alarm"
      always_on   = false
    }
  ]
}

#
# Reading performance policy rule objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_performance_policy_rule" "find_by_name" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  filters = {
    "name" = prismasdwan_performance_policy_rule.performance_policy_rule_1.name
  }
  depends_on = [prismasdwan_performance_policy_rule.performance_policy_rule_1]
}

# by id
data "prismasdwan_performance_policy_rule" "find_by_id" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  filters = {
    "id" = prismasdwan_performance_policy_rule.performance_policy_rule_1.id
  }
  depends_on = [prismasdwan_performance_policy_rule.performance_policy_rule_1]
}

# by a reference: every object with this thresholdprofile_id
data "prismasdwan_performance_policy_rule" "find_by_thresholdprofile_id" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  filters = {
    "thresholdprofile_id" = prismasdwan_performance_policy_rule.performance_policy_rule_1.thresholdprofile_id
  }
  depends_on = [prismasdwan_performance_policy_rule.performance_policy_rule_1]
}

# by type
data "prismasdwan_performance_policy_rule" "find_by_type" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  filters = {
    "type" = prismasdwan_performance_policy_rule.performance_policy_rule_1.type
  }
  depends_on = [prismasdwan_performance_policy_rule.performance_policy_rule_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_performance_policy_rule" "find_by_tags_member" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  filters = {
    "tags.#(==\"123\")" = "123"
  }
  depends_on = [prismasdwan_performance_policy_rule.performance_policy_rule_1]
}

output "performance_policy_rule_found" {
  value = [for o in coalesce(data.prismasdwan_performance_policy_rule.find_by_name.items, []) : o.id]
}
