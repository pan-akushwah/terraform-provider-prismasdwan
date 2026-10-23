# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_qos_policy_set: Manages a Prisma SD-WAN Qos Policy Set.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/qos_policy_set/example, data_sources/qos_policy_set/filters.
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

resource "prismasdwan_qos_policy_set" "test_qos_policy_set_1" {
  name                  = "qos policy set 001"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["example", "tag"]
  defaultrule_policyset = false
  bandwidth_allocation_schemes = [
    {
      bandwidth_range = {
        low  = 0
        high = 10000
      }
      business_priorities = [
        {
          priority_number      = 1
          bandwidth_allocation = 50
          bandwidth_split_per_type = {
            rt_audio      = 30
            rt_video      = 20
            transactional = 30
            bulk          = 20
          }
        },
        {
          priority_number      = 2
          bandwidth_allocation = 25
          bandwidth_split_per_type = {
            rt_audio      = 30
            rt_video      = 20
            transactional = 30
            bulk          = 20
          }
        },
        {
          priority_number      = 3
          bandwidth_allocation = 15
          bandwidth_split_per_type = {
            rt_audio      = 30
            rt_video      = 20
            transactional = 30
            bulk          = 20
          }
        },
        {
          priority_number      = 4
          bandwidth_allocation = 10
          bandwidth_split_per_type = {
            rt_audio      = 30
            rt_video      = 20
            transactional = 30
            bulk          = 20
          }
        }
      ]
    }
  ]
  business_priority_names = [
    {
      priority_number = 1
      priority_name   = "Platinum"
    },
    {
      priority_number = 2
      priority_name   = "Gold"
    },
    {
      priority_number = 3
      priority_name   = "Silver"
    },
    {
      priority_number = 4
      priority_name   = "Bronze"
    }
  ]
  template = false
}

#
# Reading qos policy set objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_qos_policy_set" "find_by_name" {
  filters = {
    "name" = prismasdwan_qos_policy_set.test_qos_policy_set_1.name
  }
  depends_on = [prismasdwan_qos_policy_set.test_qos_policy_set_1]
}

# by id
data "prismasdwan_qos_policy_set" "find_by_id" {
  filters = {
    "id" = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  depends_on = [prismasdwan_qos_policy_set.test_qos_policy_set_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_qos_policy_set" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_qos_policy_set.test_qos_policy_set_1]
}

output "qos_policy_set_found" {
  value = [for o in coalesce(data.prismasdwan_qos_policy_set.find_by_name.items, []) : o.id]
}
