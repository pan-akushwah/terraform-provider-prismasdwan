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
  bsm_enabled = false
  dr_priority = 1
  igmp_protocol_parameters = {
    last_member_query_count    = 3
    last_member_query_interval = 30
    query_interval             = 30
    query_max_response_time    = 30
  }
  pim_protocol_parameters = {
    hello_hold_time     = 30
    hello_interval      = 30
    join_prune_interval = 30
  }
  spt_switchover_enabled = false
}
