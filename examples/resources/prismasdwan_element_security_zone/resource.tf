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
  interface_ids = ["Lorem-Ipsum"]
  lannetwork_ids = ["Lorem-Ipsum"]
  pa_network_id = "123456789"
  site_id = "123456789"
  waninterface_ids = ["Lorem-Ipsum"]
  wanoverlay_ids = ["Lorem-Ipsum"]
  zone_id = "123456789"
}
