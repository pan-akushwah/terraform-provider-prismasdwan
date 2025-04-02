# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_routing_routemap"
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

resource "prismasdwan_element_routing_routemap" "example_routing_routemap" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
    element_id = prismasdwan_element.element_1.id
  }
  name = "example_routemap"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["lorem", "ipsum"]
  route_map_entries = [
    {
      order = 10
      permit = true
      match = {
        as_path_id = prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist.id
        ip_prefix_list_id = prismasdwan_element_routing_prefixlist.example_routing_prefixlist.id
        ip_next_hop_id = prismasdwan_element_routing_prefixlist.example_routing_prefixlist.id
        community_list_id = prismasdwan_element_routing_ipcommunitylist.example_routing_ipcommunitylist.id
        tag = 0
        metric = null
      }
      set = {
        as_path_prepend = "5"
        local_preference = 0
        weight = 1
        community = null
        ip_next_hop = "peer-address"
        ip_v6_next_hop = null
        tag = 0
        additive_community = false
        type = null
        metric = null
      }
      continue_entry = null
    }
  ]
  auto_generated = false
  used_for = "bgp"
}
