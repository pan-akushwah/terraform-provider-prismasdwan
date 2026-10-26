# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_policy_rule".
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

resource "prismasdwan_path_policy_rule" "example" {
  app_def_ids = ["<app_def_id>"]
  best_path_config = {
    metric          = "LATENCY"
    metric_type     = "PROBE"
    probe_config_id = "<probe_config_id>"
  }
  description             = "Managed by Terraform"
  dest_device_ids         = ["<dest_device_id>"]
  destination_prefixes_id = "<destination_prefixes_id>"
  enabled                 = true
  name                    = "example_name"
  network_context_id      = "<network_context_id>"
  order_number            = 1
  paths_allowed = {
    active_paths = [{
      label     = "public-1"
      path_type = "direct"
    }]
    backup_paths = [{
      label     = "public-1"
      path_type = "direct"
    }]
    l3_failure_paths = [{
      label     = "public-1"
      path_type = "direct"
    }]
  }
  service_context = {
    active_service_label_id   = "<active_service_label_id>"
    active_service_label_type = "CG_TRANSIT"
    backup_service_label_id   = "<backup_service_label_id>"
    backup_service_label_type = "CG_TRANSIT"
    type                      = "allowed-transit"
  }
  source_prefixes_id = "<source_prefixes_id>"
  src_device_ids     = ["<src_device_id>"]
  tags               = ["terraform"]
  user_or_group = {
    user_group_ids = ["<user_group_id>"]
    user_ids       = ["<user_id>"]
  }
}
