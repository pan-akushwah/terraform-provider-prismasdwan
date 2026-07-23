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
resource "prismasdwan_resource_locator" "dc_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "tf data center"
}

#
# Profile will need an existing VRF Profile
#
resource "prismasdwan_resource_locator" "default_vrf_context_profile" {
  resource_type     = "prismasdwan_vrf_context_profile"
  resource_property = "name"
  resource_property_value = "Global Profile"
}

#
# Create Profile
resource "prismasdwan_site_hub_prefix_filter_profile" "hub_prefix_filter_profile_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_resource_locator.dc_site.result
  }
  name        = "tf managed hub prefix filter profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  path_prefix_filter_list = [
    {
      vrf_context_id = prismasdwan_resource_locator.default_vrf_context_profile.id
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
