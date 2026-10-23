# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_security_zone: Manages a Prisma SD-WAN Site Security Zone.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_security_zone/example,
# data_sources/site_security_zone/filters.
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

resource "prismasdwan_site_security_zone" "site_security_zone_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  zone_id = prismasdwan_security_zone.dmz_zone.id # from the prismasdwan_security_zone example
  networks = [
    {
      network_id   = prismasdwan_site_lan_network.site_lan_network_1.id
      network_type = "lan_network"
    },
    {
      network_id   = prismasdwan_site_wan_interface.site_wan_interface_1.id
      network_type = "wan_network"
    }
  ]
}

#
# Reading site security zone objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_security_zone" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "id" = prismasdwan_site_security_zone.site_security_zone_1.id
  }
  depends_on = [prismasdwan_site_security_zone.site_security_zone_1]
}

# by a reference: every object with this zone_id
data "prismasdwan_site_security_zone" "find_by_zone_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "zone_id" = prismasdwan_site_security_zone.site_security_zone_1.zone_id
  }
  depends_on = [prismasdwan_site_security_zone.site_security_zone_1]
}

output "site_security_zone_found" {
  value = [for o in coalesce(data.prismasdwan_site_security_zone.find_by_id.items, []) : o.id]
}
