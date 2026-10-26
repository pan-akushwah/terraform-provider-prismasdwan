# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_bgp_config".
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

resource "prismasdwan_element_bgp_config" "example" {
  admin_distance              = 1
  adv_interval                = 30
  graceful_restart            = false
  hold_time                   = 30
  ipv6_prefixes_to_adv_to_wan = ["2001:db8::1"]
  keepalive_time              = 30
  local_as_num                = "65000"
  maximum_paths               = 10
  md5_secret                  = "<secret>"
  multi_hop_limit             = 3
  ospf_redistribution = [{
    route_map_id   = "<route_map_id>"
    vrf_context_id = "<vrf_context_id>"
  }]
  peer_auth_type         = "md5"
  peer_retry_time        = 30
  prefix_adv_type        = "example_prefix_adv_type"
  prefix_adv_type_to_lan = "example_prefix_adv_type_to_lan"
  prefixes_to_adv_to_wan = ["example_prefixes_to_adv_to_wan"]
  router_id              = "<router_id>"
  stalepath_time         = 30
  vrf_router_id_map = [{
    router_id      = "<router_id>"
    vrf_context_id = "<vrf_context_id>"
  }]
}
