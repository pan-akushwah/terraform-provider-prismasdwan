# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_path_group: Manages a Prisma SD-WAN Path Group.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/path_group/example, data_sources/path_group/filters.
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

resource "prismasdwan_path_group" "example" {
  name        = "tf example path group"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  paths = [
    {
      label     = "private-1"
      path_type = "vpn"
    },
    {
      label     = "public-1"
      path_type = "direct"
    }
  ]
}

#
# Reading path group objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_path_group" "find_by_name" {
  filters = {
    "name" = prismasdwan_path_group.example.name
  }
  depends_on = [prismasdwan_path_group.example]
}

# by id
data "prismasdwan_path_group" "find_by_id" {
  filters = {
    "id" = prismasdwan_path_group.example.id
  }
  depends_on = [prismasdwan_path_group.example]
}

output "path_group_found" {
  value = [for o in coalesce(data.prismasdwan_path_group.find_by_name.items, []) : o.id]
}
