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
  auto_generated = false
  description    = "Managed by Terraform"
  name           = "example_name"
  route_map_entries = [{
    continue_entry = "example_continue_entry"
    match = {
      as_path_id         = "<as_path_id>"
      community_list_id  = "<community_list_id>"
      ip_next_hop_id     = "<ip_next_hop_id>"
      ip_prefix_list_id  = "<ip_prefix_list_id>"
      metric             = 1
      service_binding_id = "<service_binding_id>"
      tag                = 10
    }
    order  = 1
    permit = false
    set = {
      additive_community = false
      as_path_prepend    = "example_as_path_prepend"
      community          = "example-community"
      ip_next_hop        = "example_ip_next_hop"
      ip_v6_next_hop     = "example_ip_v6_next_hop"
      local_preference   = 10
      metric             = 1
      tag                = 10
      type               = "type-1"
      weight             = 10
    }
  }]
  tags     = ["terraform"]
  used_for = "bgp"
}
