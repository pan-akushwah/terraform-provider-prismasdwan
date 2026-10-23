# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_path_global_prefix: Manages a Prisma SD-WAN Path Global Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/path_global_prefix/example,
# data_sources/path_global_prefix/filters.
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

resource "prismasdwan_path_global_prefix" "example_1" {
  name          = "global_prefix_hq"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["hq", "primary"]
  ipv4_prefixes = ["192.168.0.0/16", "172.16.0.0/12"]
  ipv6_prefixes = ["2001:db8::/32", "2001:db8:1::/48"]
}

resource "prismasdwan_path_global_prefix" "example_2" {
  name          = "branch_office_prefix"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["branch", "remote"]
  ipv4_prefixes = ["10.0.0.0/8", "172.31.0.0/16"]
  ipv6_prefixes = ["fd00::/8"]
}

resource "prismasdwan_path_global_prefix" "example_3" {
  name          = "data_center_prefix"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["data_center", "high_security"]
  ipv4_prefixes = ["203.0.113.0/24", "198.51.100.0/24", "192.0.2.0/24"]
  ipv6_prefixes = ["2001:db8:2::/48", "2001:db8:3::/48"]
}

#
# Reading path global prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_path_global_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_path_global_prefix.example_1.name
  }
  depends_on = [prismasdwan_path_global_prefix.example_1]
}

# by id
data "prismasdwan_path_global_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_path_global_prefix.example_1.id
  }
  depends_on = [prismasdwan_path_global_prefix.example_1]
}

# by a value in the ipv4_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_path_global_prefix" "find_by_ipv4_prefixes_member" {
  filters = {
    "ipv4_prefixes.#(==\"192.168.0.0/16\")" = "192.168.0.0/16"
  }
  depends_on = [prismasdwan_path_global_prefix.example_1]
}

# by a value in the ipv6_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_path_global_prefix" "find_by_ipv6_prefixes_member" {
  filters = {
    "ipv6_prefixes.#(==\"2001:db8::/32\")" = "2001:db8::/32"
  }
  depends_on = [prismasdwan_path_global_prefix.example_1]
}

output "path_global_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_path_global_prefix.find_by_name.items, []) : o.id]
}
