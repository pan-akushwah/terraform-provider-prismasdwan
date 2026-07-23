# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_security_policy_local_prefix"
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

resource "prismasdwan_site_security_policy_local_prefix" "example_security_policy_local_prefix" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  prefix_id = prismasdwan_security_policy_local_prefix.test_security_local_prefix.id
  ipv4_prefixes = [
    "10.11.12.13/32"
  ]
}