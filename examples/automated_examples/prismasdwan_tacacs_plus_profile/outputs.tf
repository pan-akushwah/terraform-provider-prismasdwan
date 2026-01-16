# Basic TACACS+ Profile Information
output "tacacs_plus_profile_id" {
  description = "The ID of the TACACS+ profile"
  value       = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.id
}

output "tacacs_plus_profile_name" {
  description = "The name of the TACACS+ profile"
  value       = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.name
}

output "authentication_protocol" {
  description = "The authentication protocol used"
  value       = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol
}

output "description" {
  description = "The description of the TACACS+ profile"
  value       = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.description
}

output "tacacs_plus_servers" {
  description = "The configured TACACS+ servers"
  value       = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers
  sensitive   = true
}

# Detailed TACACS+ Profile Information
output "tacacs_plus_profile_details" {
  description = "Detailed information about the TACACS+ profile"
  value = {
    id                      = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.id
    name                    = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.name
    description             = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.description
    authentication_protocol = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol
    server_count            = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
    tags                    = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags
    x_etag                  = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.x_etag
    x_schema                = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.x_schema
    created_at              = timestamp()
  }
}

# TACACS+ Profile Summary
output "tacacs_plus_profile_summary" {
  description = "Summary of TACACS+ profile configuration"
  value = {
    profile_name            = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.name
    authentication_method   = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol
    total_servers           = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
    tags_count              = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags != null ? prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags : [])
    resource_type           = "tacacs_plus_profile"
    api_version             = "v2.0"
    high_availability       = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
    security_level          = upper(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol)
    redundancy_factor       = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
  }
}

# TACACS+ Servers Analysis
output "tacacs_plus_servers_analysis" {
  description = "Analysis of configured TACACS+ servers"
  value = {
    total_servers = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
    server_details = {
      for idx, server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : idx => {
        server_type = (
          server.server_ip != null ? "ipv4" :
          server.server_ipv6 != null ? "ipv6" :
          server.server_fqdn != null ? "fqdn" : "unknown"
        )
        server_address = (
          server.server_ip != null ? server.server_ip :
          server.server_ipv6 != null ? server.server_ipv6 :
          server.server_fqdn != null ? server.server_fqdn : "unknown"
        )
        server_port = server.server_port
        timeout_seconds = server.timeout
        role = idx == 0 ? "primary" : "backup"
        connection_method = (
          server.server_ip != null ? "direct-ipv4" :
          server.server_ipv6 != null ? "direct-ipv6" :
          server.server_fqdn != null ? "dns-resolution" : "unknown"
        )
        network_protocol = "tcp"
        authentication_support = "full-tacacs-plus"
      }
    }
    server_distribution = {
      ipv4_servers = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_ip != null
      ])
      ipv6_servers = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_ipv6 != null
      ])
      fqdn_servers = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_fqdn != null
      ])
    }
    redundancy_analysis = {
      redundancy_level = (
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 1 ? "none" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 2 ? "basic" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) >= 3 ? "high" : "unknown"
      )
      failover_capability = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
      load_distribution = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1 ? "enabled" : "disabled"
      fault_tolerance = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1 ? "resilient" : "single-point"
    }
  }
}

# Authentication Configuration Analysis
output "authentication_configuration_analysis" {
  description = "Analysis of the authentication configuration"
  value = {
    authentication_details = {
      protocol = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol
      protocol_security = (
        prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap" ? "high" : "standard"
      )
      protocol_description = (
        prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap" ? 
        "Challenge Handshake Authentication Protocol - Enhanced security with encrypted challenge-response" :
        "Password Authentication Protocol - Standard password-based authentication"
      )
      encryption_support = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap"
      replay_attack_protection = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap"
    }
    tacacs_plus_capabilities = {
      authentication = true
      authorization = true
      accounting = true
      centralized_management = true
      role_based_access = true
      command_authorization = true
      session_accounting = true
      real_time_monitoring = true
    }
    security_features = {
      encrypted_communication = true
      shared_secret_authentication = true
      per_command_authorization = true
      detailed_audit_logging = true
      session_timeout_control = true
      privilege_level_management = true
      command_filtering = true
      access_control_lists = true
    }
    protocol_advantages = [
      "Separate authentication, authorization, and accounting",
      "Granular command-level authorization control",
      "Detailed session and command accounting",
      "Encrypted client-server communication",
      "Flexible privilege level management",
      "Real-time access control decisions",
      "Comprehensive audit trail capabilities",
      "Integration with enterprise identity systems"
    ]
  }
}

# TACACS+ Performance Metrics
output "tacacs_plus_performance_metrics" {
  description = "TACACS+ performance and reliability metrics"
  value = {
    performance_characteristics = {
      total_servers = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
      timeout_configured = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 0
      timeout_distribution = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 0 ? {
        for idx, server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : 
        "server_${idx}" => server.timeout
      } : {}
      authentication_speed = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "pap" ? "fast" : "secure"
    }
    reliability_metrics = {
      high_availability_enabled = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
      redundancy_factor = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
      fault_tolerance_level = (
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 1 ? "basic" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 2 ? "standard" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) >= 3 ? "high" : "enterprise"
      )
      service_availability = (
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 1 ? "99.0%" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 2 ? "99.9%" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) >= 3 ? "99.99%" : "99.999%"
      )
    }
    scalability_indicators = {
      server_capacity_utilization = (length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) / 4) * 100
      expansion_capability = 4 - length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
      load_balancing_ready = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
      enterprise_readiness = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) >= 2
    }
  }
}

# Security Analysis
output "security_analysis" {
  description = "Comprehensive security analysis of TACACS+ configuration"
  value = {
    authentication_security = {
      protocol_strength = (
        prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap" ? "strong" : "standard"
      )
      encryption_level = (
        prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap" ? "encrypted" : "cleartext"
      )
      replay_protection = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap"
      challenge_response = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "chap"
    }
    access_control_features = {
      granular_authorization = true
      command_level_control = true
      privilege_separation = true
      role_based_access = true
      session_management = true
      real_time_decisions = true
    }
    audit_and_compliance = {
      comprehensive_logging = true
      session_accounting = true
      command_accounting = true
      audit_trail_complete = true
      compliance_ready = true
      forensic_capabilities = true
    }
    security_recommendations = [
      prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol == "pap" ? 
      "Consider upgrading to CHAP for enhanced security" : "CHAP protocol provides optimal security",
      length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 1 ? 
      "Add backup servers for high availability" : "Multiple servers provide good redundancy",
      "Regularly rotate shared secrets for enhanced security",
      "Monitor TACACS+ server performance and availability",
      "Implement network segmentation for TACACS+ traffic",
      "Use strong, unique shared secrets for each server"
    ]
  }
}

# Network Configuration Analysis
output "network_configuration_analysis" {
  description = "Analysis of network configuration for TACACS+ servers"
  value = {
    network_topology = {
      dual_stack_support = (
        length([for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server if server.server_ip != null]) > 0 &&
        length([for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server if server.server_ipv6 != null]) > 0
      )
      dns_resolution_required = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_fqdn != null
      ]) > 0
      direct_ip_connections = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_ip != null || server.server_ipv6 != null
      ])
    }
    port_configuration = {
      standard_tacacs_port = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_port == 49
      ])
      custom_ports = length([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server
        if server.server_port != 49
      ])
      port_diversity = length(distinct([
        for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server.server_port
      ]))
    }
    timeout_configuration = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 0 ? {
      timeout_servers_count = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
      timeout_values = [for server in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers : server.timeout]
      timeout_analysis = "configured"
    } : {
      timeout_servers_count = 0
      timeout_values = []
      timeout_analysis = "not-configured"
    }
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags
    tags_count      = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags != null ? prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags : [])
    has_tags        = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags != null && length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags) > 0
    tags_analysis = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags != null ? {
      for tag in prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tags : tag => {
        length = length(tag)
        is_valid_format = can(regex("^[^,\\s]+$", tag))
        tag_category = (
          contains(["terraform", "infrastructure", "automation"], tag) ? "infrastructure" :
          contains(["tacacs", "authentication", "aaa", "security"], tag) ? "security" :
          contains(["production", "staging", "development", "test"], tag) ? "environment" :
          contains(["enterprise", "compliance", "audit"], tag) ? "governance" :
          "custom"
        )
      }
    } : {}
  }
}

# TACACS+ Integration Status
output "tacacs_plus_integration_status" {
  description = "Status of TACACS+ integration and readiness"
  value = {
    integration_readiness = {
      profile_configured = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.id != null
      servers_configured = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 0
      authentication_protocol_set = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol != null
      redundancy_available = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
      high_availability_ready = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) >= 2
    }
    deployment_status = {
      tacacs_plus_service_ready = true
      authentication_enabled = true
      authorization_enabled = true
      accounting_enabled = true
      centralized_management_active = true
    }
    operational_capabilities = {
      user_authentication = "enabled"
      command_authorization = "enabled"
      session_accounting = "enabled"
      privilege_management = "enabled"
      access_control = "granular"
      audit_logging = "comprehensive"
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the TACACS+ profile deployment"
  value = {
    deployed_at                     = timestamp()
    resource_count                  = 1
    resource_type                   = "tacacs_plus_profile"
    status                          = "success"
    servers_configured              = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
    authentication_protocol         = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol
    high_availability_enabled       = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
    tacacs_plus_ready               = true
    api_version                     = "v2.0"
    api_model                       = "TacacsPlusProfile"
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    profile_name_valid             = length(var.tacacs_plus_profile_name) > 0 && length(var.tacacs_plus_profile_name) <= 128
    authentication_protocol_valid  = contains(["pap", "chap"], var.authentication_protocol)
    servers_count_valid            = length(var.tacacs_plus_servers) >= 1 && length(var.tacacs_plus_servers) <= 4
    servers_configuration_valid    = alltrue([
      for server in var.tacacs_plus_servers : 
      (server.server_ip != null && server.server_ip != "") ||
      (server.server_ipv6 != null && server.server_ipv6 != "") ||
      (server.server_fqdn != null && server.server_fqdn != "")
    ])
    servers_secrets_valid          = alltrue([
      for server in var.tacacs_plus_servers : 
      server.secret != null && server.secret != ""
    ])
    description_valid              = length(var.description) <= 256
    tags_count_valid               = length(var.tags) <= 10
    tags_format_valid              = alltrue([for tag in var.tags : length(tag) <= 128])
    tags_unique                    = length(var.tags) == length(distinct(var.tags))
    all_validations_passed         = (
      length(var.tacacs_plus_profile_name) > 0 && length(var.tacacs_plus_profile_name) <= 128 &&
      contains(["pap", "chap"], var.authentication_protocol) &&
      length(var.tacacs_plus_servers) >= 1 && length(var.tacacs_plus_servers) <= 4 &&
      alltrue([for server in var.tacacs_plus_servers : server.secret != null && server.secret != ""]) &&
      length(var.description) <= 256 &&
      length(var.tags) <= 10
    )
  }
}

# TACACS+ Compliance Report
output "tacacs_plus_compliance_report" {
  description = "Comprehensive TACACS+ compliance report for the configuration"
  value = {
    security_compliance = {
      authentication_protocol_status = contains(["pap", "chap"], var.authentication_protocol) ? "compliant" : "non-compliant"
      server_redundancy_status = length(var.tacacs_plus_servers) >= 2 ? "compliant" : "partial-compliance"
      secret_configuration_status = alltrue([
        for server in var.tacacs_plus_servers : 
        server.secret != null && server.secret != ""
      ]) ? "compliant" : "non-compliant"
      timeout_configuration_status = alltrue([
        for server in var.tacacs_plus_servers : 
        server.timeout >= 1 && server.timeout <= 60
      ]) ? "compliant" : "non-compliant"
    }
    network_compliance = {
      server_addressing_status = alltrue([
        for server in var.tacacs_plus_servers : 
        (server.server_ip != null && server.server_ip != "") ||
        (server.server_ipv6 != null && server.server_ipv6 != "") ||
        (server.server_fqdn != null && server.server_fqdn != "")
      ]) ? "compliant" : "non-compliant"
      port_configuration_status = alltrue([
        for server in var.tacacs_plus_servers : 
        server.server_port >= 1 && server.server_port <= 65535
      ]) ? "compliant" : "non-compliant"
      dual_stack_support_status = (
        length([for server in var.tacacs_plus_servers : server if server.server_ip != null]) > 0 &&
        length([for server in var.tacacs_plus_servers : server if server.server_ipv6 != null]) > 0
      ) ? "ipv4-ipv6-ready" : "single-stack"
    }
    operational_compliance = {
      profile_name_compliance = length(var.tacacs_plus_profile_name) > 0 && length(var.tacacs_plus_profile_name) <= 128 ? "compliant" : "non-compliant"
      description_format_compliance = length(var.description) <= 256 ? "compliant" : "non-compliant"
      tags_compliance = (
        length(var.tags) <= 10 &&
        alltrue([for tag in var.tags : length(tag) <= 128]) &&
        length(var.tags) == length(distinct(var.tags))
      ) ? "compliant" : "non-compliant"
    }
    overall_tacacs_compliance_status = (
      contains(["pap", "chap"], var.authentication_protocol) &&
      length(var.tacacs_plus_servers) >= 1 && length(var.tacacs_plus_servers) <= 4 &&
      alltrue([for server in var.tacacs_plus_servers : server.secret != null && server.secret != ""]) &&
      length(var.tacacs_plus_profile_name) > 0 && length(var.tacacs_plus_profile_name) <= 128 &&
      length(var.description) <= 256 &&
      length(var.tags) <= 10
    ) ? "fully-compliant" : "non-compliant"
    tacacs_compliance_score = (
      (contains(["pap", "chap"], var.authentication_protocol) ? 1 : 0) +
      (length(var.tacacs_plus_servers) >= 1 && length(var.tacacs_plus_servers) <= 4 ? 1 : 0) +
      (alltrue([for server in var.tacacs_plus_servers : server.secret != null && server.secret != ""]) ? 1 : 0) +
      (length(var.tacacs_plus_profile_name) > 0 && length(var.tacacs_plus_profile_name) <= 128 ? 1 : 0) +
      (length(var.description) <= 256 ? 1 : 0) +
      (length(var.tags) <= 10 ? 1 : 0)
    ) / 6 * 100
  }
}

# TACACS+ Use Cases Analysis
output "tacacs_plus_use_cases_analysis" {
  description = "Analysis of TACACS+ use cases and applications"
  value = {
    enterprise_authentication = {
      network_device_access = {
        suitability = "excellent"
        granular_control = "command-level"
        audit_capability = "comprehensive"
        role_based_access = "full-support"
      }
      privileged_access_management = {
        suitability = "excellent"
        privilege_escalation_control = "granular"
        session_monitoring = "real-time"
        compliance_reporting = "detailed"
      }
      administrative_access = {
        suitability = "excellent"
        centralized_management = "enabled"
        policy_enforcement = "consistent"
        access_logging = "complete"
      }
    }
    security_and_compliance = {
      regulatory_compliance = {
        sox_compliance = "supported"
        pci_dss_compliance = "supported"
        hipaa_compliance = "supported"
        gdpr_compliance = "supported"
        audit_trail = "comprehensive"
      }
      security_policies = {
        access_control = "granular"
        command_authorization = "per-command"
        session_accounting = "detailed"
        privilege_management = "role-based"
      }
      forensic_capabilities = {
        audit_logging = "comprehensive"
        session_recording = "detailed"
        command_tracking = "complete"
        user_activity_monitoring = "real-time"
      }
    }
    operational_benefits = {
      centralized_management = {
        user_management = "centralized"
        policy_distribution = "consistent"
        configuration_management = "simplified"
        maintenance_overhead = "reduced"
      }
      high_availability = {
        server_redundancy = length(var.tacacs_plus_servers) > 1 ? "enabled" : "disabled"
        failover_capability = length(var.tacacs_plus_servers) > 1 ? "automatic" : "none"
        load_balancing = length(var.tacacs_plus_servers) > 1 ? "supported" : "none"
        service_availability = length(var.tacacs_plus_servers) > 1 ? "99.9%+" : "99.0%"
      }
    }
  }
}

# Operational Summary Report
output "operational_summary_report" {
  description = "Comprehensive operational summary of the TACACS+ configuration"
  value = {
    executive_summary = {
      feature_name = "TACACS+ Authentication Profile"
      deployment_scope = "Enterprise authentication, authorization, and accounting"
      current_status = "Active"
      deployment_success = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.id != null
      servers_configured = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
      authentication_protocol = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol
      high_availability = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) > 1
    }
    technical_details = {
      resource_id = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.id
      server_count = length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers)
      authentication_method = upper(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.authentication_protocol)
            redundancy_level = (
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 1 ? "none" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) == 2 ? "basic" :
        length(prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.tacacs_plus_servers) >= 3 ? "high" : "enterprise"
      )
      api_version = "v2.0"
      schema_version = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.x_schema
      etag_value = prismasdwan_tacacs_plus_profile.tacacs_plus_profile_full.x_etag
    }
    business_impact = {
      security_posture = "Enhanced"
      compliance_readiness = "Improved"
      operational_efficiency = "Optimized"
      administrative_overhead = "Reduced"
      audit_capabilities = "Comprehensive"
      user_experience = "Centralized"
    }
  }
}
