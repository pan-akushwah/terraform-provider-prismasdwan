# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "nat_policy_set".
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

resource "prismasdwan_nat_policy_set" "example" {
  description                       = "Managed by Terraform"
  destination_zone_policyrule_order = ["example_destination_zone_policyrule_order"]
  disabled                          = false
  disabled_reason                   = "example_disabled_reason"
  inactive                          = false
  inactive_reason                   = "example_inactive_reason"
  name                              = "example_name"
  policy_req_version                = "example_policy_req_version"
  policy_rules = [{
    actions = [{
      nat_pool_id = "<nat_pool_id>"
      port        = 443
      protocols   = ["example_protocols"]
      type        = "no_nat"
    }]
    description = "Managed by Terraform"
    destination_ports = [{
      from = 10
      to   = 10
    }]
    destination_prefixes_id = "<destination_prefixes_id>"
    destination_zone_id     = "<destination_zone_id>"
    enabled                 = true
    name                    = "example_name"
    protocol                = 10
    source_ports = [{
      from = 10
      to   = 10
    }]
    source_prefixes_id = "<source_prefixes_id>"
    source_zone_id     = "<source_zone_id>"
    tags               = ["terraform"]
  }]
  region                       = "example_region"
  send_to_element              = false
  source_zone_policyrule_order = ["example_source_zone_policyrule_order"]
  tags                         = ["terraform"]
  update_order                 = false
}
