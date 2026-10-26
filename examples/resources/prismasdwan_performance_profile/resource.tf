# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "performance_profile".
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

resource "prismasdwan_performance_profile" "example" {
  circuit_utilization_metrics_thresholds = {
    percentage_circuit_utilization = 10
  }
  description = "Managed by Terraform"
  flow_metrics_thresholds = {
    percentage_flow_utilization = 10
  }
  hard_limit_app_metrics = {
    max_init_failure_rate = 10
    max_rtt               = 10
    udp_trt               = 10
  }
  lqm_thresholds = {
    max_jitter      = 10
    max_latency     = 10
    max_packet_loss = 10
    min_mos         = 10
  }
  name = "example_name"
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
