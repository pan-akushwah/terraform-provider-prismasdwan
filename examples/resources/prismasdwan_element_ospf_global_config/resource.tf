# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ospf_global_config".
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

resource "prismasdwan_element_ospf_global_config" "example" {
  cost                   = 1
  dead_interval          = 30
  hello_interval         = 30
  md5_key_id             = 10
  md5_secret             = "<secret>"
  prefix_adv_type_to_lan = "example_prefix_adv_type_to_lan"
  retransmit_interval    = 30
  router_id              = "<router_id>"
  transmit_delay         = 10
}
