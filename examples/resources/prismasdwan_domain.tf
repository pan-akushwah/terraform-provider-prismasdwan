# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_domain: Manages a Prisma SD-WAN Domain.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/domain/example, data_sources/domain/filters.
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

resource "prismasdwan_domain" "example" {
  name        = "marketing_domain"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  is_default  = false
}

resource "prismasdwan_domain" "engineering" {
  name        = "engineering_domain"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  is_default  = false
}

resource "prismasdwan_domain" "finance" {
  name        = "finance_domain"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  is_default  = false
}

#
# Reading domain objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_domain" "find_by_name" {
  filters = {
    "name" = prismasdwan_domain.example.name
  }
  depends_on = [prismasdwan_domain.example]
}

# by id
data "prismasdwan_domain" "find_by_id" {
  filters = {
    "id" = prismasdwan_domain.example.id
  }
  depends_on = [prismasdwan_domain.example]
}

output "domain_found" {
  value = [for o in coalesce(data.prismasdwan_domain.find_by_name.items, []) : o.id]
}
