# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "performance_policy_stack".
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

resource "prismasdwan_performance_policy_stack" "example" {
  default_policysetstack = false
  defaultrule_policyset = {
    clone_from            = "example_clone_from"
    defaultrule_policyset = false
    description           = "Managed by Terraform"
    disabled              = false
    disabled_reason       = "example_disabled_reason"
    inactive              = false
    inactive_reason       = "example_inactive_reason"
    link_health_rules = [{
      actions = [{
        action_type = "raise_alarm"
        always_on   = false
        app_perf = {
          bad_health_thresholds = {
            clear_below = 10
            raise_above = 10
          }
          monitoring_approach = "moderate"
        }
        circuit_utilization_perf = {
          bad_health_thresholds = {
            clear_below = 10
            raise_above = 10
          }
          monitoring_approach = "moderate"
        }
        lqm_perf = {
          bad_health_thresholds = {
            clear_below = 10
            raise_above = 10
          }
          monitoring_approach = "moderate"
        }
        probe_perf = {
          bad_health_thresholds = {
            clear_below = 10
            raise_above = 10
          }
          monitoring_approach = "moderate"
        }
        sys_perf = {
          bad_health_thresholds = {
            clear_below = 10
            raise_above = 10
          }
          monitoring_approach = "moderate"
        }
      }]
      app_acceleration_update = false
      app_filters = {
        app_transfer_types = ["rt-audio"]
        application_ids    = ["<application_id>"]
      }
      default_rule        = false
      description         = "Managed by Terraform"
      disabled            = false
      disabled_reason     = "example_disabled_reason"
      enabled             = true
      inactive            = false
      inactive_reason     = "example_inactive_reason"
      name                = "example_name"
      network_context_ids = ["<network_context_id>"]
      path_filter_update  = false
      path_filters = [{
        label     = "public-1"
        path_type = "direct"
      }]
      policyset_id      = "<policyset_id>"
      region            = "example_region"
      service_label_ids = ["<service_label_id>"]
      tags              = ["terraform"]
      thresholdprofile = {
        circuit_utilization_metrics_thresholds = {
          percentage_circuit_utilization = 10
        }
        description     = "Managed by Terraform"
        disabled        = false
        disabled_reason = "example_disabled_reason"
        flow_metrics_thresholds = {
          percentage_flow_utilization = 10
        }
        hard_limit_app_metrics = {
          max_init_failure_rate = 10
          max_rtt               = 10
          udp_trt               = 10
        }
        inactive        = false
        inactive_reason = "example_inactive_reason"
        is_default      = false
        lqm_thresholds = {
          max_jitter      = 10
          max_latency     = 10
          max_packet_loss = 10
          min_mos         = 5
        }
        name   = "example_name"
        region = "example_region"
        soft_limit_app_metrics = {
          max_init_failure_rate = 10
          max_rtt               = 10
          udp_trt               = 10
        }
        synthetic_probe_thresholds = {
          dns_txn_failure_pct = {
            probe_config_id = "<probe_config_id>"
            value           = 10
          }
          init_failure_pct = {
            probe_config_id = "<probe_config_id>"
            value           = 10
          }
          jitter = {
            probe_config_id = "<probe_config_id>"
            value           = 10
          }
          latency = {
            probe_config_id = "<probe_config_id>"
            value           = 10
          }
          packet_loss = {
            probe_config_id = "<probe_config_id>"
            value           = 10
          }
        }
        system_health_metrics_thresholds = {
          cpu_utilization    = 10
          disk_utilization   = 10
          memory_utilization = 10
        }
        tags = ["terraform"]
      }
      thresholdprofile_id = "<thresholdprofile_id>"
      type                = "app_circuit_health"
    }]
    name = "example_name"
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
  }
  defaultrule_policyset_id = "<defaultrule_policyset_id>"
  description              = "Managed by Terraform"
  disabled                 = false
  disabled_reason          = "example_disabled_reason"
  inactive                 = false
  inactive_reason          = "example_inactive_reason"
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
