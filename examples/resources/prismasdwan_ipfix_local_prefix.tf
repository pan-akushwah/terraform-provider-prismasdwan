# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_ipfix_local_prefix: Manages a Prisma SD-WAN Ipfix Local Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/ipfix_local_prefix/example,
# data_sources/ipfix_local_prefix/filters.
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

resource "prismasdwan_ipfix_local_prefix" "example_ipfix_local" {
  name        = "sample_ipfix_local"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example_tag"]
}

#
# Reading ipfix local prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_ipfix_local_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_ipfix_local_prefix.example_ipfix_local.name
  }
  depends_on = [prismasdwan_ipfix_local_prefix.example_ipfix_local]
}

# by id
data "prismasdwan_ipfix_local_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_ipfix_local_prefix.example_ipfix_local.id
  }
  depends_on = [prismasdwan_ipfix_local_prefix.example_ipfix_local]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipfix_local_prefix" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example_tag\")" = "example_tag"
  }
  depends_on = [prismasdwan_ipfix_local_prefix.example_ipfix_local]
}

output "ipfix_local_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_ipfix_local_prefix.find_by_name.items, []) : o.id]
}
