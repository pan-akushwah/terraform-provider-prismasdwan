# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "security_policy_local_prefix"
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

resource "prismasdwan_security_policy_local_prefix" "test_security_local_prefix" {
  name        = "corporate_security_local_prefix"
  description = "Local prefix for corporate security policy"
  tags        = ["corporate", "security", "local"]
}

resource "prismasdwan_security_policy_local_prefix" "development_local_prefix" {
  name        = "dev_security_local_prefix"
  description = "Local prefix for development environment security policy"
  tags        = ["development", "security", "local"]
}

resource "prismasdwan_security_policy_local_prefix" "production_local_prefix" {
  name        = "prod_security_local_prefix"
  description = "Local prefix for production environment security policy"
  tags        = ["production", "security", "local"]
}
