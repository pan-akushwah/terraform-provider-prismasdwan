# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_routing_ipcommunitylist".
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

resource "prismasdwan_element_routing_ipcommunitylist" "example" {
  auto_generated = true
  community_list = [{
    community_str = "Lorem-Ipsum"
    permit = true
  }]
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  tags = ["lorem"]
}
