# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_prefix_filter_profile"
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

#
# we need to work on DC Site
#
#
# Create Profile
# A data-center (HUB) site for the filter profile
resource "prismasdwan_site" "dc_site" {
  name                 = "tf hub prefix filter dc site"
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

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

resource "prismasdwan_site_hub_prefix_filter_profile" "hub_prefix_filter_profile_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  name        = "tf managed hub prefix filter profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  path_prefix_filter_list = [
    {
      vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
      path_prefix_filters = [
        {
          "order" : 1,
          "permit" : true,
          "ipv4_prefix" : "10.10.10.0/24"
        },
        {
          "order" : 2,
          "permit" : false,
          "ipv4_prefix" : "13.13.13.0/24"
        }
      ]
    }
  ]
}
