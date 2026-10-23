# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_prefix_filter_association"
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

# Two data-center (hub) sites: the filter profile and association live on dc_site, which peers with peer_hub_site.
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
