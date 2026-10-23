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
  admin_distance = 1234
  adv_interval = 1234
  graceful_restart = true
  hold_time = 1234
  ipv6_prefixes_to_adv_to_wan = ["Lorem-Ipsum"]
  keepalive_time = 1234
  local_as_num = "Lorem-Ipsum"
  maximum_paths = 1234
  md5_secret = "base64(<secret-string>)"
  multi_hop_limit = 1234
  ospf_redistribution = [{
    route_map_id = "123456789"
    vrf_context_id = "123456789"
  }]
  peer_auth_type = "Lorem-Ipsum"
  peer_retry_time = 1234
  prefix_adv_type = "Lorem-Ipsum"
  prefix_adv_type_to_lan = "Lorem-Ipsum"
  prefixes_to_adv_to_wan = ["Lorem-Ipsum"]
  router_id = "123456789"
  stalepath_time = 1234
  vrf_router_id_map = [{
    router_id = "123456789"
    vrf_context_id = "123456789"
  }]
}
