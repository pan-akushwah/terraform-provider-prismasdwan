# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "probe_profile"
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

# Resource locators for probe configurations (required)
resource "prismasdwan_resource_locator" "probe_config" {
  resource_type           = "prismasdwan_probe_config"
  resource_property       = "name"
  resource_property_value = "some existing probe config"
}

resource "prismasdwan_probe_profile" "development_probe_profile" {
  # Required fields
  name             = "development profile"
  probe_config_ids = [prismasdwan_resource_locator.probe_config.result]
  description      = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags             = ["development"]
}
