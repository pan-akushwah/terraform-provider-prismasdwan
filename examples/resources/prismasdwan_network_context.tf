# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "network_context"
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

resource "prismasdwan_network_context" "production_network_context" {
  name        = "prod_environment"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

resource "prismasdwan_network_context" "staging_network_context" {
  name        = "staging_environment"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

resource "prismasdwan_network_context" "development_network_context" {
  name        = "dev_environment"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}
