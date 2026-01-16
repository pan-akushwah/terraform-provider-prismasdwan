# WAN Interface Label Details
output "wan_interface_label_details" {
  description = "Details of the created WAN interface label"
  value = {
    id                                       = prismasdwan_wan_interface_label.wan_interface_label_full.id
    name                                     = prismasdwan_wan_interface_label.wan_interface_label_full.name
    description                              = prismasdwan_wan_interface_label.wan_interface_label_full.description
    label                                    = prismasdwan_wan_interface_label.wan_interface_label_full.label
    tags                                     = prismasdwan_wan_interface_label.wan_interface_label_full.tags
    probe_profile_id                         = prismasdwan_wan_interface_label.wan_interface_label_full.probe_profile_id
    bwc_enabled                              = prismasdwan_wan_interface_label.wan_interface_label_full.bwc_enabled
    lqm_enabled                              = prismasdwan_wan_interface_label.wan_interface_label_full.lqm_enabled
    use_lqm_for_non_hub_paths               = prismasdwan_wan_interface_label.wan_interface_label_full.use_lqm_for_non_hub_paths
    use_for_application_reachability_probes = prismasdwan_wan_interface_label.wan_interface_label_full.use_for_application_reachability_probes
    use_for_controller_connections          = prismasdwan_wan_interface_label.wan_interface_label_full.use_for_controller_connections
    l3_reachability                          = prismasdwan_wan_interface_label.wan_interface_label_full.l3_reachability
    vpnlink_configuration                    = prismasdwan_wan_interface_label.wan_interface_label_full.vpnlink_configuration
    x_etag                                   = prismasdwan_wan_interface_label.wan_interface_label_full.x_etag
    x_schema                                 = prismasdwan_wan_interface_label.wan_interface_label_full.x_schema
  }
}

# Individual outputs for easy access
output "wan_interface_label_id" {
  description = "ID of the created WAN interface label"
  value       = prismasdwan_wan_interface_label.wan_interface_label_full.id
}

output "wan_interface_label_name" {
  description = "Name of the created WAN interface label"
  value       = prismasdwan_wan_interface_label.wan_interface_label_full.name
}

output "wan_interface_label_tfid" {
  description = "Terraform ID of the WAN interface label"
  value       = prismasdwan_wan_interface_label.wan_interface_label_full.id
}

output "label_value" {
  description = "Label value of the WAN interface label"
  value       = prismasdwan_wan_interface_label.wan_interface_label_full.label
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    probe_profile_resolution = {
      profile_name  = var.probe_profile_name
      resolved_id   = prismasdwan_resource_locator.probe_profile.result
      resolution_ok = prismasdwan_resource_locator.probe_profile.result != null
    }
    
    probe_configs_resolution = {
      config_names = var.l3_reachability_probe_config_names
      resolved_ids = [for locator in prismasdwan_resource_locator.probe_configs : locator.result]
      all_resolved = alltrue([for locator in prismasdwan_resource_locator.probe_configs : locator.result != null])
    }
    
    overall_resolution_status = (
      prismasdwan_resource_locator.probe_profile.result != null &&
      alltrue([for locator in prismasdwan_resource_locator.probe_configs : locator.result != null])
    ) ? "success" : "partial_or_failed"
  }
}

# Label Analysis
output "label_analysis" {
  description = "Analysis of the WAN interface label configuration"
  value = {
    label_info = {
      label_type   = can(regex("^public-", var.label)) ? "public" : "private"
      label_number = tonumber(regex("-(\\d+)$", var.label)[0])
      is_standard_range = tonumber(regex("-(\\d+)$", var.label)[0]) <= 32
      is_extended_range = tonumber(regex("-(\\d+)$", var.label)[0]) >= 1000
    }
    
    feature_configuration = {
      monitoring_enabled = var.lqm_enabled
      bandwidth_control  = var.bwc_enabled
      probe_monitoring   = var.use_for_application_reachability_probes
      controller_ready   = var.use_for_controller_connections
      non_hub_lqm       = var.use_lqm_for_non_hub_paths
    }
    
    vpn_configuration = {
      keep_alive_interval_ms = var.vpnlink_keep_alive_interval
      failure_threshold     = var.vpnlink_keep_alive_failure_count
      detection_time_ms     = var.vpnlink_keep_alive_interval * var.vpnlink_keep_alive_failure_count
    }
    
    l3_reachability_config = {
      uses_element_default = var.l3_reachability_use_element_default
      custom_probe_configs = length(var.l3_reachability_probe_config_names)
      has_custom_probes   = length(var.l3_reachability_probe_config_names) > 0
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "WAN interface label deployment status and metadata"
  value = {
    status         = "success"
    deployed_at    = timestamp()
    resource_type  = "wan_interface_label"
    resource_count = 1
    
    configuration_summary = {
      label_name            = var.wan_interface_label_name
      label_value           = var.label
      probe_profile         = var.probe_profile_name
      monitoring_features   = {
        lqm_enabled = var.lqm_enabled
        bwc_enabled = var.bwc_enabled
      }
      tags_count           = length(var.tags)
    }
    
    operational_readiness = {
      label_configured         = true
      probe_profile_linked     = prismasdwan_resource_locator.probe_profile.result != null
      monitoring_active        = var.lqm_enabled || var.bwc_enabled
      controller_integration   = var.use_for_controller_connections
      
      production_readiness = (
        prismasdwan_resource_locator.probe_profile.result != null &&
        (var.lqm_enabled || var.bwc_enabled)
      ) ? "production-ready" : "requires-review"
    }
  }
}

# Validation Status
output "validation_status" {
  description = "Validation status of the WAN interface label configuration"
  value = {
    name_valid                = length(var.wan_interface_label_name) > 0 && length(var.wan_interface_label_name) <= 128
    description_valid         = length(var.description) <= 256
    label_format_valid        = can(regex("^(public|private)-(([1-9])|([1-2][0-9])|(3[0-2])|(100[0-9]))$", var.label))
    tags_valid               = length(var.tags) <= 10 && alltrue([for tag in var.tags : length(tag) <= 128])
    vpn_interval_valid       = var.vpnlink_keep_alive_interval >= 100 && var.vpnlink_keep_alive_interval <= 1740000
    vpn_failure_count_valid  = var.vpnlink_keep_alive_failure_count >= 3 && var.vpnlink_keep_alive_failure_count <= 30
    probe_profile_valid      = var.probe_profile_name != ""
    
    overall_status = (
      length(var.wan_interface_label_name) > 0 &&
      can(regex("^(public|private)-(([1-9])|([1-2][0-9])|(3[0-2])|(100[0-9]))$", var.label)) &&
      var.vpnlink_keep_alive_interval >= 100 && var.vpnlink_keep_alive_interval <= 1740000 &&
      var.vpnlink_keep_alive_failure_count >= 3 && var.vpnlink_keep_alive_failure_count <= 30 &&
      var.probe_profile_name != ""
    ) ? "valid" : "invalid"
  }
}

# Performance Analysis
output "performance_analysis" {
  description = "Performance characteristics of the WAN interface label"
  value = {
    keepalive_performance = {
      detection_time_seconds    = (var.vpnlink_keep_alive_interval * var.vpnlink_keep_alive_failure_count) / 1000
      keepalive_overhead_pps    = 1000 / var.vpnlink_keep_alive_interval
      failure_detection_fast    = var.vpnlink_keep_alive_interval <= 5000
      conservative_thresholds   = var.vpnlink_keep_alive_failure_count >= 5
    }
    
    monitoring_overhead = {
      lqm_active               = var.lqm_enabled
      probe_monitoring_active  = var.use_for_application_reachability_probes
      bandwidth_control_active = var.bwc_enabled
      total_monitoring_features = sum([
        var.lqm_enabled ? 1 : 0,
        var.bwc_enabled ? 1 : 0,
        var.use_for_application_reachability_probes ? 1 : 0,
        var.use_lqm_for_non_hub_paths ? 1 : 0
      ])
    }
    
    optimization_recommendations = {
      tune_keepalive_for_latency = var.vpnlink_keep_alive_interval > 10000 ? "Consider reducing interval for faster detection" : "Interval appropriately configured"
      enable_lqm_for_visibility = !var.lqm_enabled ? "Consider enabling LQM for better path visibility" : "LQM properly enabled"
      configure_bandwidth_control = !var.bwc_enabled ? "Consider enabling BWC for traffic shaping" : "BWC properly enabled"
    }
  }
}

# Security and Best Practices
output "security_best_practices" {
  description = "Security assessment and best practice recommendations"
  value = {
    security_posture = {
      controller_connection_secured = var.use_for_controller_connections
      probe_monitoring_enabled     = var.use_for_application_reachability_probes
      l3_reachability_configured   = !var.l3_reachability_use_element_default || length(var.l3_reachability_probe_config_names) > 0
    }
    
    best_practices = {
      naming_convention = {
        follows_pattern = can(regex("^[A-Za-z]", var.wan_interface_label_name))
        descriptive_name = length(var.wan_interface_label_name) > 10
        includes_environment = can(regex("(?i)(prod|dev|test|stage)", var.wan_interface_label_name))
      }
      
      configuration_completeness = {
        has_description = length(var.description) > 20
        properly_tagged = length(var.tags) >= 3
        monitoring_enabled = var.lqm_enabled && var.bwc_enabled
        custom_probes_configured = length(var.l3_reachability_probe_config_names) > 0
      }
      
      operational_readiness = {
        keepalive_tuned = var.vpnlink_keep_alive_interval <= 10000
        failure_threshold_appropriate = var.vpnlink_keep_alive_failure_count >= 3 && var.vpnlink_keep_alive_failure_count <= 10
        all_monitoring_enabled = var.lqm_enabled && var.bwc_enabled && var.use_for_application_reachability_probes
      }
    }
    
    compliance_check = {
      enterprise_standards = {
        monitoring_comprehensive = var.lqm_enabled && var.bwc_enabled
        documentation_adequate = length(var.description) > 50
        tagging_compliant = length(var.tags) >= 3
      }
      
      operational_standards = {
        controller_integration = var.use_for_controller_connections
        probe_integration = var.use_for_application_reachability_probes
        performance_monitoring = var.lqm_enabled
      }
    }
  }
}
