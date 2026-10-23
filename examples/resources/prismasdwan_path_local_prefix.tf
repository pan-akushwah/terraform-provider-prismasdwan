# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_path_local_prefix: Manages a Prisma SD-WAN Path Local Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/path_local_prefix/example,
# data_sources/path_local_prefix/filters.
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

resource "prismasdwan_path_local_prefix" "example" {
  name        = "dev_network_path"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["dev", "internal", "high_priority"]
}

resource "prismasdwan_path_local_prefix" "test_np_path_local_2" {
  name        = "prod_datacenter_path"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["prod", "datacenter", "critical"]
}

resource "prismasdwan_path_local_prefix" "test_np_path_local_3" {
  name        = "qa_testing_path"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["qa", "testing", "temporary"]
}

#
# Reading path local prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_path_local_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_path_local_prefix.example.name
  }
  depends_on = [prismasdwan_path_local_prefix.example]
}

# by id
data "prismasdwan_path_local_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_path_local_prefix.example.id
  }
  depends_on = [prismasdwan_path_local_prefix.example]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_path_local_prefix" "find_by_tags_member" {
  filters = {
    "tags.#(==\"dev\")" = "dev"
  }
  depends_on = [prismasdwan_path_local_prefix.example]
}

output "path_local_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_path_local_prefix.find_by_name.items, []) : o.id]
}
