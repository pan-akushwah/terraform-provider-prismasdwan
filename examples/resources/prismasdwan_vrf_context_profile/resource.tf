# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "vrf_context_profile".
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

resource "prismasdwan_vrf_context_profile" "example" {
  default_vrf_context_profile = true
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  tags = ["lorem"]
  vrf_context_ids = ["Lorem-Ipsum"]
  vrf_context_route_leak_rules = [{
    description = "Lorem-Ipsum"
    dest_vrf_context_id = "123456789"
    ipv4_prefixes = ["Lorem-Ipsum"]
    name = "Lorem-Ipsum"
    src_vrf_context_id = "123456789"
  }]
}
