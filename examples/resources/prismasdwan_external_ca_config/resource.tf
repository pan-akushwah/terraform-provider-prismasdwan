# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "external_ca_config".
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

resource "prismasdwan_external_ca_config" "example" {
  ca_sign_timeout = 1234
  manual_renew_trigger_threshold = 1234
  renewal_window_from_expiry = 1234
  scep_config = {
    challenge_uri = "Lorem-Ipsum"
    enrollment_uri = "Lorem-Ipsum"
    https = true
    num_challenge_passwords = 1234
    server_certificate = "Lorem-Ipsum"
    server_password = "base64(<secret-string>)"
    server_primary_address = "Lorem-Ipsum"
    server_username = "Lorem-Ipsum"
  }
  type = "Lorem-Ipsum"
}
