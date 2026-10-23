# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_multicast_global_config".
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

resource "prismasdwan_element_multicast_global_config" "example" {
  bsm_enabled = true
  dr_priority = 1234
  igmp_protocol_parameters = {
    last_member_query_count = 1234
    last_member_query_interval = 1234
    query_interval = 1234
    query_max_response_time = 1234
  }
  pim_protocol_parameters = {
    hello_hold_time = 1234
    hello_interval = 1234
    join_prune_interval = 1234
  }
  spt_switchover_enabled = true
}
