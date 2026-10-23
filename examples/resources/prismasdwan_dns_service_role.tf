# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_dns_service_role: Manages a Prisma SD-WAN Dns Service Role.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Names may not contain hyphens; use underscores.
#
# Tested end to end by the provider suite: resources/dns_service_role/example,
# data_sources/dns_service_role/filters.
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

resource "prismasdwan_dns_service_role" "example" {
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  name        = "TfManagedDNSServiceRole"
  tags        = ["Terraform-Managed"]
}

#
# Reading dns service role objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_dns_service_role" "find_by_name" {
  filters = {
    "name" = prismasdwan_dns_service_role.example.name
  }
  depends_on = [prismasdwan_dns_service_role.example]
}

# by id
data "prismasdwan_dns_service_role" "find_by_id" {
  filters = {
    "id" = prismasdwan_dns_service_role.example.id
  }
  depends_on = [prismasdwan_dns_service_role.example]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_dns_service_role" "find_by_tags_member" {
  filters = {
    "tags.#(==\"Terraform-Managed\")" = "Terraform-Managed"
  }
  depends_on = [prismasdwan_dns_service_role.example]
}

output "dns_service_role_found" {
  value = [for o in coalesce(data.prismasdwan_dns_service_role.find_by_name.items, []) : o.id]
}
