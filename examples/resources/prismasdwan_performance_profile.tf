# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "performance_profile"
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
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#
resource "prismasdwan_performance_profile" "performance_profile_1" {
  name        = "high_performance_profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform"]

  lqm_thresholds = {
    max_latency     = 1
    max_jitter      = 11
    max_packet_loss = 11
    min_mos         = 1
  }
}

resource "prismasdwan_performance_profile" "performance_profile_2" {
  name        = "app_metrics_profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform"]

  soft_limit_app_metrics = {
    max_init_failure_rate = 2
    max_rtt               = 22
    udp_trt               = 12
  }

  hard_limit_app_metrics = {
    max_init_failure_rate = 2
    max_rtt               = 22
    udp_trt               = 12
  }
}

resource "prismasdwan_performance_profile" "performance_profile_3" {
  name        = "system_health_profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform"]

  system_health_metrics_thresholds = {
    cpu_utilization    = 11
    memory_utilization = 11
    disk_utilization   = 11
  }
}

resource "prismasdwan_performance_profile" "performance_profile_4" {
  name        = "circuit_utilization_profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform"]

  circuit_utilization_metrics_thresholds = {
    percentage_circuit_utilization = 11
  }
}

resource "prismasdwan_performance_profile" "performance_profile_5" {
  name        = "flow_metrics_profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform"]

  flow_metrics_thresholds = {
    percentage_flow_utilization = 11
  }
}
