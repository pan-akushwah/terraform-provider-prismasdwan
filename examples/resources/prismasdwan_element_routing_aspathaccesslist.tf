# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_routing_aspathaccesslist"
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

resource "prismasdwan_element_routing_aspathaccesslist" "example_routing_aspathaccesslist" {
 x_parameters = {
    site_id = prismasdwan_site.site_1.id
    element_id = prismasdwan_element.element_1.id
  }
  name = "example_routing_aspathaccesslist"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["lorem", "ipsum"]
  auto_generated = false
  as_path_regex_list = [
    {
      order = 1
      permit = true
      as_path_regex = "^6602$"
    },
    {
      order = 11
      permit = true
      as_path_regex = "^765"
    },
    {
      order = 21
      permit = true
      as_path_regex = "^ab123"
    }
  ]
}
