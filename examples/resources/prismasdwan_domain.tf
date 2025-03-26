# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "domain"
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

resource "prismasdwan_domain" "example" {
  name        = "marketing_domain"
  description = "Domain for marketing department resources"
  is_default  = false
}

resource "prismasdwan_domain" "engineering" {
  name        = "engineering_domain"
  description = "Domain for engineering team resources and projects"
  is_default  = false
}

resource "prismasdwan_domain" "finance" {
  name        = "finance_domain"
  description = "Domain for finance department resources"
  is_default  = false
}
