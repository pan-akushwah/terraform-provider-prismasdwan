# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "performance_policy_rule".
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

resource "prismasdwan_performance_policy_rule" "example" {
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
  app_filters = {
    app_transfer_types = ["rt-audio"]
    application_ids    = ["<application_id>"]
  }
  description         = "Managed by Terraform"
  enabled             = true
  name                = "example_name"
  network_context_ids = ["<network_context_id>"]
  path_filters = [{
    label     = "public-1"
    path_type = "direct"
  }]
  service_label_ids   = ["<service_label_id>"]
  tags                = ["terraform"]
  thresholdprofile_id = "<thresholdprofile_id>"
  type                = "app_circuit_health"
}
