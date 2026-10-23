# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_snmp_trap".
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

resource "prismasdwan_element_snmp_trap" "example" {
  description = "Lorem-Ipsum"
  enabled = true
  server_ip = "Lorem-Ipsum"
  source_interface = "Lorem-Ipsum"
  tags = ["lorem"]
  v2_config = {
    community = "base64(<secret-string>)"
  }
  v3_config = {
    user_access = {
      auth_phrase = "base64(<secret-string>)"
      auth_type = "Lorem-Ipsum"
      enc_phrase = "base64(<secret-string>)"
      enc_type = "Lorem-Ipsum"
      engine_id = "123456789"
      security_level = "Lorem-Ipsum"
      user_name = "Lorem-Ipsum"
    }
  }
  version = "Lorem-Ipsum"
}
