# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_global_prefix".
# This file is generated - do not edit by hand.
#
# Before using this example, configure the Prisma SD-WAN provider:
#
#   terraform {
#     required_providers {
#       prismasdwan = {
#         source  = "paloaltonetworks/prismasdwan"
#       }
#     }
#   }
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

resource "prismasdwan_path_global_prefix" "example" {
  description   = "Managed by Terraform"
  ipv4_prefixes = ["10.10.0.0/16"]
  ipv6_prefixes = ["2001:db8:10::/48"]
  name          = "example_name"
  tags          = ["terraform"]
}
