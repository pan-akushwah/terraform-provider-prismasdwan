# Deployment Status Output
output "deployment_status" {
  description = "Status of the performance profile deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "performance_profile"
    status         = "success"
  }
}

# Performance Profile ID
output "performance_profile_id" {
  description = "The ID of the created performance profile"
  value       = prismasdwan_performance_profile.performance_profile_main.id
}

# Performance Profile Name
output "performance_profile_name" {
  description = "The name of the created performance profile"
  value       = prismasdwan_performance_profile.performance_profile_main.name
}

# Description
output "performance_profile_description" {
  description = "The description of the performance profile"
  value       = prismasdwan_performance_profile.performance_profile_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the performance profile"
  value       = prismasdwan_performance_profile.performance_profile_main.tags
}

# Schema and Etag (computed fields)
output "performance_profile_schema" {
  description = "Schema version for the performance profile"
  value       = prismasdwan_performance_profile.performance_profile_main.x_schema
}

output "performance_profile_etag" {
  description = "Etag for the performance profile"
  value       = prismasdwan_performance_profile.performance_profile_main.x_etag
}

# Flow Metrics Thresholds
output "flow_metrics_thresholds" {
  description = "Flow metrics thresholds configuration"
  value       = var.flow_metrics_thresholds
}

# Circuit Utilization Metrics Thresholds
output "circuit_utilization_metrics_thresholds" {
  description = "Circuit utilization metrics thresholds configuration"
  value       = var.circuit_utilization_metrics_thresholds
}

# System Health Metrics Thresholds
output "system_health_metrics_thresholds" {
  description = "System health metrics thresholds configuration"
  value       = var.system_health_metrics_thresholds
}

# Synthetic Probe Thresholds
output "synthetic_probe_thresholds" {
  description = "Synthetic probe thresholds configuration"
  value       = var.synthetic_probe_thresholds
}

# Hard Limit App Metrics
output "hard_limit_app_metrics" {
  description = "Hard limit application metrics configuration"
  value       = var.hard_limit_app_metrics
}

# Soft Limit App Metrics
output "soft_limit_app_metrics" {
  description = "Soft limit application metrics configuration"
  value       = var.soft_limit_app_metrics
}

# LQM Thresholds
output "lqm_thresholds" {
  description = "Link Quality Monitoring thresholds configuration"
  value       = var.lqm_thresholds
}

# Complete Performance Profile Details
output "performance_profile_details" {
  description = "Complete details of the created performance profile"
  value = {
    id                                        = prismasdwan_performance_profile.performance_profile_main.id
    name                                      = prismasdwan_performance_profile.performance_profile_main.name
    description                               = prismasdwan_performance_profile.performance_profile_main.description
    tags                                      = prismasdwan_performance_profile.performance_profile_main.tags
    flow_metrics_thresholds                   = prismasdwan_performance_profile.performance_profile_main.flow_metrics_thresholds
    circuit_utilization_metrics_thresholds   = prismasdwan_performance_profile.performance_profile_main.circuit_utilization_metrics_thresholds
    system_health_metrics_thresholds         = prismasdwan_performance_profile.performance_profile_main.system_health_metrics_thresholds
    synthetic_probe_thresholds                = prismasdwan_performance_profile.performance_profile_main.synthetic_probe_thresholds
    hard_limit_app_metrics                    = prismasdwan_performance_profile.performance_profile_main.hard_limit_app_metrics
    soft_limit_app_metrics                    = prismasdwan_performance_profile.performance_profile_main.soft_limit_app_metrics
    lqm_thresholds                            = prismasdwan_performance_profile.performance_profile_main.lqm_thresholds
    x_etag                                    = prismasdwan_performance_profile.performance_profile_main.x_etag
    x_schema                                  = prismasdwan_performance_profile.performance_profile_main.x_schema
  }
}

# Performance Profile Analysis - FIXED null handling
output "profile_analysis" {
  description = "Analysis of the performance profile configuration"
  value = {
    has_description                   = prismasdwan_performance_profile.performance_profile_main.description != null
    has_tags                          = prismasdwan_performance_profile.performance_profile_main.tags != null
    has_flow_metrics                  = prismasdwan_performance_profile.performance_profile_main.flow_metrics_thresholds != null
    has_circuit_utilization_metrics   = prismasdwan_performance_profile.performance_profile_main.circuit_utilization_metrics_thresholds != null
    has_system_health_metrics         = prismasdwan_performance_profile.performance_profile_main.system_health_metrics_thresholds != null
    has_synthetic_probe_thresholds    = prismasdwan_performance_profile.performance_profile_main.synthetic_probe_thresholds != null
    has_hard_limit_app_metrics        = prismasdwan_performance_profile.performance_profile_main.hard_limit_app_metrics != null
    has_soft_limit_app_metrics        = prismasdwan_performance_profile.performance_profile_main.soft_limit_app_metrics != null
    has_lqm_thresholds                = prismasdwan_performance_profile.performance_profile_main.lqm_thresholds != null
  }
}

# Configuration Counts
output "configuration_counts" {
  description = "Counts of various configuration elements"
  value = {
    tags_count                        = var.tags != null ? length(var.tags) : 0
    flow_metrics_count                = var.flow_metrics_thresholds != null ? 1 : 0
    circuit_utilization_count         = var.circuit_utilization_metrics_thresholds != null ? 1 : 0
    system_health_metrics_count       = var.system_health_metrics_thresholds != null ? 1 : 0
    synthetic_probe_count             = var.synthetic_probe_thresholds != null ? 1 : 0
    hard_limit_metrics_count          = var.hard_limit_app_metrics != null ? 1 : 0
    soft_limit_metrics_count          = var.soft_limit_app_metrics != null ? 1 : 0
    lqm_thresholds_count              = var.lqm_thresholds != null ? 1 : 0
    total_configuration_blocks        = (
      (var.flow_metrics_thresholds != null ? 1 : 0) +
      (var.circuit_utilization_metrics_thresholds != null ? 1 : 0) +
      (var.system_health_metrics_thresholds != null ? 1 : 0) +
      (var.synthetic_probe_thresholds != null ? 1 : 0) +
      (var.hard_limit_app_metrics != null ? 1 : 0) +
      (var.soft_limit_app_metrics != null ? 1 : 0) +
      (var.lqm_thresholds != null ? 1 : 0)
    )
  }
}

# Profile Type Classification
output "profile_type" {
  description = "Classification of the performance profile type"
  value = {
    profile_scope                     = "performance"
    is_basic_profile                  = (
      var.flow_metrics_thresholds == null &&
      var.circuit_utilization_metrics_thresholds == null &&
      var.system_health_metrics_thresholds == null &&
      var.synthetic_probe_thresholds == null &&
      var.hard_limit_app_metrics == null &&
      var.soft_limit_app_metrics == null &&
      var.lqm_thresholds == null
    )
    is_comprehensive_profile          = (
      var.flow_metrics_thresholds != null &&
      var.circuit_utilization_metrics_thresholds != null &&
      var.system_health_metrics_thresholds != null
    )
    has_app_metrics                   = var.hard_limit_app_metrics != null || var.soft_limit_app_metrics != null
    has_network_metrics               = var.flow_metrics_thresholds != null || var.circuit_utilization_metrics_thresholds != null
    has_quality_metrics               = var.lqm_thresholds != null || var.synthetic_probe_thresholds != null
  }
}

# Validation Results
output "profile_validation" {
  description = "Validation checks for the performance profile"
  value = {
    name_valid                        = length(prismasdwan_performance_profile.performance_profile_main.name) > 0 && length(prismasdwan_performance_profile.performance_profile_main.name) <= 128
    description_valid                 = prismasdwan_performance_profile.performance_profile_main.description == null ? true : length(prismasdwan_performance_profile.performance_profile_main.description) <= 256
    has_id                            = prismasdwan_performance_profile.performance_profile_main.id != null
    has_schema                        = prismasdwan_performance_profile.performance_profile_main.x_schema != null
    has_etag                          = prismasdwan_performance_profile.performance_profile_main.x_etag != null
    has_valid_configuration           = (
      var.flow_metrics_thresholds != null ||
      var.circuit_utilization_metrics_thresholds != null ||
      var.system_health_metrics_thresholds != null ||
      var.synthetic_probe_thresholds != null ||
      var.hard_limit_app_metrics != null ||
      var.soft_limit_app_metrics != null ||
      var.lqm_thresholds != null
    )
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "performance_profile"
}

# Performance Configuration Summary
output "performance_configuration_summary" {
  description = "Summary of performance configuration"
  value = {
    profile_name                      = prismasdwan_performance_profile.performance_profile_main.name
    profile_id                        = prismasdwan_performance_profile.performance_profile_main.id
    has_custom_description            = prismasdwan_performance_profile.performance_profile_main.description != null
    has_tags                          = prismasdwan_performance_profile.performance_profile_main.tags != null
    monitoring_capabilities           = {
      flow_monitoring                 = var.flow_metrics_thresholds != null
      circuit_monitoring              = var.circuit_utilization_metrics_thresholds != null
      system_monitoring               = var.system_health_metrics_thresholds != null
      synthetic_probes                = var.synthetic_probe_thresholds != null
      application_limits              = var.hard_limit_app_metrics != null || var.soft_limit_app_metrics != null
      link_quality_monitoring         = var.lqm_thresholds != null
    }
  }
}

# Thresholds Summary
output "thresholds_summary" {
  description = "Summary of all configured thresholds"
  value = {
    flow_utilization_threshold        = var.flow_metrics_thresholds != null ? var.flow_metrics_thresholds.percentage_flow_utilization : null
    circuit_utilization_threshold     = var.circuit_utilization_metrics_thresholds != null ? var.circuit_utilization_metrics_thresholds.percentage_circuit_utilization : null
    cpu_threshold                     = var.system_health_metrics_thresholds != null ? var.system_health_metrics_thresholds.cpu_utilization : null
    memory_threshold                  = var.system_health_metrics_thresholds != null ? var.system_health_metrics_thresholds.memory_utilization : null
    disk_threshold                    = var.system_health_metrics_thresholds != null ? var.system_health_metrics_thresholds.disk_utilization : null
    hard_rtt_limit                    = var.hard_limit_app_metrics != null ? var.hard_limit_app_metrics.max_rtt : null
    soft_rtt_limit                    = var.soft_limit_app_metrics != null ? var.soft_limit_app_metrics.max_rtt : null
    max_latency_threshold             = var.lqm_thresholds != null ? var.lqm_thresholds.max_latency : null
    max_jitter_threshold              = var.lqm_thresholds != null ? var.lqm_thresholds.max_jitter : null
    max_packet_loss_threshold         = var.lqm_thresholds != null ? var.lqm_thresholds.max_packet_loss : null
    min_mos_threshold                 = var.lqm_thresholds != null ? var.lqm_thresholds.min_mos : null
  }
}

# Monitoring Features Summary
output "monitoring_features" {
  description = "Summary of monitoring features enabled"
  value = {
    network_utilization_monitoring    = var.flow_metrics_thresholds != null || var.circuit_utilization_metrics_thresholds != null
    system_health_monitoring          = var.system_health_metrics_thresholds != null
    application_performance_limits    = var.hard_limit_app_metrics != null || var.soft_limit_app_metrics != null
    synthetic_testing                 = var.synthetic_probe_thresholds != null
    link_quality_assessment           = var.lqm_thresholds != null
    comprehensive_monitoring          = (
      var.flow_metrics_thresholds != null &&
      var.system_health_metrics_thresholds != null &&
      var.lqm_thresholds != null
    )
  }
}
