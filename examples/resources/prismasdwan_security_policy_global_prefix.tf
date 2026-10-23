# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_security_policy_global_prefix: Manages a Prisma SD-WAN Security Policy Global Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Prefixes must be network addresses: 2620:0:2d0::/48 is valid, 2620:0:2d0::/40 is rejected (bits set beyond the
#     prefix length).
#
# Tested end to end by the provider suite: resources/security_policy_global_prefix/example,
# data_sources/security_policy_global_prefix/filters.
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

resource "prismasdwan_security_policy_global_prefix" "corporate_security_global_prefix" {
  name          = "corporate_security_global_prefix"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["corporate", "security"]
  ipv4_prefixes = ["192.168.0.0/16"]
  ipv6_prefixes = ["2001:db8::/32"]
}

resource "prismasdwan_security_policy_global_prefix" "branch_office_security_global_prefix" {
  name          = "branch_office_security_global_prefix"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["branch", "security"]
  ipv4_prefixes = ["172.16.0.0/12"]
  ipv6_prefixes = ["2620:0:2d0::/48"]
}

resource "prismasdwan_security_policy_global_prefix" "data_center_security_global_prefix" {
  name          = "data_center_security_global_prefix"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["data_center", "security"]
  ipv4_prefixes = ["10.0.0.0/8"]
  ipv6_prefixes = ["2a00::/16"]
}

#
# Reading security policy global prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_security_policy_global_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_security_policy_global_prefix.corporate_security_global_prefix.name
  }
  depends_on = [prismasdwan_security_policy_global_prefix.corporate_security_global_prefix]
}

# by id
data "prismasdwan_security_policy_global_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_security_policy_global_prefix.corporate_security_global_prefix.id
  }
  depends_on = [prismasdwan_security_policy_global_prefix.corporate_security_global_prefix]
}

# by a value in the ipv4_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_security_policy_global_prefix" "find_by_ipv4_prefixes_member" {
  filters = {
    "ipv4_prefixes.#(==\"192.168.0.0/16\")" = "192.168.0.0/16"
  }
  depends_on = [prismasdwan_security_policy_global_prefix.corporate_security_global_prefix]
}

# by a value in the ipv6_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_security_policy_global_prefix" "find_by_ipv6_prefixes_member" {
  filters = {
    "ipv6_prefixes.#(==\"2001:db8::/32\")" = "2001:db8::/32"
  }
  depends_on = [prismasdwan_security_policy_global_prefix.corporate_security_global_prefix]
}

output "security_policy_global_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_security_policy_global_prefix.find_by_name.items, []) : o.id]
}
