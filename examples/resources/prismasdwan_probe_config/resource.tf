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
  description = "Managed by Terraform"
  enabled     = true
  endpoints = [{
    allow_insecure_https_connection = false
    dns_server_ip                   = "10.0.0.1"
    fqdn                            = "server.example.com"
    http_response_string            = "example_http_response_string"
    ipv4_address                    = "10.0.0.1"
    path_types                      = ["direct"]
    probe_count                     = 3
    probe_cycle_duration            = 10
    protocol                        = "http"
  }]
  name = "example_name"
  tags = ["terraform"]
}
