# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_snmp_agent".
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

resource "prismasdwan_element_snmp_agent" "example" {
  description     = "Managed by Terraform"
  system_contact  = "example_system_contact"
  system_location = "example_system_location"
  tags            = ["terraform"]
  v2_config = {
    community = "<secret>"
    enabled   = true
  }
  v3_config = {
    enabled = true
    users_access = [{
      auth_phrase    = "<secret>"
      auth_type      = "NONE"
      enc_phrase     = "<secret>"
      enc_type       = "NONE"
      engine_id      = "<engine_id>"
      security_level = "NOAUTH"
      user_name      = "example_user"
    }]
  }
}
