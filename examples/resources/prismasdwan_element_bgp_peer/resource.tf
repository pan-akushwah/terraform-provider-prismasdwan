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
  advertise_default_route = false
  allow_v4_prefixes       = false
  allow_v6_prefixes       = false
  bgp_config = {
    adv_interval    = 30
    hold_time       = 30
    keepalive_time  = 30
    local_as_num    = "65000"
    md5_secret      = "<secret>"
    multi_hop_limit = 3
    peer_auth_type  = "md5"
    peer_retry_time = 30
  }
  description   = "Managed by Terraform"
  name          = "example_name"
  peer_ip       = "10.0.0.1"
  peer_ip_v6    = "2001:db8::1"
  peer_type     = "example_peer_type"
  remote_as_num = "65000"
  route_aggregation = {
    aggregate_prefixes = [{
      ip_prefixes = ["10.10.0.0/16"]
      type        = "ipv4"
    }]
    aggregate_type      = "unaggregated"
    ipv4_prefix_list_id = "<ipv4_prefix_list_id>"
    ipv6_prefix_list_id = "<ipv6_prefix_list_id>"
  }
  route_map_in_id  = "<route_map_in_id>"
  route_map_out_id = "<route_map_out_id>"
  router_id        = "<router_id>"
  scope            = "GLOBAL"
  shutdown         = false
  tags             = ["terraform"]
  update_source    = "10.0.0.1"
  update_source_v6 = "2001:db8::1"
  vrf_context_id   = "<vrf_context_id>"
}
