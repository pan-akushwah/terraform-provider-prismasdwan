# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ipfix_template".
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

resource "prismasdwan_ipfix_template" "example" {
  description = "Lorem-Ipsum"
  flow_fields = ["Lorem-Ipsum"]
  generate_biflow = true
  name = "Lorem-Ipsum"
  option_export_timeout = 1234
  options = ["Lorem-Ipsum"]
  tags = ["lorem"]
  template_export_timeout = 1234
}
