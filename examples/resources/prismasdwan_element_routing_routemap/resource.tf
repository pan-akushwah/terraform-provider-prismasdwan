# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_routing_routemap".
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

resource "prismasdwan_element_routing_routemap" "example" {
  auto_generated = true
  description = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  route_map_entries = [{
    continue_entry = "Lorem-Ipsum"
    match = {
      as_path_id = "123456789"
      community_list_id = "123456789"
      ip_next_hop_id = "123456789"
      ip_prefix_list_id = "123456789"
      metric = 1234
      service_binding_id = "123456789"
      tag = 1234
    }
    order = 1234
    permit = true
    set = {
      additive_community = true
      as_path_prepend = "Lorem-Ipsum"
      community = "Lorem-Ipsum"
      ip_next_hop = "Lorem-Ipsum"
      ip_v6_next_hop = "Lorem-Ipsum"
      local_preference = 1234
      metric = 1234
      tag = 1234
      type = "Lorem-Ipsum"
      weight = 1234
    }
  }]
  tags = ["lorem"]
  used_for = "Lorem-Ipsum"
}
