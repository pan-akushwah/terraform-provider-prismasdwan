# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_performance_profile: Manages a Prisma SD-WAN Performance Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/performance_profile/example,
# data_sources/performance_profile/filters.
#
# Provider configuration (see the provider documentation):
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

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

#
# Reading performance profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_performance_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_performance_profile.performance_profile_1.name
  }
  depends_on = [prismasdwan_performance_profile.performance_profile_1]
}

# by id
data "prismasdwan_performance_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_performance_profile.performance_profile_1.id
  }
  depends_on = [prismasdwan_performance_profile.performance_profile_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_performance_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_performance_profile.performance_profile_1]
}

output "performance_profile_found" {
  value = [for o in coalesce(data.prismasdwan_performance_profile.find_by_name.items, []) : o.id]
}
