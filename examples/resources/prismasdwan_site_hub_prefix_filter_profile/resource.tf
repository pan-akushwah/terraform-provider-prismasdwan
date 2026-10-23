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
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  path_prefix_filter_list = [{
    path_prefix_filters = [{
      ipv4_prefix = "Lorem-Ipsum"
      ipv6_prefix = "Lorem-Ipsum"
      order = 1234
      permit = true
    }]
    vrf_context_id = "123456789"
  }]
  tags = ["lorem"]
}
