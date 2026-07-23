# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_lan_network"
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

resource "prismasdwan_site_lan_network" "site_lan_network_1" {
  # This is needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  name = "example_lan_network"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["example", "network"]
  ipv4_config = {
    prefixes = [
      "31.10.10.0/24"
    ]
  }
  scope = "global"
  vrf_context_id = prismasdwan_resource_locator.default_vrf_context.result
}
