# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ospf_config".
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

resource "prismasdwan_element_ospf_config" "example" {
  advertise_fabric_default_route = false
  areas = [{
    area_id   = 10
    area_type = "NORMAL"
  }]
  cost_for_default_route = 1
  description            = "Managed by Terraform"
  interfaces = [{
    area_id      = 10
    interface_id = "<interface_id>"
    ospf_config_override = {
      cost                = 1
      dead_interval       = 30
      hello_interval      = 30
      md5_key_id          = 10
      md5_secret          = "<secret>"
      retransmit_interval = 30
      transmit_delay      = 10
    }
  }]
  name                      = "example_name"
  prefix_adv_route_map_id   = "<prefix_adv_route_map_id>"
  prefix_adv_type_to_lan    = "example_prefix_adv_type_to_lan"
  redistribute_route_map_id = "<redistribute_route_map_id>"
  router_id                 = "<router_id>"
  scope                     = "example_scope"
  shutdown                  = false
  tags                      = ["terraform"]
  vrf_context_id            = "<vrf_context_id>"
}
