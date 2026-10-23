# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "app_def".
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

resource "prismasdwan_app_def" "example" {
  abbreviation = "Lorem-Ipsum"
  aggregate_flows = true
  app_type = "Lorem-Ipsum"
  app_unreachability_detection = true
  category = "Lorem-Ipsum"
  conn_idle_timeout = 1234
  description = "Lorem-Ipsum"
  display_name = "Lorem-Ipsum"
  domains = ["Lorem-Ipsum"]
  ingress_traffic_pct = 1234
  ip_rules = [{
    dest_filters = ["Lorem-Ipsum"]
    dest_ipv6_prefixes = ["Lorem-Ipsum"]
    dest_prefixes = ["Lorem-Ipsum"]
    dscp = {
      value = 1234
    }
    protocol = "Lorem-Ipsum"
    src_filters = ["Lorem-Ipsum"]
  }]
  is_deprecated = true
  network_scan_application = true
  order_number = 1234
  overrides_allowed = true
  p_category = "Lorem-Ipsum"
  p_parent_id = "123456789"
  p_sub_category = "Lorem-Ipsum"
  parent_id = "123456789"
  path_affinity = "Lorem-Ipsum"
  session_timeout = 1234
  supported_base_software_version = "Lorem-Ipsum"
  supported_engines = "Lorem-Ipsum"
  system_app_overridden = true
  tags = ["lorem"]
  tcp_rules = [{
    client_filters = ["Lorem-Ipsum"]
    client_port = {
      end = "Lorem-Ipsum"
      start = "Lorem-Ipsum"
    }
    dscp = {
      value = 1234
    }
    server_filters = ["Lorem-Ipsum"]
    server_ipv6_prefixes = ["Lorem-Ipsum"]
    server_port = {
      end = "Lorem-Ipsum"
      start = "Lorem-Ipsum"
    }
    server_prefixes = ["Lorem-Ipsum"]
  }]
  transfer_type = "Lorem-Ipsum"
  udp_rules = [{
    dest_ipv6_prefixes = ["Lorem-Ipsum"]
    dest_prefixes = ["Lorem-Ipsum"]
    dscp = {
      value = 1234
    }
    udp_filters = ["Lorem-Ipsum"]
    udp_port = {
      end = "Lorem-Ipsum"
      start = "Lorem-Ipsum"
    }
  }]
  use_parentapp_network_policy = true
}
