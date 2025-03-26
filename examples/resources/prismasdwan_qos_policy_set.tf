# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "qos_policy_set"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_qos_policy_set" "test_qos_policy_set_1" {
  name = "qos policy set 001"
  description = "example description"
  tags = ["example", "tag"]
  defaultrule_policyset = false
  bandwidth_allocation_schemes = [
    {
      bandwidth_range = {
        low = 0
        high = 10000
      }
      business_priorities = [
        {
          priority_number = 1
          bandwidth_allocation = 50
          bandwidth_split_per_type = {
            rt_audio = 30
            rt_video = 20
            transactional = 30
            bulk = 20
          }
        },
        {
          priority_number = 2
          bandwidth_allocation = 25
          bandwidth_split_per_type = {
            rt_audio = 30
            rt_video = 20
            transactional = 30
            bulk = 20
          }
        },
        {
          priority_number = 3
          bandwidth_allocation = 15
          bandwidth_split_per_type = {
            rt_audio = 30
            rt_video = 20
            transactional = 30
            bulk = 20
          }
        },
        {
          priority_number = 4
          bandwidth_allocation = 10
          bandwidth_split_per_type = {
            rt_audio = 30
            rt_video = 20
            transactional = 30
            bulk = 20
          }
        }
      ]
    }
  ]
  business_priority_names = [
    {
      priority_number = 1
      priority_name = "Platinum"
    },
    {
      priority_number = 2
      priority_name = "Gold"
    },
    {
      priority_number = 3
      priority_name = "Silver"
    },
    {
      priority_number = 4
      priority_name = "Bronze"
    }
  ]
  template = false
}
