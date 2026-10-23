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
  app_filters = {
    app_transfer_types = ["Lorem-Ipsum"]
    application_ids = ["Lorem-Ipsum"]
  }
  description = "Lorem-Ipsum"
  enabled = true
  name = "Lorem-Ipsum"
  network_context_ids = ["Lorem-Ipsum"]
  path_filters = [{
    label = "Lorem-Ipsum"
    path_type = "Lorem-Ipsum"
  }]
  service_label_ids = ["Lorem-Ipsum"]
  tags = ["lorem"]
  thresholdprofile_id = "123456789"
  type = "Lorem-Ipsum"
}
