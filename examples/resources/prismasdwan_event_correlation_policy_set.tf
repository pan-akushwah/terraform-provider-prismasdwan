# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_event_correlation_policy_set: Manages a Prisma SD-WAN Event Correlation Policy Set.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/event_correlation_policy_set/example,
# data_sources/event_correlation_policy_set/filters.
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

resource "prismasdwan_event_correlation_policy_set" "set001" {
  name             = "Terraform Managed Policy Set"
  description      = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags             = ["terraform"]
  active_policyset = false
  severity_priority_mapping = [
    {
      severity = "critical"
      priority = "p2"
    },
    {
      severity = "major"
      priority = "p3"
    },
    {
      severity = "minor"
      priority = "p4"
    }
  ]
}

#
# Reading event correlation policy set objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_event_correlation_policy_set" "find_by_name" {
  filters = {
    "name" = prismasdwan_event_correlation_policy_set.set001.name
  }
  depends_on = [prismasdwan_event_correlation_policy_set.set001]
}

# by id
data "prismasdwan_event_correlation_policy_set" "find_by_id" {
  filters = {
    "id" = prismasdwan_event_correlation_policy_set.set001.id
  }
  depends_on = [prismasdwan_event_correlation_policy_set.set001]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_event_correlation_policy_set" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_event_correlation_policy_set.set001]
}

output "event_correlation_policy_set_found" {
  value = [for o in coalesce(data.prismasdwan_event_correlation_policy_set.find_by_name.items, []) : o.id]
}
