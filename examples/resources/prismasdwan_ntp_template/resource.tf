# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ntp_template".
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

resource "prismasdwan_ntp_template" "example" {
  default_template = true
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  ntp_servers = [{
    host = "Lorem-Ipsum"
    max_poll = 1234
    min_poll = 1234
    version = 1234
  }]
  tags = ["lorem"]
}
