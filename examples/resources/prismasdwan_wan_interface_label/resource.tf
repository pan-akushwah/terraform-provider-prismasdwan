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
  app_acceleration_enabled = true
  bwc_enabled = true
  description = "Lorem-Ipsum"
  l3_reachability = {
    probe_config_ids = ["Lorem-Ipsum"]
    use_element_default = true
  }
  label = "Lorem-Ipsum"
  lqm_enabled = true
  name = "Lorem-Ipsum"
  probe_profile_id = "123456789"
  tags = ["lorem"]
  use_for_application_reachability_probes = true
  use_for_controller_connections = true
  use_lqm_for_non_hub_paths = true
  vpnlink_configuration = {
    keep_alive_failure_count = 1234
    keep_alive_interval = 1234
  }
}
