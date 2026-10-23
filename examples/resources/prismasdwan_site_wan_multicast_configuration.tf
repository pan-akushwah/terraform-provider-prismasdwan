# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_wan_multicast_configuration: Manages a Prisma SD-WAN Site Wan Multicast Configuration.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The site must be attached to a multicast peer group first.
#   - To destroy, first remove this resource and the site's multicast_peer_group_id in one apply: the API won't
#     delete a site that still has a peer group attached.
#
# Tested end to end by the provider suite: resources/site_wan_multicast_configuration/example,
# data_sources/site_wan_multicast_configuration/filters.
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
  name                 = "tf multicast source dc site"
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

# A multicast source site must be attached to a peer group profile before it can be configured.
resource "prismasdwan_multicast_peer_group_profile" "peer_group" {
  name                    = "tf multicast source peer group"
  description             = "Managed by Prisma SDWAN Terraform IaaC Provider"
  is_source_site_receiver = true
  peer_sites = [
    {
      peer_site_id = prismasdwan_site.dc_site.id
    }
  ]
}

# A branch site to configure.
resource "prismasdwan_site" "branch_site" {
  name                 = "tf multicast branch site"
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
  multicast_peer_group_id                   = prismasdwan_multicast_peer_group_profile.peer_group.id
}

#
# Only one can be created per site.
# If the configuration already exists, import and then start managing it
#
# The site must be attached to a multicast peer group before this can be created. To destroy, first remove this
# resource and the site's multicast_peer_group_id in one apply: the API won't delete a site that still has a peer
# group attached.
#
resource "prismasdwan_site_wan_multicast_configuration" "site_wan_multicast_config" {
  # the site has to be attached to the peer group first
  depends_on = [prismasdwan_multicast_peer_group_profile.peer_group]

  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  site_configs = [
    {
      group_ipv4_prefix   = "235.0.0.0/16"
      source_ipv4_address = "13.10.10.2"
    },
    {
      group_ipv4_prefix   = "224.5.0.0/16"
      source_ipv4_address = "13.10.10.3"
    }
  ]
}

#
# Reading site wan multicast configuration objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_wan_multicast_configuration" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  filters = {
    "id" = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_config.id
  }
  depends_on = [prismasdwan_site_wan_multicast_configuration.site_wan_multicast_config]
}

output "site_wan_multicast_configuration_found" {
  value = [for o in coalesce(data.prismasdwan_site_wan_multicast_configuration.find_by_id.items, []) : o.id]
}
