# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "qos_policy_global_prefix"
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

resource "prismasdwan_qos_policy_global_prefix" "test_qos_global_prefix" {
  name = "example_qos_global_policy"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["example_tag"]
  ipv6_prefixes = ["fd10:586e:b3f0::/48"]
  ipv4_prefixes = ["10.10.10.0/24"]
}