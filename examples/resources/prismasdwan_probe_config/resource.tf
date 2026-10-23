# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "probe_config".
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

resource "prismasdwan_probe_config" "example" {
  description = "Lorem-Ipsum"
  enabled = true
  endpoints = [{
    allow_insecure_https_connection = true
    dns_server_ip = "Lorem-Ipsum"
    fqdn = "Lorem-Ipsum"
    http_response_string = "Lorem-Ipsum"
    ipv4_address = "Lorem-Ipsum"
    path_types = ["Lorem-Ipsum"]
    probe_count = 1234
    probe_cycle_duration = 1234
    protocol = "Lorem-Ipsum"
  }]
  name = "Lorem-Ipsum"
  tags = ["lorem"]
}
