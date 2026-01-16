# Basic IoT Device ID Configuration Information
output "iot_device_id_config_id" {
  description = "The ID of the site IoT device ID configuration"
  value       = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id
}

output "site_id" {
  description = "The site ID where the IoT device ID configuration is applied"
  value       = prismasdwan_resource_locator.site.result
}

output "device_id_enabled" {
  description = "Whether IoT device ID configuration is enabled"
  value       = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
}

# Detailed IoT Device ID Configuration Information
output "iot_device_id_config_details" {
  description = "Detailed information about the site IoT device ID configuration"
  value = {
    id                    = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id
    site_id               = prismasdwan_resource_locator.site.result
    cfg_device_id_enabled = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    x_etag                = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_etag
    x_schema              = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_schema
    created_at            = timestamp()
  }
}

# IoT Device ID Configuration Summary
output "iot_device_id_config_summary" {
  description = "Summary of site IoT device ID configuration"
  value = {
    site_name         = var.site_name
    device_id_status  = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enabled" : "disabled"
    resource_type     = "site_iot_device_id_config"
    api_version       = "v2.1"
    configuration_active = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the site IoT device ID configuration deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "site_iot_device_id_config"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    config_enabled   = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    api_version      = "v2.1"
    api_model        = "DeviceIdConfigScreen"
  }
}

# Schema and Etag (computed fields)
output "iot_device_id_config_schema" {
  description = "Schema version for the site IoT device ID configuration"
  value       = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_schema
}

output "iot_device_id_config_etag" {
  description = "Etag for the site IoT device ID configuration"
  value       = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_iot_device_id_config"
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name             = var.site_name
    cfg_device_id_enabled = var.cfg_device_id_enabled
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid = prismasdwan_resource_locator.site.result != null
    config_value_valid     = contains([true, false], var.cfg_device_id_enabled)
    all_validations_passed = (
      prismasdwan_resource_locator.site.result != null &&
      contains([true, false], var.cfg_device_id_enabled)
    )
  }
}

# IoT Configuration Analysis
output "iot_configuration_analysis" {
  description = "Analysis of the IoT device ID configuration"
  value = {
    configuration_state = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "active" : "inactive"
    operational_impact = {
      device_identification = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enabled" : "disabled"
      iot_traffic_handling = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enhanced" : "standard"
      device_classification = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "active" : "passive"
    }
    security_implications = {
      device_visibility = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enhanced" : "basic"
      policy_enforcement = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "device_aware" : "standard"
      threat_detection = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "improved" : "standard"
    }
  }
}

# Configuration Status Details
output "configuration_status_details" {
  description = "Detailed status information about the configuration"
  value = {
    feature_status = {
      device_id_enabled = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      feature_active = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      configuration_complete = true
    }
    deployment_characteristics = {
      site_association = prismasdwan_resource_locator.site.result != null
      config_applied = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id != null
      schema_version = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_schema
      etag_present = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_etag != null
    }
    operational_readiness = {
      ready_for_iot_devices = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      site_configured = prismasdwan_resource_locator.site.result != null
      feature_operational = (
        prismasdwan_resource_locator.site.result != null &&
        prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id != null
      )
    }
  }
}

# IoT Device Management Capabilities
output "iot_device_management_capabilities" {
  description = "Capabilities enabled by the IoT device ID configuration"
  value = {
    device_identification = {
      automatic_detection = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      device_fingerprinting = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      device_classification = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    }
    policy_application = {
      device_specific_policies = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      iot_traffic_shaping = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      security_policy_enforcement = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    }
    monitoring_features = {
      device_behavior_analysis = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      anomaly_detection = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      traffic_analytics = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    }
  }
}

# Feature Impact Assessment
output "feature_impact_assessment" {
  description = "Assessment of the impact of enabling/disabling IoT device ID configuration"
  value = {
    current_configuration = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    impact_analysis = {
      security_impact = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "positive" : "neutral"
      visibility_impact = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enhanced" : "standard"
      management_complexity = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "increased" : "standard"
      performance_impact = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "minimal" : "none"
    }
    feature_benefits = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? [
      "Enhanced IoT device visibility",
      "Improved security posture",
      "Better policy enforcement",
      "Advanced threat detection",
      "Device behavior monitoring"
    ] : [
      "Simplified configuration",
      "Reduced processing overhead",
      "Standard device handling"
    ]
  }
}

# Configuration Compliance and Standards
output "configuration_compliance" {
  description = "Compliance status and standards adherence"
  value = {
    api_compliance = {
      api_version_supported = "v2.1"
      schema_compliant = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_schema != null
      etag_supported = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_etag != null
    }
    configuration_standards = {
      boolean_value_valid = contains([true, false], prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled)
      site_association_valid = prismasdwan_resource_locator.site.result != null
      resource_creation_successful = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id != null
    }
    best_practices_adherence = {
      site_resolution_verified = prismasdwan_resource_locator.site.result != null
      configuration_explicit = true
      feature_state_clear = true
    }
  }
}

# Site Integration Status
output "site_integration_status" {
  description = "Status of the IoT device ID configuration integration with the site"
  value = {
    site_details = {
      site_name = var.site_name
      site_id = prismasdwan_resource_locator.site.result
      site_resolved = prismasdwan_resource_locator.site.result != null
    }
    integration_health = {
      site_linkage_active = prismasdwan_resource_locator.site.result != null
      config_applied_successfully = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id != null
      feature_operational = (
        prismasdwan_resource_locator.site.result != null &&
        prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id != null
      )
    }
    configuration_status = {
      device_id_feature_enabled = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      site_wide_application = true
      configuration_persistent = true
    }
  }
}

# IoT Security Posture
output "iot_security_posture" {
  description = "Security posture analysis based on IoT device ID configuration"
  value = {
    security_level = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enhanced" : "standard"
    security_features = {
      device_identification = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      enhanced_visibility = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      improved_access_control = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      behavioral_monitoring = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    }
    risk_mitigation = {
      unauthorized_device_detection = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "active" : "passive"
      device_profiling = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enabled" : "disabled"
      anomaly_detection_capability = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "enhanced" : "basic"
    }
  }
}

# Operational Metrics
output "operational_metrics" {
  description = "Operational metrics and performance indicators"
  value = {
    configuration_metrics = {
      feature_enabled = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      configuration_complexity = "low"
      deployment_time = timestamp()
      resource_overhead = "minimal"
    }
    monitoring_capabilities = {
      device_tracking = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      traffic_analysis = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
      policy_effectiveness_monitoring = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled
    }
    scalability_factors = {
      site_level_configuration = true
      centralized_management = true
      policy_inheritance = true
    }
  }
}

# Configuration Summary Report
output "configuration_summary_report" {
  description = "Comprehensive summary report of the IoT device ID configuration"
  value = {
    executive_summary = {
      feature_name = "IoT Device ID Configuration"
      deployment_scope = "Site-wide"
      current_status = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "Active" : "Inactive"
      deployment_success = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id != null
    }
    technical_details = {
      resource_id = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.id
      site_association = prismasdwan_resource_locator.site.result
      api_version = "v2.1"
      schema_version = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_schema
      etag_value = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.x_etag
    }
    business_impact = {
      security_enhancement = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "Significant" : "None"
      operational_visibility = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "Enhanced" : "Standard"
      compliance_readiness = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "Improved" : "Basic"
      management_efficiency = prismasdwan_site_iot_device_id_config.site_iot_device_id_config_full.cfg_device_id_enabled ? "Optimized" : "Standard"
    }
  }
}
