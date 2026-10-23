# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "security_policy_stack"
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

# create a set for development
resource "prismasdwan_security_policy_set" "development_policy_set" {
  name                  = "development_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["development", "testing"]
  defaultrule_policyset = false
}

# create a set for compliance
resource "prismasdwan_security_policy_set" "compliance_policy_set" {
  name                  = "compliance_security_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["compliance", "audit"]
  defaultrule_policyset = true
}

resource "prismasdwan_security_policy_stack" "development_security_policy_stack" {
  # Required fields
  name = "development_policy_stack"
  # the default-rule set must have defaultrule_policyset = true
  defaultrule_policyset_id = prismasdwan_security_policy_set.compliance_policy_set.id
  # Optional fields
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["tag1", "tag2"]
  # Policy set IDs (0-4 policy sets max, converted from names)
  policyset_ids = [
    prismasdwan_security_policy_set.development_policy_set.id
  ]
}
