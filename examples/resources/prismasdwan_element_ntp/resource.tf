# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ntp".
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

resource "prismasdwan_element_ntp" "example" {
  description = "Managed by Terraform"
  name        = "example_name"
  ntp_servers = [{
    host     = "server.example.com"
    max_poll = 10
    min_poll = 10
    version  = 2
  }]
  source_interface_ids = ["<source_interface_id>"]
  tags                 = ["terraform"]
}
