# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_prefix_filter_profile".
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

resource "prismasdwan_site_hub_prefix_filter_profile" "example" {
  description = "Managed by Terraform"
  name        = "example_name"
  path_prefix_filter_list = [{
    path_prefix_filters = [{
      ipv4_prefix = "10.10.0.0/16"
      ipv6_prefix = "2001:db8:10::/48"
      order       = 1
      permit      = false
    }]
    vrf_context_id = "<vrf_context_id>"
  }]
  tags = ["terraform"]
}
