# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "event_correlation_policy_set".
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

resource "prismasdwan_event_correlation_policy_set" "example" {
  active_policyset = false
  clone_from       = "example_clone_from"
  description      = "Managed by Terraform"
  name             = "example_name"
  severity_priority_mapping = [{
    priority = "p1"
    severity = "major"
  }]
  tags = ["terraform"]
}
