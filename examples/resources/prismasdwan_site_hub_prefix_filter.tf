# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_prefix_filter"
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

# A minimal site for this example.
resource "prismasdwan_site" "branch_site" {
  name                 = "tf hub prefix filter branch site"
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

# Give the site its own prefixes for the local prefix filter from the prismasdwan_local_prefix_filter example
resource "prismasdwan_site_hub_prefix_filter" "example" {
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  prefix_filter_id = prismasdwan_local_prefix_filter.example.id
  filters = [
    {
      type        = "ipv4"
      ip_prefixes = ["10.40.0.0/16"]
    }
  ]
}
