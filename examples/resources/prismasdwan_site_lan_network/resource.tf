# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_lan_network".
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

resource "prismasdwan_site_lan_network" "example" {
  description = "Lorem-Ipsum"
  ipv4_config = {
    default_routers = ["Lorem-Ipsum"]
    dhcp_relay = {
      enabled = true
      option_82 = {
        circuit_id = "123456789"
        enabled = true
        reforwarding_policy = "Lorem-Ipsum"
        remote_id = "123456789"
      }
      server_ips = ["Lorem-Ipsum"]
      source_interface = "Lorem-Ipsum"
    }
    dhcp_server = {
      domain_name = "Lorem-Ipsum"
      domain_name_servers = ["Lorem-Ipsum"]
      ip_address_pool = [{
        end = "Lorem-Ipsum"
        start = "Lorem-Ipsum"
      }]
      lease_expiry_time = 1234
      lease_renew_time = 1234
    }
    prefixes = ["Lorem-Ipsum"]
  }
  ipv6_config = {
    default_routers = ["Lorem-Ipsum"]
    prefixes = ["Lorem-Ipsum"]
  }
  name = "Lorem-Ipsum"
  network_context_id = "123456789"
  scope = "Lorem-Ipsum"
  tags = ["lorem"]
  vrf_context_id = "123456789"
}
