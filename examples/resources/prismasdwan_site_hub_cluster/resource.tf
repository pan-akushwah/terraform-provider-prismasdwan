# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_cluster".
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

resource "prismasdwan_site_hub_cluster" "example" {
  default_cluster = true
  description = "Lorem-Ipsum"
  elements = [{
    hub_element_id = "123456789"
    locked = true
  }]
  name = "Lorem-Ipsum"
  peer_sites = ["Lorem-Ipsum"]
  site_count_alarm_threshold = 1234
  tags = ["lorem"]
}
