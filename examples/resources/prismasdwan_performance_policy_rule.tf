# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "performance_policy_rule"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_performance_policy_rule" "performance_policy_rule_1" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  name                = "example_system_health_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                = ["123"]
  thresholdprofile_id = prismasdwan_performance_profile.performance_profile_5.id
  actions             = [
    {
      action_type = "raise_alarm"
      always_on   = false
    }
  ]
  enabled = true
  type    = "system_site_health"
}

resource "prismasdwan_performance_policy_rule" "performance_policy_rule_2" {
  x_parameters = {
    perfmgmtpolicyset_id = prismasdwan_performance_policy_set.performance_policy_set_1.id
  }
  name                = "example_app_circuit_health_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                = ["123"]
  thresholdprofile_id = prismasdwan_performance_profile.performance_profile_2.id
  enabled             = true
  type                = "app_circuit_health"
  app_filters = {
    app_transfer_types = [
      "bulk",
      "rt-audio",
      "rt-video",
      "transactional"
    ]
  }
  path_filters = [
    {
      label     = "public-*",
      path_type = "direct"
    },
    {
      label     = "public-*",
      path_type = "vpn"
    },
    {
      label     = "public-*",
      path_type = "servicelink"
    }
  ]
  actions = [
    {
      app_perf = {
        bad_health_thresholds = {
          raise_above = 70
          clear_below = 50
        }
        monitoring_approach = "moderate"
      }
      action_type = "raise_alarm"
      always_on   = false
    }
  ]
}
