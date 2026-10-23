# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "event_correlation_policy_rule".
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

resource "prismasdwan_event_correlation_policy_rule" "example" {
  dampening_duration = 1234
  description = "Lorem-Ipsum"
  enabled = true
  end_time = 1234
  escalation_rules = {
    flap_rule = {
      flap_duration = 1234
      flap_rate = 1234
    }
    standing_rule = {
      priority = "Lorem-Ipsum"
      standing_for = 1234
    }
  }
  event_codes = ["Lorem-Ipsum"]
  name = "Lorem-Ipsum"
  priority = "Lorem-Ipsum"
  resource_ids = ["Lorem-Ipsum"]
  resource_type = "Lorem-Ipsum"
  start_time = 1234
  sub_resource_type = "Lorem-Ipsum"
  suppress = "Lorem-Ipsum"
  tags = ["lorem"]
}
