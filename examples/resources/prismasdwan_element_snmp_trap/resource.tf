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
  description      = "Managed by Terraform"
  enabled          = true
  server_ip        = "10.0.0.1"
  source_interface = "example_source_interface"
  tags             = ["terraform"]
  v2_config = {
    community = "<secret>"
  }
  v3_config = {
    user_access = {
      auth_phrase    = "<secret>"
      auth_type      = "NONE"
      enc_phrase     = "<secret>"
      enc_type       = "NONE"
      engine_id      = "<engine_id>"
      security_level = "NOAUTH"
      user_name      = "example_user"
    }
  }
  version = "v2"
}
