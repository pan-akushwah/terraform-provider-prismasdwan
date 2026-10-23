# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_qos_policy_global_prefix: Manages a Prisma SD-WAN Qos Policy Global Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/qos_policy_global_prefix/example,
# data_sources/qos_policy_global_prefix/filters.
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

resource "prismasdwan_qos_policy_global_prefix" "test_qos_global_prefix" {
  name          = "example_qos_global_policy"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["example_tag"]
  ipv6_prefixes = ["fd10:586e:b3f0::/48"]
  ipv4_prefixes = ["10.10.10.0/24"]
}

#
# Reading qos policy global prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_qos_policy_global_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_qos_policy_global_prefix.test_qos_global_prefix.name
  }
  depends_on = [prismasdwan_qos_policy_global_prefix.test_qos_global_prefix]
}

# by id
data "prismasdwan_qos_policy_global_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_qos_policy_global_prefix.test_qos_global_prefix.id
  }
  depends_on = [prismasdwan_qos_policy_global_prefix.test_qos_global_prefix]
}

# by a value in the ipv6_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_qos_policy_global_prefix" "find_by_ipv6_prefixes_member" {
  filters = {
    "ipv6_prefixes.#(==\"fd10:586e:b3f0::/48\")" = "fd10:586e:b3f0::/48"
  }
  depends_on = [prismasdwan_qos_policy_global_prefix.test_qos_global_prefix]
}

# by a value in the ipv4_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_qos_policy_global_prefix" "find_by_ipv4_prefixes_member" {
  filters = {
    "ipv4_prefixes.#(==\"10.10.10.0/24\")" = "10.10.10.0/24"
  }
  depends_on = [prismasdwan_qos_policy_global_prefix.test_qos_global_prefix]
}

output "qos_policy_global_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_qos_policy_global_prefix.find_by_name.items, []) : o.id]
}
