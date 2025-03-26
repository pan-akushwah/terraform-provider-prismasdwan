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
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_site_hub_prefix_filter_profile" "hub_prefix_filter_profile_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_2.id
  }
  name = "example profile for hub site"
  description = "sample description"
  tags = ["tag1", "tag2"]
  path_prefix_filter_list = [
    {
      vrf_context_id = prismasdwan_vrf_context.test_vrf_context_1.id
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
    },
    {
      vrf_context_id = prismasdwan_vrf_context.test_vrf_context_2.id
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
