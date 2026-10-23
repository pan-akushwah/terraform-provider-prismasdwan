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
  action = "Lorem-Ipsum"
  app_def_ids = ["Lorem-Ipsum"]
  description = "Lorem-Ipsum"
  dest_device_ids = ["Lorem-Ipsum"]
  destination_prefix_ids = ["Lorem-Ipsum"]
  destination_zone_ids = ["Lorem-Ipsum"]
  enabled = true
  name = "Lorem-Ipsum"
  security_profile_group_id = "123456789"
  services = [{
    destination_ports = [{
      from = 1234
      to = 1234
    }]
    protocol = 1234
    source_ports = [{
      from = 1234
      to = 1234
    }]
  }]
  source_prefix_ids = ["Lorem-Ipsum"]
  source_zone_ids = ["Lorem-Ipsum"]
  src_device_ids = ["Lorem-Ipsum"]
  tags = ["lorem"]
  user_or_group = {
    user_group_ids = ["Lorem-Ipsum"]
    user_ids = ["Lorem-Ipsum"]
  }
}
