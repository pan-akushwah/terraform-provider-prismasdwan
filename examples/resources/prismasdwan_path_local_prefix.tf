# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_local_prefix"
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

resource "prismasdwan_path_local_prefix" "example" {
  name        = "dev_network_path"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["dev", "internal", "high_priority"]
}

resource "prismasdwan_path_local_prefix" "test_np_path_local_2" {
  name        = "prod_datacenter_path"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["prod", "datacenter", "critical"]
}

resource "prismasdwan_path_local_prefix" "test_np_path_local_3" {
  name        = "qa_testing_path"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["qa", "testing", "temporary"]
}
