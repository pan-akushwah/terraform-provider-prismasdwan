# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_policy_stack"
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
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_path_policy_stack" "example_path_policy_stack" {
  name                   = "example_test_path_policy_stack"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["test", "example", "path_policy"]
  default_policysetstack = false
  policyset_ids          = [
    prismasdwan_path_policy_set.example_policy_set_1.id,
    prismasdwan_path_policy_set.example_policy_set_2.id
  ]
  defaultrule_policyset_id = prismasdwan_path_policy_set.example_policy_set.id
}
