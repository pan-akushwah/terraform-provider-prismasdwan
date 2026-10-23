# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_ipfix_global_prefix: Manages a Prisma SD-WAN Ipfix Global Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/ipfix_global_prefix/example,
# data_sources/ipfix_global_prefix/filters.
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

resource "prismasdwan_ipfix_global_prefix" "example_ipfix_global" {
  name          = "example_global_prefix"
  description   = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags          = ["example"]
  ipv4_prefixes = ["192.168.1.0/24"]
}

#
# Reading ipfix global prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_ipfix_global_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_ipfix_global_prefix.example_ipfix_global.name
  }
  depends_on = [prismasdwan_ipfix_global_prefix.example_ipfix_global]
}

# by id
data "prismasdwan_ipfix_global_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_ipfix_global_prefix.example_ipfix_global.id
  }
  depends_on = [prismasdwan_ipfix_global_prefix.example_ipfix_global]
}

# by a value in the ipv4_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipfix_global_prefix" "find_by_ipv4_prefixes_member" {
  filters = {
    "ipv4_prefixes.#(==\"192.168.1.0/24\")" = "192.168.1.0/24"
  }
  depends_on = [prismasdwan_ipfix_global_prefix.example_ipfix_global]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipfix_global_prefix" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_ipfix_global_prefix.example_ipfix_global]
}

output "ipfix_global_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_ipfix_global_prefix.find_by_name.items, []) : o.id]
}
