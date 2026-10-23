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
  address_family = "Lorem-Ipsum"
  broadcast_address = "Lorem-Ipsum"
  custom_options = [{
    option_definition = "Lorem-Ipsum"
    option_value = "Lorem-Ipsum"
    vendor_class_identifier = "Lorem-Ipsum"
  }]
  default_lease_time = 1234
  description = "Lorem-Ipsum"
  disabled = true
  dns_servers = ["Lorem-Ipsum"]
  domain_name = "Lorem-Ipsum"
  gateway = "Lorem-Ipsum"
  ip_ranges = [{
    end_ip = "Lorem-Ipsum"
    start_ip = "Lorem-Ipsum"
  }]
  max_lease_time = 1234
  network_context_id = "123456789"
  static_mappings = [{
    client_duid = "Lorem-Ipsum"
    ip_address = "Lorem-Ipsum"
    mac = "Lorem-Ipsum"
    name = "Lorem-Ipsum"
  }]
  subnet = "Lorem-Ipsum"
  tags = ["lorem"]
}
