# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "event_correlation_policy_rule"
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

resource "prismasdwan_event_correlation_policy_rule" "rule_001" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  name        = "TF Managed Event Rule - 001"
  tags        = ["terraform"]
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  suppress    = "yes"
  priority    = "p3"

  start_time    = 1770057000000
  end_time      = 1771353000000
  resource_type = "site"
  # resource_ids: []
  sub_resource_type = "hub"
  event_codes = [
    "APPLICATION_CUSTOM_RULE_CONFLICT",
    "APPLICATION_PERFORMANCE_DEGRADED"
  ]
  escalation_rules = {
    standing_rule = {
      standing_for = 60
      priority     = "p2"
    }
    flap_rule = {
      flap_duration = 10
      flap_rate     = 3
    }
  }
}

resource "prismasdwan_event_correlation_policy_rule" "rule_002" {
  x_parameters = {
    policy_set_id = resource.prismasdwan_event_correlation_policy_set.set001.id
  }
  name        = "TF Managed Event Rule - 002"
  tags        = ["terraform"]
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  suppress    = "yes"
  priority    = "p3"

  start_time    = 1770057000000
  end_time      = 1771353000000
  resource_type = "site"
  # resource_ids: []
  sub_resource_type = "spoke"
  event_codes = [
    "APPLICATION_CUSTOM_RULE_CONFLICT",
    "APPLICATION_PERFORMANCE_DEGRADED"
  ]
  escalation_rules = {
    standing_rule = {
      standing_for = 60
      priority     = "p2"
    }
    flap_rule = {
      flap_duration = 10
      flap_rate     = 3
    }
  }
}
