# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "nat_local_prefix"
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

resource "prismasdwan_nat_local_prefix" "test_nat_local_prefix_01" {
  name        = "example_nat_local_prefix_001"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example_tag"]
}