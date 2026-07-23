# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_distribution_fabric"
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

resource "prismasdwan_site_hub_distribution_fabric" "hub_site_distribution_fabric_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_2.id
  }
  spoke_site_ids = [
    prismasdwan_site.site_1.id
  ]
}
