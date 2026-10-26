# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_prisma_access_config".
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

resource "prismasdwan_site_prisma_access_config" "example" {
  remote_networks = [{
    edge_location_display = "example_edge_location_display"
    edge_location_value   = "example_edge_location_value"
    remote_network_names  = ["example_remote_network_names"]
    service_link_ids      = ["<service_link_id>"]
    spn_name              = "example_spn"
  }]
  site_id = "<site_id>"
}
