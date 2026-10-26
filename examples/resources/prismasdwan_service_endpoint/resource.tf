# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "service_endpoint".
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

resource "prismasdwan_service_endpoint" "example" {
  address = {
    city      = "Santa Clara"
    country   = "United States"
    post_code = "95054"
    state     = "California"
    street    = "3000 Tannery Way"
    street2   = "Building A"
  }
  admin_up                      = true
  allow_enterprise_traffic      = false
  description                   = "Managed by Terraform"
  disable_tunnel_reoptimization = false
  is_sase                       = false
  liveliness_probe = {
    http = [{
      failure_count     = 3
      http_status_codes = [100]
      interval          = 30
      url               = "https://example.com"
    }]
    icmp_ping = [{
      failure_count = 3
      interval      = 30
      ip_addresses  = ["example_ip_addresses"]
    }]
    use_tunnel_for_url_dns_resolution = false
  }
  location = {
    description = "Managed by Terraform"
    latitude    = 37.3541
    longitude   = -121.9552
  }
  name = "example_name"
  sase_properties = {
    active      = false
    lqm_enabled = false
  }
  service_link_peers = {
    hostnames    = ["server.example.com"]
    ip_addresses = ["example_ip_addresses"]
  }
  site_id = "<site_id>"
  tags    = ["terraform"]
  type    = "cg-transit"
}
