# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_policy_stack".
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

resource "prismasdwan_path_policy_stack" "example" {
  default_policysetstack = false
  defaultrule_policyset = {
    clone_from            = "example_clone_from"
    defaultrule_policyset = false
    description           = "Managed by Terraform"
    disabled              = false
    disabled_reason       = "example_disabled_reason"
    inactive              = false
    inactive_reason       = "example_inactive_reason"
    name                  = "example_name"
    policy_req_version    = "example_policy_req_version"
    policy_rules = [{
      app_def_ids = ["<app_def_id>"]
      best_path_config = {
        metric          = "latency"
        metric_type     = "probe"
        probe_config_id = "<probe_config_id>"
      }
      default_rule    = false
      description     = "Managed by Terraform"
      dest_device_ids = ["<dest_device_id>"]
      destination_prefixes = {
        description   = "Managed by Terraform"
        ipv4_prefixes = ["10.10.0.0/16"]
        ipv6_prefixes = ["2001:db8:10::/48"]
        name          = "example_name"
        tags          = ["terraform"]
      }
      destination_prefixes_id = "<destination_prefixes_id>"
      disabled                = false
      disabled_reason         = "example_disabled_reason"
      enabled                 = true
      inactive                = false
      inactive_reason         = "example_inactive_reason"
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
      policyset_id = "<policyset_id>"
      region       = "example_region"
      service_context = {
        active_service_label_id   = "<active_service_label_id>"
        active_service_label_type = "CG_TRANSIT"
        backup_service_label_id   = "<backup_service_label_id>"
        backup_service_label_type = "CG_TRANSIT"
        type                      = "allowed-transit"
      }
      source_prefixes = {
        description   = "Managed by Terraform"
        ipv4_prefixes = ["10.10.0.0/16"]
        ipv6_prefixes = ["2001:db8:10::/48"]
        name          = "example_name"
        tags          = ["terraform"]
      }
      source_prefixes_id = "<source_prefixes_id>"
      src_device_ids     = ["<src_device_id>"]
      tags               = ["terraform"]
      user_or_group = {
        user_group_ids = ["<user_group_id>"]
        user_ids       = ["<user_id>"]
      }
    }]
    region          = "example_region"
    send_to_element = false
    tags            = ["terraform"]
  }
  defaultrule_policyset_id = "<defaultrule_policyset_id>"
  description              = "Managed by Terraform"
  disabled                 = false
  disabled_reason          = "example_disabled_reason"
  inactive                 = false
  inactive_reason          = "example_inactive_reason"
  legacy_policystack       = false
  name                     = "example_name"
  policyset_ids            = ["<policyset_id>"]
  policyset_ids_update     = false
  policysets = [{
    clone_from      = "example_clone_from"
    description     = "Managed by Terraform"
    disabled        = false
    disabled_reason = "example_disabled_reason"
    inactive        = false
    inactive_reason = "example_inactive_reason"
    name            = "example_name"
    policy_rules = [{
      description     = "Managed by Terraform"
      disabled        = false
      disabled_reason = "example_disabled_reason"
      inactive        = false
      inactive_reason = "example_inactive_reason"
      name            = "example_name"
      policyset_id    = "<policyset_id>"
      region          = "example_region"
      tags            = ["terraform"]
    }]
    region          = "example_region"
    send_to_element = false
    tags            = ["terraform"]
  }]
  region = "example_region"
  tags   = ["terraform"]
}
