# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "wan_interface_label".
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

resource "prismasdwan_wan_interface_label" "example" {
  app_acceleration_enabled = false
  bwc_enabled              = false
  description              = "Managed by Terraform"
  l3_reachability = {
    probe_config_ids    = ["<probe_config_id>"]
    use_element_default = false
  }
  label                                   = "public-1"
  lqm_enabled                             = false
  name                                    = "example_name"
  probe_profile_id                        = "<probe_profile_id>"
  tags                                    = ["terraform"]
  use_for_application_reachability_probes = false
  use_for_controller_connections          = false
  use_lqm_for_non_hub_paths               = false
  vpnlink_configuration = {
    keep_alive_failure_count = 3
    keep_alive_interval      = 100
  }
}
