# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_network_context: Manages a Prisma SD-WAN Network Context.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/network_context/example, data_sources/network_context/filters.
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

resource "prismasdwan_network_context" "production_network_context" {
  name        = "prod_environment"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

resource "prismasdwan_network_context" "staging_network_context" {
  name        = "staging_environment"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

resource "prismasdwan_network_context" "development_network_context" {
  name        = "dev_environment"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

#
# Reading network context objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_network_context" "find_by_name" {
  filters = {
    "name" = prismasdwan_network_context.production_network_context.name
  }
  depends_on = [prismasdwan_network_context.production_network_context]
}

# by id
data "prismasdwan_network_context" "find_by_id" {
  filters = {
    "id" = prismasdwan_network_context.production_network_context.id
  }
  depends_on = [prismasdwan_network_context.production_network_context]
}

output "network_context_found" {
  value = [for o in coalesce(data.prismasdwan_network_context.find_by_name.items, []) : o.id]
}
