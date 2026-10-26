# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "app_def_override".
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

resource "prismasdwan_app_def_override" "example" {
  aggregate_flows              = false
  app_unreachability_detection = false
  category                     = "anonymity"
  conn_idle_timeout            = 30
  description                  = "Managed by Terraform"
  domains                      = ["example_domains"]
  ingress_traffic_pct          = 10
  ip_rules = [{
    dest_filters       = ["example_dest_filters"]
    dest_ipv6_prefixes = ["2001:db8:10::/48"]
    dest_prefixes      = ["10.10.0.0/16"]
    dscp = {
      value = 10
    }
    protocol    = "ospf"
    src_filters = ["example_src_filters"]
  }]
  override_default_ip_rules  = false
  override_default_tcp_rules = false
  override_default_udp_rules = false
  override_domains           = false
  overrides_disable          = false
  p_category                 = "business-systems"
  path_affinity              = "none"
  session_timeout            = 30
  tags                       = ["terraform"]
  tcp_rules = [{
    client_filters = ["example_client_filters"]
    client_port = {
      end   = "example_end"
      start = "example_start"
    }
    dscp = {
      value = 10
    }
    server_filters       = ["example_server_filters"]
    server_ipv6_prefixes = ["2001:db8:10::/48"]
    server_port = {
      end   = "example_end"
      start = "example_start"
    }
    server_prefixes = ["10.10.0.0/16"]
  }]
  transfer_type = "transactional"
  udp_rules = [{
    dest_ipv6_prefixes = ["2001:db8:10::/48"]
    dest_prefixes      = ["10.10.0.0/16"]
    dscp = {
      value = 10
    }
    udp_filters = ["example_udp_filters"]
    udp_port = {
      end   = "example_end"
      start = "example_start"
    }
  }]
  use_parentapp_network_policy = false
}
