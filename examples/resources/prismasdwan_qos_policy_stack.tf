# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "qos_policy_stack"
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

# The tenant's built-in default-rule QoS policy set
resource "prismasdwan_resource_locator" "default_qos_policy_set" {
  resource_type           = "prismasdwan_qos_policy_set"
  resource_property       = "name"
  resource_property_value = "Default QoS Simple Stack Default Rule Policy Set (Simple)"
}

resource "prismasdwan_qos_policy_stack" "test_qos_policy_stack_1" {
  name = "example_qos_stack"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["example", "qos"]
  policyset_ids = [
    prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  ]
  defaultrule_policyset_id = prismasdwan_resource_locator.default_qos_policy_set.result
  default_policysetstack = false
}
