# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "security_policy_rule".
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

resource "prismasdwan_security_policy_rule" "example" {
  action                    = "ALLOW"
  app_def_ids               = ["<app_def_id>"]
  description               = "Managed by Terraform"
  dest_device_ids           = ["<dest_device_id>"]
  destination_prefix_ids    = ["<destination_prefix_id>"]
  destination_zone_ids      = ["<destination_zone_id>"]
  enabled                   = true
  name                      = "example_name"
  security_profile_group_id = "<security_profile_group_id>"
  services = [{
    destination_ports = [{
      from = 10
      to   = 10
    }]
    protocol = 10
    source_ports = [{
      from = 10
      to   = 10
    }]
  }]
  source_prefix_ids = ["<source_prefix_id>"]
  source_zone_ids   = ["<source_zone_id>"]
  src_device_ids    = ["<src_device_id>"]
  tags              = ["terraform"]
  user_or_group = {
    user_group_ids = ["<user_group_id>"]
    user_ids       = ["<user_id>"]
  }
}
