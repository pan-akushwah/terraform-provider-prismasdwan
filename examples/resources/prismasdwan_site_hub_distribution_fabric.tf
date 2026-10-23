# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_hub_distribution_fabric: Manages a Prisma SD-WAN Site Hub Distribution Fabric.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_hub_distribution_fabric/example,
# data_sources/site_hub_distribution_fabric/filters.
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

resource "prismasdwan_site" "site_2" {
  name                 = "tf site 2 for example"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "HUB"
  address = {
    city    = "Santa Clara"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.9552
    latitude  = 37.3541
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

resource "prismasdwan_site_hub_distribution_fabric" "hub_site_distribution_fabric_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_2.id
  }
  spoke_site_ids = [
    prismasdwan_site.site_1.id
  ]
}

#
# Reading site hub distribution fabric objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_hub_distribution_fabric" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_2.id
  }
  filters = {
    "id" = prismasdwan_site_hub_distribution_fabric.hub_site_distribution_fabric_1.id
  }
  depends_on = [prismasdwan_site_hub_distribution_fabric.hub_site_distribution_fabric_1]
}

output "site_hub_distribution_fabric_found" {
  value = [for o in coalesce(data.prismasdwan_site_hub_distribution_fabric.find_by_id.items, []) : o.id]
}
