# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "app_def"
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

#
# Test App 003
resource "prismasdwan_app_def" "test_app_003" {
  display_name                 = "Test_App_003"
  abbreviation                 = "tap03"
  domains                      = ["acme-domain-003.com"]
  path_affinity                = "none"
  ingress_traffic_pct          = 50
  conn_idle_timeout            = 3600
  transfer_type                = "bulk"
  app_type                     = "custom"
  session_timeout              = 0
  order_number                 = 1
  app_unreachability_detection = true
  network_scan_application     = true
  p_category                   = "collaboration"
}

#
# existing filter with a given name
data "prismasdwan_global_prefix_filter" "existing_filter" {
  filters = {
    name = "TestAppPrefixFilter"
  }
}

output "existing_filters" {
  value = length(data.prismasdwan_global_prefix_filter.existing_filter.items)
}

resource "prismasdwan_app_def" "test_app_002" {
  display_name                 = "Test_App_002"
  abbreviation                 = "tap02"
  path_affinity                = "strict"
  ingress_traffic_pct          = 50
  conn_idle_timeout            = 3600
  transfer_type                = "transactional"
  app_type                     = "custom"
  session_timeout              = 0
  order_number                 = 1
  app_unreachability_detection = true
  network_scan_application     = true
  p_category                   = "business-systems"

  tcp_rules = [
    {
      server_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      client_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      server_port = {
        start = "2500"
        end   = "2520"
      }
      client_port = {
        start = "2500"
        end   = "2501"
      }
    }
  ]
  udp_rules = [
    {
      udp_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      udp_port = {
        start = "2600"
        end   = "2620"
      }
    }
  ]

  ip_rules = [
    {
      protocol = "icmp"
      dest_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      src_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      dscp = {
        value = 0
      }
    },
    {
      protocol = "igmp"
      dest_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      src_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      dscp = {
        value = 0
      }
    }
  ]
}

