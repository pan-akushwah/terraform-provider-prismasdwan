# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_hub_prefix_filter_association: Manages a Prisma SD-WAN Site Hub Prefix Filter Association.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The association lives on a hub (or branch-gateway) site, and its peers must be hub sites.
#
# Tested end to end by the provider suite: resources/site_hub_prefix_filter_association/example,
# data_sources/site_hub_prefix_filter_association/filters.
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

resource "prismasdwan_site" "dc_site" {
  name                 = "tf prefix filter association dc site"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "HUB"
  address = {
    city    = "San Jose"
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

resource "prismasdwan_site" "peer_hub_site" {
  name                 = "tf prefix filter association peer hub site"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "HUB"
  address = {
    city    = "San Jose"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -122.0322
    latitude  = 37.3688
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

# Apply the hub prefix filter profile from the prismasdwan_site_hub_prefix_filter_profile example towards the peer hub
resource "prismasdwan_site_hub_prefix_filter_association" "example" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  name                               = "tf example prefix filter association"
  description                        = "Managed by Prisma SDWAN Terraform IaaC Provider"
  path_prefix_distribution_filter_id = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_1.id
  peer_site_ids                      = [prismasdwan_site.peer_hub_site.id] # peers must be hub sites
}

#
# Reading site hub prefix filter association objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_site_hub_prefix_filter_association" "find_by_name" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  filters = {
    "name" = prismasdwan_site_hub_prefix_filter_association.example.name
  }
  depends_on = [prismasdwan_site_hub_prefix_filter_association.example]
}

# by id
data "prismasdwan_site_hub_prefix_filter_association" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  filters = {
    "id" = prismasdwan_site_hub_prefix_filter_association.example.id
  }
  depends_on = [prismasdwan_site_hub_prefix_filter_association.example]
}

# by a reference: every object with this path_prefix_distribution_filter_id
data "prismasdwan_site_hub_prefix_filter_association" "find_by_path_prefix_distribution_filter_id" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  filters = {
    "path_prefix_distribution_filter_id" = prismasdwan_site_hub_prefix_filter_association.example.path_prefix_distribution_filter_id
  }
  depends_on = [prismasdwan_site_hub_prefix_filter_association.example]
}

output "site_hub_prefix_filter_association_found" {
  value = [for o in coalesce(data.prismasdwan_site_hub_prefix_filter_association.find_by_name.items, []) : o.id]
}
