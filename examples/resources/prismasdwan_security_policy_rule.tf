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
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# App definitions are built in; look one up by name rather than hardcoding a tenant-specific id.
resource "prismasdwan_resource_locator" "icmp_app_def" {
  resource_type           = "prismasdwan_app_def"
  resource_property       = "display_name"
  resource_property_value = "icmp"
}

resource "prismasdwan_security_policy_rule" "example_security_policy_rule" {
  x_parameters = {
    policy_set_id = prismasdwan_security_policy_set.development_policy_set.id
  }
  name                   = "example_security_policy_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["production", "firewall"]
  app_def_ids            = [prismasdwan_resource_locator.icmp_app_def.result]
  source_zone_ids        = [prismasdwan_security_zone.dmz_zone.id]
  source_prefix_ids      = [prismasdwan_security_policy_local_prefix.development_local_prefix.id]
  destination_prefix_ids = [prismasdwan_security_policy_global_prefix.corporate_security_global_prefix.id]
  destination_zone_ids   = [prismasdwan_security_zone.production_zone.id]
  action                 = "allow"
  enabled                = true
  services               = []
}