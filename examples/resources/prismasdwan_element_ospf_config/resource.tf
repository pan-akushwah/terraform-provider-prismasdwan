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
  advertise_fabric_default_route = true
  areas = [{
    area_id = 1234
    area_type = "Lorem-Ipsum"
  }]
  cost_for_default_route = 1234
  description = "Lorem-Ipsum"
  interfaces = [{
    area_id = 1234
    interface_id = "123456789"
    ospf_config_override = {
      cost = 1234
      dead_interval = 1234
      hello_interval = 1234
      md5_key_id = 1234
      md5_secret = "base64(<secret-string>)"
      retransmit_interval = 1234
      transmit_delay = 1234
    }
  }]
  name = "Lorem-Ipsum"
  prefix_adv_route_map_id = "123456789"
  prefix_adv_type_to_lan = "Lorem-Ipsum"
  redistribute_route_map_id = "123456789"
  router_id = "123456789"
  scope = "Lorem-Ipsum"
  shutdown = true
  tags = ["lorem"]
  vrf_context_id = "123456789"
}
