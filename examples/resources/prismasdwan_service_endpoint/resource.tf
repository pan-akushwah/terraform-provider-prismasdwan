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
    city = "Lorem-Ipsum"
    country = "Lorem-Ipsum"
    post_code = "Lorem-Ipsum"
    state = "Lorem-Ipsum"
    street = "Lorem-Ipsum"
    street2 = "Lorem-Ipsum"
  }
  admin_up = true
  allow_enterprise_traffic = true
  description = "Lorem-Ipsum"
  disable_tunnel_reoptimization = true
  is_sase = true
  liveliness_probe = {
    http = [{
      failure_count = 1234
      http_status_codes = [1234]
      interval = 1234
      url = "Lorem-Ipsum"
    }]
    icmp_ping = [{
      failure_count = 1234
      interval = 1234
      ip_addresses = ["Lorem-Ipsum"]
    }]
    use_tunnel_for_url_dns_resolution = true
  }
  location = {
    description = "Lorem-Ipsum"
    latitude = 0.1234
    longitude = 0.1234
  }
  name = "Lorem-Ipsum"
  sase_properties = {
    active = true
    lqm_enabled = true
  }
  service_link_peers = {
    hostnames = ["Lorem-Ipsum"]
    ip_addresses = ["Lorem-Ipsum"]
  }
  site_id = "123456789"
  tags = ["lorem"]
  type = "Lorem-Ipsum"
}
