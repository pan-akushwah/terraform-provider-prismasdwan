# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_multicast_peer_group_profile: Manages a Prisma SD-WAN Multicast Peer Group Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/multicast_peer_group_profile/example,
# data_sources/multicast_peer_group_profile/filters.
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
  name                 = "tf multicast dc site"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "HUB"
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

resource "prismasdwan_multicast_peer_group_profile" "multicast_peer_group_profile" {
  name        = "tf managed profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example", "terraform"]
  peer_sites = [
    {
      peer_site_id = prismasdwan_site.dc_site.id
    }
  ]
  is_source_site_receiver = true
}

#
# Reading multicast peer group profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_multicast_peer_group_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile.name
  }
  depends_on = [prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile]
}

# by id
data "prismasdwan_multicast_peer_group_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile.id
  }
  depends_on = [prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_multicast_peer_group_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile]
}

output "multicast_peer_group_profile_found" {
  value = [for o in coalesce(data.prismasdwan_multicast_peer_group_profile.find_by_name.items, []) : o.id]
}
