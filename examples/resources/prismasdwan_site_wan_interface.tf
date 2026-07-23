# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_wan_interface"
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

resource "prismasdwan_site_wan_interface" "site_wan_interface_1" {
  # This is needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  name = "tf managed site interface#1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["example", "tag"]
  type = "privatewan"
  network_id = prismasdwan_wan_network.test_private_wan_network_1.id
  link_bw_down = 30
  link_bw_up = 10
  bw_config_mode = "manual"
  label_id = prismasdwan_resource_locator.circuit_category_private_1.result
  bfd_mode = "aggressive"
  lqm_enabled = true
  bwc_enabled = false
  cost = 128
}
