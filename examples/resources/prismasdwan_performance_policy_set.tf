# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_performance_policy_set: Manages a Prisma SD-WAN Performance Policy Set.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/performance_policy_set/example,
# data_sources/performance_policy_set/filters.
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

resource "prismasdwan_performance_policy_set" "performance_policy_set_1" {
  name                  = "example_performance_set_alpha"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["terraform"]
  defaultrule_policyset = false
}

#
# Reading performance policy set objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_performance_policy_set" "find_by_name" {
  filters = {
    "name" = prismasdwan_performance_policy_set.performance_policy_set_1.name
  }
  depends_on = [prismasdwan_performance_policy_set.performance_policy_set_1]
}

# by id
data "prismasdwan_performance_policy_set" "find_by_id" {
  filters = {
    "id" = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  depends_on = [prismasdwan_performance_policy_set.performance_policy_set_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_performance_policy_set" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_performance_policy_set.performance_policy_set_1]
}

output "performance_policy_set_found" {
  value = [for o in coalesce(data.prismasdwan_performance_policy_set.find_by_name.items, []) : o.id]
}
