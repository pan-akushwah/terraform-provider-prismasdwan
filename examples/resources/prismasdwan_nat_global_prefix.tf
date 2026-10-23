# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_nat_global_prefix: Manages a Prisma SD-WAN Nat Global Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/nat_global_prefix/example,
# data_sources/nat_global_prefix/filters.
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

resource "prismasdwan_nat_global_prefix" "example" {
  name        = "Terraform Managed Global Prefix"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform"]
  ipv4_prefixes = [
    "192.169.0.0/16"
  ]
}

#
# Reading nat global prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_nat_global_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_nat_global_prefix.example.name
  }
  depends_on = [prismasdwan_nat_global_prefix.example]
}

# by id
data "prismasdwan_nat_global_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_nat_global_prefix.example.id
  }
  depends_on = [prismasdwan_nat_global_prefix.example]
}

# by a value in the ipv4_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_nat_global_prefix" "find_by_ipv4_prefixes_member" {
  filters = {
    "ipv4_prefixes.#(==\"192.169.0.0/16\")" = "192.169.0.0/16"
  }
  depends_on = [prismasdwan_nat_global_prefix.example]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_nat_global_prefix" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_nat_global_prefix.example]
}

output "nat_global_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_nat_global_prefix.find_by_name.items, []) : o.id]
}
