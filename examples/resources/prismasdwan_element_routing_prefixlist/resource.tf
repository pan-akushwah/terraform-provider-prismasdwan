# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_routing_prefixlist".
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

resource "prismasdwan_element_routing_prefixlist" "example" {
  auto_generated = true
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  prefix_filter_list = [{
    ge = 1234
    ipv6_prefix = "Lorem-Ipsum"
    le = 1234
    order = 1234
    permit = true
    prefix = "Lorem-Ipsum"
  }]
  tags = ["lorem"]
}
