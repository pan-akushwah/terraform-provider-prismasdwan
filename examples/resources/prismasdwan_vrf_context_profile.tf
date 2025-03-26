# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "vrf_context_profile"
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

resource "prismasdwan_vrf_context_profile" "test_vrf_context_profile_1" {
  name = "example vrf context profile"
  description = "sample description"
  tags = ["tag1", "tag2"]
  default_vrf_context_profile = false
  vrf_context_ids = [
    prismasdwan_vrf_context.default_vrf_context.id,
    prismasdwan_vrf_context.test_vrf_context_1.id,
    prismasdwan_vrf_context.test_vrf_context_2.id
  ]
  vrf_context_route_leak_rules = [
    {
      name = "rule001"
      description = "sample rule description"
      src_vrf_context_id = prismasdwan_vrf_context.test_vrf_context_2.id
      dest_vrf_context_id = prismasdwan_vrf_context.test_vrf_context_1.id
      ipv4_prefixes = [
        "10.10.10.0/24"
      ]
    }
  ]
}
