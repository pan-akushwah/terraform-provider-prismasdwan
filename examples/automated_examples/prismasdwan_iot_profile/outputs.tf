# Basic IoT Profile Information
output "iot_profile_id" {
  description = "The ID of the created IoT profile"
  value       = prismasdwan_iot_profile.iot_profile_main.id
}

output "iot_profile_name" {
  description = "The name of the IoT profile"
  value       = prismasdwan_iot_profile.iot_profile_main.name
}

output "iot_profile_tfid" {
  description = "The Terraform ID of the IoT profile"
  value       = prismasdwan_iot_profile.iot_profile_main.tfid
}

# Detailed IoT Profile Information
output "iot_profile_details" {
  description = "Detailed information about the IoT profile"
  sensitive   = true
  value = {
    id           = prismasdwan_iot_profile.iot_profile_main.id
    name         = prismasdwan_iot_profile.iot_profile_main.name
    description  = prismasdwan_iot_profile.iot_profile_main.description
    tags         = prismasdwan_iot_profile.iot_profile_main.tags
    snmp_version = prismasdwan_iot_profile.iot_profile_main.snmp_version
    disabled     = prismasdwan_iot_profile.iot_profile_main.disabled
    inactive     = prismasdwan_iot_profile.iot_profile_main.inactive
    created_at   = timestamp()
  }
}

# SNMP Discovery Configuration
output "snmp_discovery_config" {
  description = "SNMP discovery configuration"
  value = {
    enabled                     = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_enabled
    device_refresh_frequency    = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency
    network_refresh_frequency   = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency
    use_local_neighbours        = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_use_local_neighbours
    device_refresh_hours        = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency / 60
    network_refresh_hours       = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency / 60
  }
}

# SNMP V2 Configuration (non-sensitive parts)
output "snmp_v2_config" {
  description = "SNMP V2 configuration (community string excluded for security)"
  value = prismasdwan_iot_profile.iot_profile_main.v2_config != null ? {
    community_string_set = prismasdwan_iot_profile.iot_profile_main.v2_config.snmp_community_string != null
    version_type        = "V2"
    security_level      = "COMMUNITY"
  } : null
}

# SNMP V3 Configuration (sensitive data excluded)
output "snmp_v3_config" {
  description = "SNMP V3 configuration (passwords excluded for security)"
  sensitive   = true
  value = prismasdwan_iot_profile.iot_profile_main.v3_config != null ? {
    username             = prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_username
    security_level       = prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level
    auth_protocol        = prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_auth_protocol
    privacy_protocol     = prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_privacy_protocol
    auth_password_set    = prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_auth_password != null
    privacy_password_set = prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_privacy_password != null
  } : null
}

# Status Information
output "status_info" {
  description = "Status information for the IoT profile"
  value = {
    disabled        = prismasdwan_iot_profile.iot_profile_main.disabled
    disabled_reason = prismasdwan_iot_profile.iot_profile_main.disabled_reason
    inactive        = prismasdwan_iot_profile.iot_profile_main.inactive
    inactive_reason = prismasdwan_iot_profile.iot_profile_main.inactive_reason
    is_operational  = !prismasdwan_iot_profile.iot_profile_main.disabled && !prismasdwan_iot_profile.iot_profile_main.inactive
  }
}

# Association Information
output "association_info" {
  description = "Association information for the IoT profile"
  value = {
    num_associated_sites = prismasdwan_iot_profile.iot_profile_main.num_associated_sites
    has_associations    = prismasdwan_iot_profile.iot_profile_main.num_associated_sites > 0
  }
}

# Schema and Etag (computed fields)
output "iot_profile_schema" {
  description = "Schema version for the IoT profile"
  value       = prismasdwan_iot_profile.iot_profile_main.x_schema
}

output "iot_profile_etag" {
  description = "Etag for the IoT profile"
  value       = prismasdwan_iot_profile.iot_profile_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of IoT profile configuration"
  value = {
    profile_name        = prismasdwan_iot_profile.iot_profile_main.name
    profile_id          = prismasdwan_iot_profile.iot_profile_main.id
    snmp_version        = prismasdwan_iot_profile.iot_profile_main.snmp_version
    discovery_enabled   = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_enabled
    has_description     = prismasdwan_iot_profile.iot_profile_main.description != null
    has_tags            = prismasdwan_iot_profile.iot_profile_main.tags != null
    tag_count           = prismasdwan_iot_profile.iot_profile_main.tags != null ? length(prismasdwan_iot_profile.iot_profile_main.tags) : 0
    is_v2_config        = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2"
    is_v3_config        = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3"
    is_operational      = !prismasdwan_iot_profile.iot_profile_main.disabled && !prismasdwan_iot_profile.iot_profile_main.inactive
    resource_type       = "iot_profile"
    api_model           = "IOTDeviceProfileV2N1"
  }
}

# SNMP Version Analysis
output "snmp_version_analysis" {
  description = "Analysis of the SNMP version configuration"
  value = {
    version_type = prismasdwan_iot_profile.iot_profile_main.snmp_version
    is_v2        = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2"
    is_v3        = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3"
    security_features = {
      community_based = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2"
      user_based      = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3"
      authentication  = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3"
      privacy         = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3"
    }
    recommended_for = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2" ? ["Legacy devices", "Simple environments"] : ["Enterprise environments", "Security-sensitive deployments"]
  }
}

# Discovery Settings Analysis
output "discovery_analysis" {
  description = "Analysis of the discovery settings"
  value = {
    discovery_enabled = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_enabled
    refresh_intervals = {
      device_refresh_minutes  = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency
      network_refresh_minutes = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency
      device_refresh_hours    = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency / 60
      network_refresh_hours   = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency / 60
    }
    discovery_scope = {
      uses_local_neighbours = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_use_local_neighbours
      discovery_method      = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_use_local_neighbours ? "Local neighbours" : "Network scanning"
    }
    performance_impact = {
      device_scan_frequency   = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency < 60 ? "High" : "Moderate"
      network_scan_frequency  = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency < 120 ? "High" : "Moderate"
    }
  }
}

# Security Analysis
output "security_analysis" {
  description = "Security analysis of the IoT profile"
  sensitive   = true
  value = {
    snmp_version = prismasdwan_iot_profile.iot_profile_main.snmp_version
    security_level = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level : "COMMUNITY"
    auth_enabled = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? contains(["AUTH", "PRIVATE"], prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level) : false
    privacy_enabled = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level == "PRIVATE" : false
    security_rating = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2" ? "Basic" : prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? (prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level == "NOAUTH" ? "Low" : prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level == "AUTH" ? "Medium" : "High") : "Unknown"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the IoT profile"
  sensitive   = true
  value = {
    name_valid           = length(prismasdwan_iot_profile.iot_profile_main.name) > 0 && length(prismasdwan_iot_profile.iot_profile_main.name) <= 128
    snmp_version_valid   = contains(["V2", "V3"], prismasdwan_iot_profile.iot_profile_main.snmp_version)
    description_valid    = prismasdwan_iot_profile.iot_profile_main.description == null ? true : length(prismasdwan_iot_profile.iot_profile_main.description) <= 256
    tags_count_valid     = prismasdwan_iot_profile.iot_profile_main.tags == null ? true : length(prismasdwan_iot_profile.iot_profile_main.tags) <= 10
    refresh_freq_valid   = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency >= 30
    has_id               = prismasdwan_iot_profile.iot_profile_main.id != null
    has_schema           = prismasdwan_iot_profile.iot_profile_main.x_schema != null
    has_etag             = prismasdwan_iot_profile.iot_profile_main.x_etag != null
    config_consistent    = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2" ? prismasdwan_iot_profile.iot_profile_main.v2_config != null : prismasdwan_iot_profile.iot_profile_main.v3_config != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "iot_profile"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the IoT profile deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "iot_profile"
    status         = "success"
    api_version    = "v2.1"
    api_model      = "IOTDeviceProfileV2N1"
  }
}

# Performance Recommendations
output "performance_recommendations" {
  description = "Performance optimization recommendations"
  value = {
    current_config = {
      device_refresh_frequency = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency
      network_refresh_frequency = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency
      uses_local_neighbours = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_use_local_neighbours
    }
    optimization_suggestions = {
      device_refresh = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency < 60 ? "Consider increasing device refresh frequency to reduce network load" : "Device refresh frequency is optimal"
      network_refresh = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency < 120 ? "Consider increasing network refresh frequency for better performance" : "Network refresh frequency is optimal"
      discovery_scope = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_use_local_neighbours ? "Using local neighbours reduces discovery overhead" : "Consider enabling local neighbours for better performance"
    }
    performance_impact = {
      discovery_load = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency < 60 && prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency < 120 ? "High" : prismasdwan_iot_profile.iot_profile_main.snmp_discovery_device_refresh_frequency < 120 || prismasdwan_iot_profile.iot_profile_main.snmp_discovery_network_refresh_frequency < 240 ? "Medium" : "Low"
      network_efficiency = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_use_local_neighbours ? "High" : "Medium"
      resource_utilization = prismasdwan_iot_profile.iot_profile_main.snmp_discovery_enabled ? "Active" : "None"
    }
  }
}

# Security Recommendations
output "security_recommendations" {
  description = "Security optimization recommendations"
  sensitive   = true
  value = {
    current_security = {
      snmp_version = prismasdwan_iot_profile.iot_profile_main.snmp_version
      security_level = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level : "COMMUNITY"
      encryption_enabled = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level == "PRIVATE" : false
    }
    recommendations = {
      version_upgrade = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V2" ? "Consider upgrading to SNMP V3 for better security" : "Using recommended SNMP version"
      security_level = prismasdwan_iot_profile.iot_profile_main.snmp_version == "V3" && prismasdwan_iot_profile.iot_profile_main.v3_config != null ? (prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level == "NOAUTH" ? "Consider enabling authentication (AUTH or PRIVATE)" : prismasdwan_iot_profile.iot_profile_main.v3_config.snmp_security_level == "AUTH" ? "Consider enabling privacy encryption (PRIVATE)" : "Security level is optimal") : "Configure V3 for enhanced security"
      password_strength = "Ensure strong passwords for authentication and privacy"
      credential_rotation = "Implement regular credential rotation policy"
    }
    compliance_notes = [
      "SNMP V3 with PRIVATE security level meets most compliance requirements",
      "Regular password rotation enhances security posture",
      "Monitor and audit SNMP access for compliance reporting",
      "Document security configurations for audit purposes"
    ]
  }
}

# Site Association Analysis  
output "site_association_analysis" {
  description = "Analysis of site associations"
  value = {
    current_associations = prismasdwan_iot_profile.iot_profile_main.num_associated_sites
    association_status = {
      has_associations = prismasdwan_iot_profile.iot_profile_main.num_associated_sites > 0
      association_count = prismasdwan_iot_profile.iot_profile_main.num_associated_sites
      usage_level = prismasdwan_iot_profile.iot_profile_main.num_associated_sites == 0 ? "Unused" : prismasdwan_iot_profile.iot_profile_main.num_associated_sites < 5 ? "Low" : prismasdwan_iot_profile.iot_profile_main.num_associated_sites < 20 ? "Medium" : "High"
    }
    management_notes = {
      deletion_impact = prismasdwan_iot_profile.iot_profile_main.num_associated_sites > 0 ? "Profile is in use - deletion may affect associated sites" : "Profile can be safely deleted"
      modification_impact = prismasdwan_iot_profile.iot_profile_main.num_associated_sites > 0 ? "Changes will affect all associated sites" : "No sites affected by changes"
      rollback_consideration = prismasdwan_iot_profile.iot_profile_main.num_associated_sites > 0 ? "Consider backup/rollback plan for changes" : "No rollback considerations needed"
    }
  }
}

# Comprehensive Documentation
output "comprehensive_documentation" {
  description = "Comprehensive documentation for the IoT profile"
  value = {
    overview = {
      purpose = "IoT device discovery and management through SNMP protocol"
      target_devices = ["IoT sensors", "Network devices", "Industrial equipment", "Smart devices"]
      supported_protocols = ["SNMP V2", "SNMP V3"]
      discovery_methods = ["Network scanning", "Local neighbour discovery"]
    }
    configuration_guide = {
      version_selection = {
        v2 = {
          use_case = "Legacy devices and simple environments"
          security_level = "Basic community-based authentication"
          configuration_complexity = "Low"
          recommended_for = ["Testing", "Legacy device support", "Simple networks"]
        }
        v3 = {
          use_case = "Enterprise and security-sensitive environments"
          security_level = "User-based with authentication and encryption"
          configuration_complexity = "Medium to High"
          recommended_for = ["Production", "Enterprise", "Compliance requirements"]
        }
      }
      security_levels = {
        noauth = "No authentication - lowest security"
        auth = "Authentication enabled - medium security"
        private = "Authentication + encryption - highest security"
      }
    }
    use_cases = [
      "IoT device discovery and inventory",
      "Network device monitoring", 
      "Asset management for IoT infrastructure",
      "Security compliance for device tracking",
      "Automated device onboarding"
    ]
    best_practices = [
      "Use SNMP V3 for production environments",
      "Set appropriate refresh frequencies to balance discovery and performance",
      "Use strong authentication and privacy passwords for V3",
      "Tag profiles for better organization and management",
      "Monitor associated sites to understand profile usage",
      "Disable profiles when not in use to reduce overhead",
      "Use descriptive names and descriptions",
      "Implement proper password rotation for SNMP credentials"
    ]
    related_resources = [
      "prismasdwan_site",
      "prismasdwan_network_policy",
      "prismasdwan_security_policy",
      "prismasdwan_device_profile"
    ]
    troubleshooting = {
      common_issues = [
        "SNMP timeouts - check network connectivity and device response",
        "Authentication failures - verify credentials and security level",
        "Discovery not finding devices - check refresh frequencies and local neighbours setting",
        "Performance issues - review refresh frequencies and discovery scope"
      ]
      diagnostics = [
        "Check SNMP connectivity using snmpwalk tool",
        "Verify SNMP version compatibility with target devices",
        "Monitor network traffic during discovery operations",
        "Review site association count for profile usage"
      ]
    }
  }
}
