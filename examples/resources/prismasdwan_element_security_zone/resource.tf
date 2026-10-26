# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_security_zone".
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

resource "prismasdwan_element_security_zone" "example" {
  interface_ids    = ["<interface_id>"]
  lannetwork_ids   = ["<lannetwork_id>"]
  pa_network_id    = "<pa_network_id>"
  site_id          = "<site_id>"
  waninterface_ids = ["<waninterface_id>"]
  wanoverlay_ids   = ["<wanoverlay_id>"]
  zone_id          = "<zone_id>"
}
