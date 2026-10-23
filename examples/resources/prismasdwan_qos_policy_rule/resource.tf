# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "qos_policy_rule".
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

resource "prismasdwan_qos_policy_rule" "example" {
  app_def_ids = ["Lorem-Ipsum"]
  description = "Lorem-Ipsum"
  dest_device_ids = ["Lorem-Ipsum"]
  destination_prefixes_id = "123456789"
  dscp = {
    value = 1234
  }
  enabled = true
  name = "Lorem-Ipsum"
  network_context_id = "123456789"
  order_number = 1234
  priority_number = 1234
  source_prefixes_id = "123456789"
  src_device_ids = ["Lorem-Ipsum"]
  tags = ["lorem"]
  user_or_group = {
    user_group_ids = ["Lorem-Ipsum"]
    user_ids = ["Lorem-Ipsum"]
  }
}
