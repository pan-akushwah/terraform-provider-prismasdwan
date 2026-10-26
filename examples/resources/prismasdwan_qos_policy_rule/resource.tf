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
  app_def_ids             = ["<app_def_id>"]
  description             = "Managed by Terraform"
  dest_device_ids         = ["<dest_device_id>"]
  destination_prefixes_id = "<destination_prefixes_id>"
  dscp = {
    value = 10
  }
  enabled            = true
  name               = "example_name"
  network_context_id = "<network_context_id>"
  order_number       = 1
  priority_number    = 1
  source_prefixes_id = "<source_prefixes_id>"
  src_device_ids     = ["<src_device_id>"]
  tags               = ["terraform"]
  user_or_group = {
    user_group_ids = ["<user_group_id>"]
    user_ids       = ["<user_id>"]
  }
}
