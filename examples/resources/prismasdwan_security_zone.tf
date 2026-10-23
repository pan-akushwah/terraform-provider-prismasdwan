# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_security_zone: Manages a Prisma SD-WAN Security Zone.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/security_zone/example, data_sources/security_zone/filters.
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

resource "prismasdwan_security_zone" "production_zone" {
  name              = "production_security_zone"
  description       = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tcp_allow_non_syn = false
}

resource "prismasdwan_security_zone" "development_zone" {
  name              = "development_security_zone"
  description       = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tcp_allow_non_syn = true
}

resource "prismasdwan_security_zone" "dmz_zone" {
  name              = "dmz_security_zone"
  description       = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tcp_allow_non_syn = false
}

#
# Reading security zone objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_security_zone" "find_by_name" {
  filters = {
    "name" = prismasdwan_security_zone.production_zone.name
  }
  depends_on = [prismasdwan_security_zone.production_zone]
}

# by id
data "prismasdwan_security_zone" "find_by_id" {
  filters = {
    "id" = prismasdwan_security_zone.production_zone.id
  }
  depends_on = [prismasdwan_security_zone.production_zone]
}

output "security_zone_found" {
  value = [for o in coalesce(data.prismasdwan_security_zone.find_by_name.items, []) : o.id]
}
