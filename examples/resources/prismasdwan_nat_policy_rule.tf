# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_nat_policy_rule: Manages a Prisma SD-WAN Nat Policy Rule.
#
# Required x_parameters (the parent's ids; the plan fails without them): nat_policy_set_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/nat_policy_rule/example, data_sources/nat_policy_rule/filters.
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

resource "prismasdwan_nat_local_prefix" "destination_prefix" {
  name        = "example_nat_destination_prefix"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

resource "prismasdwan_nat_policy_rule" "test_nat_policy_rule_1" {
  # This is needed for path parameters
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.example_nat_policy_set.id
  }
  name        = "example_test_nat_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["sample", "tags"]
  source_ports = [
    {
      to   = 512
      from = 256
    },
    {
      to   = 1024
      from = 513
    }
  ]
  destination_ports = [
    {
      to   = 120
      from = 111
    },
    {
      to   = 300
      from = 200
    }
  ]
  protocol = 6
  actions = [
    {
      type        = "source_nat_dynamic"
      nat_pool_id = prismasdwan_nat_policy_pool.example_pool.id
    },
    {
      type        = "destination_nat_dynamic"
      nat_pool_id = prismasdwan_nat_policy_pool.example_pool.id
      port        = 520
    },
    {
      type        = "source_nat_static"
      nat_pool_id = prismasdwan_nat_policy_pool.example_pool.id
    },
    {
      type        = "destination_nat_static"
      nat_pool_id = prismasdwan_nat_policy_pool.example_pool.id
      port        = 235
    }
  ]
  source_prefixes_id      = prismasdwan_nat_local_prefix.test_nat_local_prefix_01.id
  destination_prefixes_id = prismasdwan_nat_local_prefix.destination_prefix.id
  source_zone_id          = prismasdwan_nat_zone.test_nat_zone.id
  enabled                 = true
}

#
# Reading nat policy rule objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_nat_policy_rule" "find_by_name" {
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.example_nat_policy_set.id
  }
  filters = {
    "name" = prismasdwan_nat_policy_rule.test_nat_policy_rule_1.name
  }
  depends_on = [prismasdwan_nat_policy_rule.test_nat_policy_rule_1]
}

# by id
data "prismasdwan_nat_policy_rule" "find_by_id" {
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.example_nat_policy_set.id
  }
  filters = {
    "id" = prismasdwan_nat_policy_rule.test_nat_policy_rule_1.id
  }
  depends_on = [prismasdwan_nat_policy_rule.test_nat_policy_rule_1]
}

# by a reference: every object with this source_prefixes_id
data "prismasdwan_nat_policy_rule" "find_by_source_prefixes_id" {
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.example_nat_policy_set.id
  }
  filters = {
    "source_prefixes_id" = prismasdwan_nat_policy_rule.test_nat_policy_rule_1.source_prefixes_id
  }
  depends_on = [prismasdwan_nat_policy_rule.test_nat_policy_rule_1]
}

# by a reference: every object with this destination_prefixes_id
data "prismasdwan_nat_policy_rule" "find_by_destination_prefixes_id" {
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.example_nat_policy_set.id
  }
  filters = {
    "destination_prefixes_id" = prismasdwan_nat_policy_rule.test_nat_policy_rule_1.destination_prefixes_id
  }
  depends_on = [prismasdwan_nat_policy_rule.test_nat_policy_rule_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_nat_policy_rule" "find_by_tags_member" {
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.example_nat_policy_set.id
  }
  filters = {
    "tags.#(==\"sample\")" = "sample"
  }
  depends_on = [prismasdwan_nat_policy_rule.test_nat_policy_rule_1]
}

output "nat_policy_rule_found" {
  value = [for o in coalesce(data.prismasdwan_nat_policy_rule.find_by_name.items, []) : o.id]
}
