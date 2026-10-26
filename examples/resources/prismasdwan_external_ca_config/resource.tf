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
  ca_sign_timeout                = 30
  manual_renew_trigger_threshold = 10
  renewal_window_from_expiry     = 30
  scep_config = {
    challenge_uri           = "https://example.com"
    enrollment_uri          = "https://example.com"
    https                   = false
    num_challenge_passwords = 10
    server_certificate      = "example_server_certificate"
    server_password         = "<secret>"
    server_primary_address  = "10.0.0.1"
    server_username         = "example_server_username"
  }
  type = "LOCAL"
}
