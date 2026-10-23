# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_radius".
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

resource "prismasdwan_element_radius" "example" {
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  override_indicator = ["Lorem-Ipsum"]
  radius_configuration = [{
    accounting_port = 1234
    authentication_port = 1234
    ip_version = 1234
    priority = 1234
    retain_shared_secret = true
    server_ip_address = "Lorem-Ipsum"
    shared_secret = "base64(<secret-string>)"
    shared_secret_encrypted = "base64(<secret-string>)"
  }]
  radius_profile_id = "123456789"
  source_interface_id = "123456789"
  tags = ["lorem"]
}
