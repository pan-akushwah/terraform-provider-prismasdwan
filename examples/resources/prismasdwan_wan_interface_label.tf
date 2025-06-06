# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "wan_interface_label"
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

resource "prismasdwan_resource_locator" "circuit_category_private_1" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "private-1"
}

resource "prismasdwan_resource_locator" "circuit_category_public_1" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "public-1"
}