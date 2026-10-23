# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_prefix_filter".
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

resource "prismasdwan_site_hub_prefix_filter" "example" {
  filters = [{
    elements = ["Lorem-Ipsum"]
    ip_prefixes = ["Lorem-Ipsum"]
    path = ["Lorem-Ipsum"]
    # site (unsupported type OBJECT)
    type = "Lorem-Ipsum"
    wn_path = ["Lorem-Ipsum"]
  }]
  prefix_filter_id = "123456789"
}
