# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_vrf_context: Manages a Prisma SD-WAN Vrf Context.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/vrf_context/example, data_sources/vrf_context/filters.
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

resource "prismasdwan_vrf_context" "test_vrf_context_1" {
  name        = "example_vrf_context"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example", "terraform"]
}

#
# Reading vrf context objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_vrf_context" "find_by_name" {
  filters = {
    "name" = prismasdwan_vrf_context.test_vrf_context_1.name
  }
  depends_on = [prismasdwan_vrf_context.test_vrf_context_1]
}

# by id
data "prismasdwan_vrf_context" "find_by_id" {
  filters = {
    "id" = prismasdwan_vrf_context.test_vrf_context_1.id
  }
  depends_on = [prismasdwan_vrf_context.test_vrf_context_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_vrf_context" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_vrf_context.test_vrf_context_1]
}

output "vrf_context_found" {
  value = [for o in coalesce(data.prismasdwan_vrf_context.find_by_name.items, []) : o.id]
}
