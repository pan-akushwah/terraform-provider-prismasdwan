# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "qos_policy_set".
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

resource "prismasdwan_qos_policy_set" "example" {
  bandwidth_allocation_schemes = [{
    bandwidth_range = {
      high = 1.5
      low  = 1.5
    }
    business_priorities = [{
      bandwidth_allocation = 1.5
      bandwidth_split_per_type = {
        bulk          = 1.5
        rt_audio      = 1.5
        rt_video      = 1.5
        transactional = 1.5
      }
      priority_number = 1
    }]
  }]
  business_priority_names = [{
    priority_name   = "example_priority"
    priority_number = 1
  }]
  clone_from = "example_clone_from"
  default_rule_dscp_mappings = [{
    dscp            = [10]
    priority_number = 1
    transfer_type   = "RT_AUDIO"
  }]
  defaultrule_policyset = false
  description           = "Managed by Terraform"
  name                  = "example_name"
  tags                  = ["terraform"]
  template              = false
}
