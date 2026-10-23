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
  description = "Lorem-Ipsum"
  destination_zone_policyrule_order = ["Lorem-Ipsum"]
  disabled = true
  disabled_reason = "Lorem-Ipsum"
  inactive = true
  inactive_reason = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  policy_req_version = "Lorem-Ipsum"
  policy_rules = [{
    actions = [{
      nat_pool_id = "123456789"
      port = 1234
      protocols = ["Lorem-Ipsum"]
      type = "Lorem-Ipsum"
    }]
    description = "Lorem-Ipsum"
    destination_ports = [{
      from = 1234
      to = 1234
    }]
    destination_prefixes_id = "123456789"
    destination_zone_id = "123456789"
    enabled = true
    name = "Lorem-Ipsum"
    protocol = 1234
    source_ports = [{
      from = 1234
      to = 1234
    }]
    source_prefixes_id = "123456789"
    source_zone_id = "123456789"
    tags = ["lorem"]
  }]
  region = "Lorem-Ipsum"
  send_to_element = true
  source_zone_policyrule_order = ["Lorem-Ipsum"]
  tags = ["lorem"]
  update_order = true
}
