# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "anynet_link".
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

resource "prismasdwan_anynet_link" "example" {
  admin_up             = true
  description          = "Managed by Terraform"
  ep1_hub_cluster_id   = "<ep1_hub_cluster_id>"
  ep1_site_id          = "<ep1_site_id>"
  ep1_wan_interface_id = "<ep1_wan_interface_id>"
  ep2_hub_cluster_id   = "<ep2_hub_cluster_id>"
  ep2_site_id          = "<ep2_site_id>"
  ep2_wan_interface_id = "<ep2_wan_interface_id>"
  forced               = false
  name                 = "example_name"
  tags                 = ["terraform"]
  type                 = "AUTO"
  vpnlink_configuration = {
    keep_alive_failure_count = 3
    keep_alive_interval      = 100
  }
}
