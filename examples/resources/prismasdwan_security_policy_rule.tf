# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "security_policy_rule"
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

resource "prismasdwan_security_policy_rule" "example_security_policy_rule" {
  x_parameters = {
    policy_set_id = prismasdwan_security_policy_set.example_policy_set.id
  }
  name                   = "example_security_policy_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["production", "firewall"]
  app_def_ids            = [prismasdwan_appdefs.example_app.id]
  source_zone_ids        = [prismasdwan_security_zone.example_source_zone.id]
  source_prefix_ids      = [prismasdwan_security_policy_local_prefix.example_local_prefix.id]
  destination_prefix_ids = [prismasdwan_security_policy_global_prefix.example_global_prefix.id]
  destination_zone_ids   = [prismasdwan_security_zone.example_destination_zone.id]
  action                 = "allow"
  enabled                = true
  services               = []
}