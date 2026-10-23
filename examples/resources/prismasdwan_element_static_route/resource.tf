# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_static_route".
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

resource "prismasdwan_element_static_route" "example" {
  address_family = "Lorem-Ipsum"
  description = "Lorem-Ipsum"
  destination_prefix = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  network_context_id = "123456789"
  nexthop_reachability_probe = true
  nexthops = [{
    admin_distance = 1234
    nexthop_interface_id = "123456789"
    nexthop_ip = "Lorem-Ipsum"
    self = true
  }]
  scope = "Lorem-Ipsum"
  tags = ["lorem"]
  vrf_context_id = "123456789"
}
