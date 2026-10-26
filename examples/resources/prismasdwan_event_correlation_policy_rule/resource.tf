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
  dampening_duration = 10
  description        = "Managed by Terraform"
  enabled            = true
  end_time           = 30
  escalation_rules = {
    flap_rule = {
      flap_duration = 10
      flap_rate     = 10
    }
    standing_rule = {
      priority     = "p1"
      standing_for = 10
    }
  }
  event_codes       = ["DEVICEHW_POWER_LOST"]
  name              = "example_name"
  priority          = "p1"
  resource_ids      = ["<resource_id>"]
  resource_type     = "site"
  start_time        = 30
  sub_resource_type = "public"
  suppress          = "yes"
  tags              = ["terraform"]
}
