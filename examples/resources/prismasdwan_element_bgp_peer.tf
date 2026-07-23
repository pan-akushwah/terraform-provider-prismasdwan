# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_bgp_peer"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_element_bgp_peer" "bgp_peer" {
  advertise_default_route = false
  allow_v4_prefixes       = true
  allow_v6_prefixes       = false
  bgp_config = {
    adv_interval                 = 1
    hold_time                    = 45
    keepalive_time               = 15
    local_as_num                 = "350"
    md5_secret                   = null # sensitive
    md5_secret_internal_key_name = null
    multi_hop_limit              = 1
    peer_auth_type               = "none"
    peer_retry_time              = 120
  }
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  name              = "AUTO-PRISMA_IPSEC-Tunnel_us-southeast_2"
  peer_ip           = "172.16.0.111"
  peer_ip_v6        = null
  peer_type         = "classic"
  remote_as_num     = "65534"
  route_aggregation = null
  route_map_in_id   = null
  route_map_out_id  = null
  router_id         = null
  scope             = "global"
  shutdown          = false
  tags              = ["AUTO-PRISMA_MANAGED"]
  update_source     = "172.16.0.110"
  update_source_v6  = null
  vrf_context_id    = "1706693390127013196"
}