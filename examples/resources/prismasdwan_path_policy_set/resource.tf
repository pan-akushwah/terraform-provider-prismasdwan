# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_policy_set".
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

resource "prismasdwan_path_policy_set" "example" {
  clone_from = "Lorem-Ipsum"
  defaultrule_policyset = true
  description = "Lorem-Ipsum"
  disabled = true
  disabled_reason = "Lorem-Ipsum"
  inactive = true
  inactive_reason = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  policy_req_version = "Lorem-Ipsum"
  policy_rules = [{
    app_def_ids = ["Lorem-Ipsum"]
    best_path_config = {
      metric = "Lorem-Ipsum"
      metric_type = "Lorem-Ipsum"
      probe_config_id = "123456789"
    }
    default_rule = true
    description = "Lorem-Ipsum"
    dest_device_ids = ["Lorem-Ipsum"]
    destination_prefixes = {
      description = "Lorem-Ipsum"
      ipv4_prefixes = ["Lorem-Ipsum"]
      ipv6_prefixes = ["Lorem-Ipsum"]
      name = "Lorem-Ipsum"
      tags = ["lorem"]
    }
    destination_prefixes_id = "123456789"
    disabled = true
    disabled_reason = "Lorem-Ipsum"
    enabled = true
    inactive = true
    inactive_reason = "Lorem-Ipsum"
    name = "Lorem-Ipsum"
    network_context_id = "123456789"
    order_number = 1234
    paths_allowed = {
      active_paths = [{
        label = "Lorem-Ipsum"
        path_type = "Lorem-Ipsum"
      }]
      backup_paths = [{
        label = "Lorem-Ipsum"
        path_type = "Lorem-Ipsum"
      }]
      l3_failure_paths = [{
        label = "Lorem-Ipsum"
        path_type = "Lorem-Ipsum"
      }]
    }
    policyset_id = "123456789"
    region = "Lorem-Ipsum"
    service_context = {
      active_service_label_id = "123456789"
      active_service_label_type = "Lorem-Ipsum"
      backup_service_label_id = "123456789"
      backup_service_label_type = "Lorem-Ipsum"
      type = "Lorem-Ipsum"
    }
    source_prefixes = {
      description = "Lorem-Ipsum"
      ipv4_prefixes = ["Lorem-Ipsum"]
      ipv6_prefixes = ["Lorem-Ipsum"]
      name = "Lorem-Ipsum"
      tags = ["lorem"]
    }
    source_prefixes_id = "123456789"
    src_device_ids = ["Lorem-Ipsum"]
    tags = ["lorem"]
    user_or_group = {
      user_group_ids = ["Lorem-Ipsum"]
      user_ids = ["Lorem-Ipsum"]
    }
  }]
  region = "Lorem-Ipsum"
  send_to_element = true
  tags = ["lorem"]
}
