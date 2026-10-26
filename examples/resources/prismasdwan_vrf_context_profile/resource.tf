# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "vrf_context_profile".
# This file is generated - do not edit by hand.
#
# Before using this example, configure the Prisma SD-WAN provider:
#
#   terraform {
#     required_providers {
#       prismasdwan = {
#         source  = "paloaltonetworks/prismasdwan"
#       }
#     }
#   }
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

resource "prismasdwan_vrf_context_profile" "example" {
  default_vrf_context_profile = false
  description                 = "Managed by Terraform"
  name                        = "example_name"
  tags                        = ["terraform"]
  vrf_context_ids             = ["<vrf_context_id>"]
  vrf_context_route_leak_rules = [{
    description         = "Managed by Terraform"
    dest_vrf_context_id = "<dest_vrf_context_id>"
    ipv4_prefixes       = ["10.10.0.0/16"]
    name                = "example_name"
    src_vrf_context_id  = "<src_vrf_context_id>"
  }]
}
