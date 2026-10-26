# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_wan_interface".
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

resource "prismasdwan_site_wan_interface" "example" {
  app_acceleration_enabled = false
  bw_config_mode           = "auto"
  bwc_enabled              = false
  description              = "Managed by Terraform"
  l3_reachability = {
    probe_config_ids    = ["<probe_config_id>"]
    use_element_default = false
  }
  label_id     = "<label_id>"
  link_bw_down = 1.5
  link_bw_up   = 1.5
  lqm_config = {
    hub_site_ids                        = ["<hub_site_id>"]
    inter_packet_gap                    = 10
    statistic                           = "example_statistic"
    use_hub_sites                       = false
    use_prisma_access_service_endpoints = false
  }
  lqm_enabled                             = false
  name                                    = "example_name"
  network_id                              = "<network_id>"
  probe_profile_id                        = "<probe_profile_id>"
  tags                                    = ["terraform"]
  type                                    = "PUBLIC_WAN"
  use_for_application_reachability_probes = false
  use_for_controller_connections          = false
  use_lqm_for_non_hub_paths               = false
  vpnlink_configuration = {
    keep_alive_failure_count = 3
    keep_alive_interval      = 100
  }
}
