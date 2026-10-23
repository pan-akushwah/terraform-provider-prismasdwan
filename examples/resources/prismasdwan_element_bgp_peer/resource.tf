# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_bgp_peer".
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

resource "prismasdwan_element_bgp_peer" "example" {
  advertise_default_route = true
  allow_v4_prefixes = true
  allow_v6_prefixes = true
  bgp_config = {
    adv_interval = 1234
    hold_time = 1234
    keepalive_time = 1234
    local_as_num = "Lorem-Ipsum"
    md5_secret = "base64(<secret-string>)"
    multi_hop_limit = 1234
    peer_auth_type = "Lorem-Ipsum"
    peer_retry_time = 1234
  }
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  peer_ip = "Lorem-Ipsum"
  peer_ip_v6 = "Lorem-Ipsum"
  peer_type = "Lorem-Ipsum"
  remote_as_num = "Lorem-Ipsum"
  route_aggregation = {
    aggregate_prefixes = [{
      ip_prefixes = ["Lorem-Ipsum"]
      type = "Lorem-Ipsum"
    }]
    aggregate_type = "Lorem-Ipsum"
    ipv4_prefix_list_id = "123456789"
    ipv6_prefix_list_id = "123456789"
  }
  route_map_in_id = "123456789"
  route_map_out_id = "123456789"
  router_id = "123456789"
  scope = "Lorem-Ipsum"
  shutdown = true
  tags = ["lorem"]
  update_source = "Lorem-Ipsum"
  update_source_v6 = "Lorem-Ipsum"
  vrf_context_id = "123456789"
}
