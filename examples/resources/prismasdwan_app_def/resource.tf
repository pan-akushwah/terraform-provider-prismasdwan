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
  abbreviation                 = "examp"
  aggregate_flows              = false
  app_type                     = "custom"
  app_unreachability_detection = false
  category                     = "anonymity"
  conn_idle_timeout            = 30
  description                  = "Managed by Terraform"
  display_name                 = "example_display"
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
  is_deprecated                   = false
  network_scan_application        = false
  order_number                    = 1
  overrides_allowed               = false
  p_category                      = "business-systems"
  p_parent_id                     = "<p_parent_id>"
  p_sub_category                  = "photo-video"
  parent_id                       = "<parent_id>"
  path_affinity                   = "none"
  session_timeout                 = 30
  supported_base_software_version = "example_supported_base_software_version"
  supported_engines               = "ave"
  system_app_overridden           = false
  tags                            = ["terraform"]
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
