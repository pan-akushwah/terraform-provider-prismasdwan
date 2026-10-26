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
  description = "Managed by Terraform"
  ipv4_config = {
    default_routers = ["example_default_routers"]
    dhcp_relay = {
      enabled = true
      option_82 = {
        circuit_id          = "<circuit_id>"
        enabled             = true
        reforwarding_policy = "replace"
        remote_id           = "<remote_id>"
      }
      server_ips       = ["example_server_ips"]
      source_interface = "example_source_interface"
    }
    dhcp_server = {
      domain_name         = "example.com"
      domain_name_servers = ["example_domain_name_servers"]
      ip_address_pool = [{
        end   = "example_end"
        start = "example_start"
      }]
      lease_expiry_time = 30
      lease_renew_time  = 30
    }
    prefixes = ["10.10.0.0/16"]
  }
  ipv6_config = {
    default_routers = ["example_default_routers"]
    prefixes        = ["10.10.0.0/16"]
  }
  name               = "example_name"
  network_context_id = "<network_context_id>"
  scope              = "local"
  tags               = ["terraform"]
  vrf_context_id     = "<vrf_context_id>"
}
