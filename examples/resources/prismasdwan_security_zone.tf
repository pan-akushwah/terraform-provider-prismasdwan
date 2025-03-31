# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "security_zone"
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

resource "prismasdwan_security_zone" "production_zone" {
  name              = "production_security_zone"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tcp_allow_non_syn = false
}

resource "prismasdwan_security_zone" "development_zone" {
  name              = "development_security_zone"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tcp_allow_non_syn = true
}

resource "prismasdwan_security_zone" "dmz_zone" {
  name              = "dmz_security_zone"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tcp_allow_non_syn = false
}
