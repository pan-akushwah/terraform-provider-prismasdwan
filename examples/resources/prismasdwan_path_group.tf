# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_group"
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

resource "prismasdwan_path_group" "example" {
  name        = "tf example path group"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  paths = [
    {
      label     = "private-1"
      path_type = "vpn"
    },
    {
      label     = "public-1"
      path_type = "direct"
    }
  ]
}
