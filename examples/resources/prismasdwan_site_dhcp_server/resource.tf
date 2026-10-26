# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_dhcp_server".
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

resource "prismasdwan_site_dhcp_server" "example" {
  address_family    = "ipv4"
  broadcast_address = "10.0.0.1"
  custom_options = [{
    option_definition       = "example_option_definition"
    option_value            = "example_option_value"
    vendor_class_identifier = "example_vendor_class_identifier"
  }]
  default_lease_time = 300
  description        = "Managed by Terraform"
  disabled           = false
  dns_servers        = ["example_dns_servers"]
  domain_name        = "example.com"
  gateway            = "10.0.0.1"
  ip_ranges = [{
    end_ip   = "10.0.0.1"
    start_ip = "10.0.0.1"
  }]
  max_lease_time     = 300
  network_context_id = "<network_context_id>"
  static_mappings = [{
    client_duid = "example_client_duid"
    ip_address  = "10.0.0.1"
    mac         = "00:11:22:33:44:55"
    name        = "example_name"
  }]
  subnet = "10.10.0.0/16"
  tags   = ["terraform"]
}
