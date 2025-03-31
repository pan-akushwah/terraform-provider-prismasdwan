# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "qos_policy_rule"
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

resource "prismasdwan_qos_policy_rule" "test_qos_policy_rule_1" {
  # Needed for path parameters
  x_parameters = {
    policy_set_id = prismasdwan_qos_policy_set.test_qos_policy_set_1.id
  }
  name = "example qos rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["tag1", "tag2"]
  network_context_id = prismasdwan_network_context.test_network_context.id
  order_number = 1024
  enabled = true
  source_prefixes_id = prismasdwan_qos_policy_local_prefix.test_qos_local_prefix.id
  destination_prefixes_id = prismasdwan_qos_policy_global_prefix.test_qos_global_prefix.id
  dscp = {
    value = 8
  }
  priority_number = 2
}
