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
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_site_wan_multicast_configuration" "site_1_multicast_config" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
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
