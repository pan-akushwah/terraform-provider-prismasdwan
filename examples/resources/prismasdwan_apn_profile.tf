# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "apn_profile"
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

resource "prismasdwan_apn_profile" "example_apn_profile_1" {
  name        = "example_apnprofile_1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  apn = "example-tf"
  authentication = "pap_or_chap"
  clear_password = true
  password = null
  user_name = "example"
}

resource "prismasdwan_apn_profile" "example_apn_profile_2" {
  name        = "example_apnprofile_2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  apn = "example-tf"
  authentication = "pap_or_chap"
  clear_password = false
  password = "example"
  user_name = "example"
}

resource "prismasdwan_apn_profile" "example_apn_profile_3" {
  name        = "example_apnprofile_3"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  apn = "example-tf"
  authentication = "pap"
  clear_password = false
  password = "example"
  user_name = "example"
}

resource "prismasdwan_apn_profile" "example_apn_profile_4" {
  name        = "example_apnprofile_4"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  apn = "example-tf"
  authentication = "chap"
  clear_password = true
  password = null
  user_name = "example"
}
