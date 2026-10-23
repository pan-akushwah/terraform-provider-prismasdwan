# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "performance_policy_set".
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

resource "prismasdwan_performance_policy_set" "example" {
  clone_from = "Lorem-Ipsum"
  defaultrule_policyset = true
  description = "Lorem-Ipsum"
  disabled = true
  disabled_reason = "Lorem-Ipsum"
  inactive = true
  inactive_reason = "Lorem-Ipsum"
  link_health_rules = [{
    actions = [{
      action_type = "Lorem-Ipsum"
      always_on = true
      app_perf = {
        bad_health_thresholds = {
          clear_below = 1234
          raise_above = 1234
        }
        monitoring_approach = "Lorem-Ipsum"
      }
      circuit_utilization_perf = {
        bad_health_thresholds = {
          clear_below = 1234
          raise_above = 1234
        }
        monitoring_approach = "Lorem-Ipsum"
      }
      lqm_perf = {
        bad_health_thresholds = {
          clear_below = 1234
          raise_above = 1234
        }
        monitoring_approach = "Lorem-Ipsum"
      }
      probe_perf = {
        bad_health_thresholds = {
          clear_below = 1234
          raise_above = 1234
        }
        monitoring_approach = "Lorem-Ipsum"
      }
      sys_perf = {
        bad_health_thresholds = {
          clear_below = 1234
          raise_above = 1234
        }
        monitoring_approach = "Lorem-Ipsum"
      }
    }]
    app_acceleration_update = true
    app_filters = {
      app_transfer_types = ["Lorem-Ipsum"]
      application_ids = ["Lorem-Ipsum"]
    }
    default_rule = true
    description = "Lorem-Ipsum"
    disabled = true
    disabled_reason = "Lorem-Ipsum"
    enabled = true
    inactive = true
    inactive_reason = "Lorem-Ipsum"
    name = "Lorem-Ipsum"
    network_context_ids = ["Lorem-Ipsum"]
    path_filter_update = true
    path_filters = [{
      label = "Lorem-Ipsum"
      path_type = "Lorem-Ipsum"
    }]
    policyset_id = "123456789"
    region = "Lorem-Ipsum"
    service_label_ids = ["Lorem-Ipsum"]
    tags = ["lorem"]
    thresholdprofile = {
      circuit_utilization_metrics_thresholds = {
        percentage_circuit_utilization = 1234
      }
      description = "Lorem-Ipsum"
      disabled = true
      disabled_reason = "Lorem-Ipsum"
      flow_metrics_thresholds = {
        percentage_flow_utilization = 1234
      }
      hard_limit_app_metrics = {
        max_init_failure_rate = 1234
        max_rtt = 1234
        udp_trt = 1234
      }
      inactive = true
      inactive_reason = "Lorem-Ipsum"
      is_default = true
      lqm_thresholds = {
        max_jitter = 1234
        max_latency = 1234
        max_packet_loss = 1234
        min_mos = 1234
      }
      name = "Lorem-Ipsum"
      region = "Lorem-Ipsum"
      soft_limit_app_metrics = {
        max_init_failure_rate = 1234
        max_rtt = 1234
        udp_trt = 1234
      }
      synthetic_probe_thresholds = {
        dns_txn_failure_pct = {
          probe_config_id = "123456789"
          value = 1234
        }
        init_failure_pct = {
          probe_config_id = "123456789"
          value = 1234
        }
        jitter = {
          probe_config_id = "123456789"
          value = 1234
        }
        latency = {
          probe_config_id = "123456789"
          value = 1234
        }
        packet_loss = {
          probe_config_id = "123456789"
          value = 1234
        }
      }
      system_health_metrics_thresholds = {
        cpu_utilization = 1234
        disk_utilization = 1234
        memory_utilization = 1234
      }
      tags = ["lorem"]
    }
    thresholdprofile_id = "123456789"
    type = "Lorem-Ipsum"
  }]
  name = "Lorem-Ipsum"
  policy_rules = [{
    description = "Lorem-Ipsum"
    disabled = true
    disabled_reason = "Lorem-Ipsum"
    inactive = true
    inactive_reason = "Lorem-Ipsum"
    name = "Lorem-Ipsum"
    policyset_id = "123456789"
    region = "Lorem-Ipsum"
    tags = ["lorem"]
  }]
  region = "Lorem-Ipsum"
  send_to_element = true
  tags = ["lorem"]
}
