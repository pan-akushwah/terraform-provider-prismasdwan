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
    percentage_circuit_utilization = 1234
  }
  description = "Lorem-Ipsum"
  flow_metrics_thresholds = {
    percentage_flow_utilization = 1234
  }
  hard_limit_app_metrics = {
    max_init_failure_rate = 1234
    max_rtt = 1234
    udp_trt = 1234
  }
  lqm_thresholds = {
    max_jitter = 1234
    max_latency = 1234
    max_packet_loss = 1234
    min_mos = 1234
  }
  name = "Lorem-Ipsum"
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
