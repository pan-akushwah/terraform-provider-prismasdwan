# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_wan_multicast_configuration"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# A data-center (HUB) site the branch peers with.
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
