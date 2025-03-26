# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_ciphers"
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

resource "prismasdwan_site_ciphers" "site_ciphers_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  vpn_ciphers = [
    "AES_256_GCM",
    "AES_256_CBC",
    "AES_128_GCM",
    "AES_128_CBC"
  ]
  controller_connection_cipher = "RSA-AES256-GCM-SHA384"
}
