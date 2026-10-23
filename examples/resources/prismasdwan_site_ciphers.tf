# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_ciphers: Manages a Prisma SD-WAN Site Ciphers.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Every site has exactly one cipher configuration, created and deleted with the site. This resource takes over
#     the existing one (there is no create) and destroying it only stops managing it.
#   - Delete the site to delete its ciphers (tested by resources/site_ciphers/site_lifecycle).
#
# Tested end to end by the provider suite: resources/site_ciphers/example, resources/site_ciphers/site_lifecycle,
# data_sources/site_ciphers/filters.
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

resource "prismasdwan_site" "site_1" {
  name                 = "tf site 1 for example"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "SPOKE"
  address = {
    city    = "San Jose"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.8863
    latitude  = 37.3382
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

resource "prismasdwan_site_ciphers" "site_ciphers_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  vpn_ciphers = [
    "AES_256_GCM",
    "AES_256_CBC",
    "AES_128_GCM",
    "AES_128_CBC"
  ]
  controller_connection_cipher = "RSA-AES256-GCM-SHA384" # one of: RSA-AES256-GCM-SHA384, RSA-AES128-GCM-SHA256
}

#
# Reading site ciphers objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_ciphers" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "id" = prismasdwan_site_ciphers.site_ciphers_1.id
  }
  depends_on = [prismasdwan_site_ciphers.site_ciphers_1]
}

# by a value in the vpn_ciphers list (gjson query: <list>.#(=="value"))
data "prismasdwan_site_ciphers" "find_by_vpn_ciphers_member" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "vpn_ciphers.#(==\"AES_256_GCM\")" = "AES_256_GCM"
  }
  depends_on = [prismasdwan_site_ciphers.site_ciphers_1]
}

output "site_ciphers_found" {
  value = [for o in coalesce(data.prismasdwan_site_ciphers.find_by_id.items, []) : o.id]
}
