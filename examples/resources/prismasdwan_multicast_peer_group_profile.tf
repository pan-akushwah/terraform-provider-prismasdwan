# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "multicast_peer_group_profile"
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

# A data-center (HUB) site to peer with.
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
  tags        = ["ipsum", "lorem"]
  peer_sites = [
    {
      peer_site_id = prismasdwan_site.dc_site.id
    }
  ]
  is_source_site_receiver = true
}
