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
      high = 0.1234
      low = 0.1234
    }
    business_priorities = [{
      bandwidth_allocation = 0.1234
      bandwidth_split_per_type = {
        bulk = 0.1234
        rt_audio = 0.1234
        rt_video = 0.1234
        transactional = 0.1234
      }
      priority_number = 1234
    }]
  }]
  business_priority_names = [{
    priority_name = "Lorem-Ipsum"
    priority_number = 1234
  }]
  clone_from = "Lorem-Ipsum"
  default_rule_dscp_mappings = [{
    dscp = [1234]
    priority_number = 1234
    transfer_type = "Lorem-Ipsum"
  }]
  defaultrule_policyset = true
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  tags = ["lorem"]
  template = true
}
