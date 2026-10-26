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
  address_family             = "ipv4"
  description                = "Managed by Terraform"
  destination_prefix         = "10.10.0.0/16"
  name                       = "example_name"
  network_context_id         = "<network_context_id>"
  nexthop_reachability_probe = false
  nexthops = [{
    admin_distance       = 1
    nexthop_interface_id = "<nexthop_interface_id>"
    nexthop_ip           = "10.0.0.1"
    self                 = false
  }]
  scope          = "local"
  tags           = ["terraform"]
  vrf_context_id = "<vrf_context_id>"
}
