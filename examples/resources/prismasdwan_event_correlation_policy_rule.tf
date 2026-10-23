# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_event_correlation_policy_rule: Manages a Prisma SD-WAN Event Correlation Policy Rule.
#
# Required x_parameters (the parent's ids; the plan fails without them): policy_set_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/event_correlation_policy_rule/example,
# data_sources/event_correlation_policy_rule/filters.
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

resource "prismasdwan_event_correlation_policy_rule" "rule_001" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  name        = "TF Managed Event Rule - 001"
  tags        = ["terraform"]
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  suppress    = "yes" # one of: yes, no, none
  priority    = "p3"  # one of: p1, p2, p3, p4, p5, none

  start_time    = 1770057000000
  end_time      = 1771353000000
  resource_type = "site" # one of: site, element, anynetlink, bgppeer, interface, waninterface, wannetwork, networkpolicyset, ...
  # resource_ids: []
  sub_resource_type = "hub" # one of: spoke, hub, public, private
  event_codes = [
    "APPLICATION_CUSTOM_RULE_CONFLICT",
    "APPLICATION_PERFORMANCE_DEGRADED"
  ]
  escalation_rules = {
    standing_rule = {
      standing_for = 60
      priority     = "p2"
    }
    flap_rule = {
      flap_duration = 10
      flap_rate     = 3
    }
  }
}

resource "prismasdwan_event_correlation_policy_rule" "rule_002" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  name        = "TF Managed Event Rule - 002"
  tags        = ["terraform"]
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  suppress    = "yes" # one of: yes, no, none
  priority    = "p3"  # one of: p1, p2, p3, p4, p5, none

  start_time    = 1770057000000
  end_time      = 1771353000000
  resource_type = "site" # one of: site, element, anynetlink, bgppeer, interface, waninterface, wannetwork, networkpolicyset, ...
  # resource_ids: []
  sub_resource_type = "spoke" # one of: spoke, hub, public, private
  event_codes = [
    "APPLICATION_CUSTOM_RULE_CONFLICT",
    "APPLICATION_PERFORMANCE_DEGRADED"
  ]
  escalation_rules = {
    standing_rule = {
      standing_for = 60
      priority     = "p2"
    }
    flap_rule = {
      flap_duration = 10
      flap_rate     = 3
    }
  }
}

#
# Reading event correlation policy rule objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_event_correlation_policy_rule" "find_by_name" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  filters = {
    "name" = prismasdwan_event_correlation_policy_rule.rule_001.name
  }
  depends_on = [prismasdwan_event_correlation_policy_rule.rule_001]
}

# by id
data "prismasdwan_event_correlation_policy_rule" "find_by_id" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  filters = {
    "id" = prismasdwan_event_correlation_policy_rule.rule_001.id
  }
  depends_on = [prismasdwan_event_correlation_policy_rule.rule_001]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_event_correlation_policy_rule" "find_by_tags_member" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_event_correlation_policy_rule.rule_001]
}

# by a value in the event_codes list (gjson query: <list>.#(=="value"))
data "prismasdwan_event_correlation_policy_rule" "find_by_event_codes_member" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  filters = {
    "event_codes.#(==\"APPLICATION_CUSTOM_RULE_CONFLICT\")" = "APPLICATION_CUSTOM_RULE_CONFLICT"
  }
  depends_on = [prismasdwan_event_correlation_policy_rule.rule_001]
}

output "event_correlation_policy_rule_found" {
  value = [for o in coalesce(data.prismasdwan_event_correlation_policy_rule.find_by_name.items, []) : o.id]
}
