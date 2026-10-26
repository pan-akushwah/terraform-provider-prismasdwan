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
  description        = "Managed by Terraform"
  name               = "example_name"
  override_indicator = ["example_override_indicator"]
  radius_configuration = [{
    accounting_port         = 443
    authentication_port     = 443
    ip_version              = 1
    priority                = 1
    retain_shared_secret    = false
    server_ip_address       = "10.0.0.1"
    shared_secret           = "<secret>"
    shared_secret_encrypted = "<secret>"
  }]
  radius_profile_id   = "<radius_profile_id>"
  source_interface_id = "<source_interface_id>"
  tags                = ["terraform"]
}
