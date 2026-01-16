
      # OSPF Global Config Details
output "ospf_global_config_details" {
  description = "Details of the created OSPF global configuration"
  value = {
    id                     = prismasdwan_element_ospf_global_config.ospf_global_config_full.id
    prefix_adv_type_to_lan = prismasdwan_element_ospf_global_config.ospf_global_config_full.prefix_adv_type_to_lan
    retransmit_interval    = prismasdwan_element_ospf_global_config.ospf_global_config_full.retransmit_interval
    cost                   = prismasdwan_element_ospf_global_config.ospf_global_config_full.cost
    md5_key_id            = prismasdwan_element_ospf_global_config.ospf_global_config_full.md5_key_id
    dead_interval         = prismasdwan_element_ospf_global_config.ospf_global_config_full.dead_interval
    hello_interval        = prismasdwan_element_ospf_global_config.ospf_global_config_full.hello_interval
    transmit_delay        = prismasdwan_element_ospf_global_config.ospf_global_config_full.transmit_delay
    router_id            = prismasdwan_element_ospf_global_config.ospf_global_config_full.router_id
    x_etag               = prismasdwan_element_ospf_global_config.ospf_global_config_full.x_etag
    x_schema             = prismasdwan_element_ospf_global_config.ospf_global_config_full.x_schema
  }
  sensitive = true  # Due to potential MD5 secret
}

# Individual outputs for easy access
output "ospf_config_id" {
  description = "ID of the created OSPF global configuration"
  value       = prismasdwan_element_ospf_global_config.ospf_global_config_full.id
}

output "router_id" {
  description = "OSPF Router ID configured"
  value       = prismasdwan_element_ospf_global_config.ospf_global_config_full.router_id
}

output "site_resolved" {
  description = "Resolved site ID from name"
  value       = prismasdwan_resource_locator.site.result
}

output "element_resolved" {
  description = "Resolved element ID from name"
  value       = prismasdwan_resource_locator.element.result
}

output "ospf_timers" {
  description = "OSPF timer configuration"
  value = {
    hello_interval      = prismasdwan_element_ospf_global_config.ospf_global_config_full.hello_interval
    dead_interval       = prismasdwan_element_ospf_global_config.ospf_global_config_full.dead_interval
    retransmit_interval = prismasdwan_element_ospf_global_config.ospf_global_config_full.retransmit_interval
    transmit_delay      = prismasdwan_element_ospf_global_config.ospf_global_config_full.transmit_delay
  }
}

output "ospf_cost_config" {
  description = "OSPF cost and advertisement configuration"
  value = {
    cost                   = prismasdwan_element_ospf_global_config.ospf_global_config_full.cost
    prefix_adv_type_to_lan = prismasdwan_element_ospf_global_config.ospf_global_config_full.prefix_adv_type_to_lan
  }
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of OSPF global configuration"
  value = {
    timing_analysis = {
      hello_interval      = var.hello_interval
      dead_interval       = var.dead_interval
      dead_to_hello_ratio = var.dead_interval / var.hello_interval
      
      # Timing classification
      convergence_speed = (
        var.hello_interval <= 5 && var.dead_interval <= 20 ? "fast" :
        var.hello_interval <= 10 && var.dead_interval <= 40 ? "standard" :
        var.hello_interval <= 30 && var.dead_interval <= 120 ? "conservative" : "slow"
      )
      
      # Network stability assessment
      stability_level = (
        var.dead_interval >= (var.hello_interval * 4) ? "stable" :
        var.dead_interval >= (var.hello_interval * 3) ? "moderate" : "aggressive"
      )
      
      # Performance characteristics
      failure_detection_time = var.dead_interval
      hello_frequency_per_minute = 60 / var.hello_interval
    }
    
    cost_analysis = {
      configured_cost = var.cost
      cost_category = (
        var.cost <= 10 ? "high-priority" :
        var.cost <= 100 ? "standard" :
        var.cost <= 1000 ? "backup" : "last-resort"
      )
      bandwidth_implication = (
        var.cost <= 10 ? ">=100Mbps" :
        var.cost <= 100 ? ">=10Mbps" :
        var.cost <= 1000 ? ">=1Mbps" : "<1Mbps"
      )
    }
    
    security_analysis = {
      authentication_enabled = var.md5_key_id != null && var.md5_secret != null
      authentication_method = var.md5_key_id != null ? "MD5" : "none"
      security_level = var.md5_key_id != null ? "authenticated" : "plain-text"
    }
    
    advertisement_analysis = {
      prefix_advertisement_type = var.prefix_adv_type_to_lan
      route_propagation = (
        var.prefix_adv_type_to_lan == "redistribute" ? "dynamic-redistribution" :
        var.prefix_adv_type_to_lan == "summary" ? "summarized-routes" :
        var.prefix_adv_type_to_lan == "external" ? "external-routes" : "default-behavior"
      )
    }
  }
  sensitive = true
}

# Performance Metrics
output "performance_metrics" {
  description = "Expected performance metrics for OSPF configuration"
  value = {
    convergence_characteristics = {
      neighbor_detection_time_seconds = var.hello_interval
      neighbor_down_detection_seconds = var.dead_interval
      lsa_retransmission_interval     = var.retransmit_interval
      lsa_transmission_delay         = var.transmit_delay
      
      # Overall convergence estimate
      estimated_convergence_time = var.dead_interval + var.retransmit_interval + 5
      
      # Network overhead
      hello_packets_per_hour = 3600 / var.hello_interval
      daily_hello_packets   = (3600 / var.hello_interval) * 24
      
      # Performance classification
      performance_profile = (
        var.hello_interval <= 5 ? "high-performance" :
        var.hello_interval <= 10 ? "standard-performance" :
        var.hello_interval <= 30 ? "conservative" : "low-overhead"
      )
    }
    
    reliability_metrics = {
      false_positive_resistance = var.dead_interval / var.hello_interval
      network_stability_score = (
        var.dead_interval >= (var.hello_interval * 4) ? 10 :
        var.dead_interval >= (var.hello_interval * 3) ? 7 :
        var.dead_interval >= (var.hello_interval * 2) ? 4 : 1
      )
      
      recommended_for = (
        var.dead_interval >= (var.hello_interval * 4) && var.hello_interval <= 10 ? "production" :
        var.dead_interval >= (var.hello_interval * 3) ? "staging" : "lab-testing"
      )
    }
  }
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    site_resolution = {
      site_name     = var.site_name
      resolved_id   = prismasdwan_resource_locator.site.result
      resolution_ok = prismasdwan_resource_locator.site.result != null
    }
    
    element_resolution = {
      element_name  = var.element_name
      resolved_id   = prismasdwan_resource_locator.element.result
      resolution_ok = prismasdwan_resource_locator.element.result != null
    }
    
    overall_resolution_status = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.element.result != null
    ) ? "success" : "failed"
  }
}

# Security Assessment
output "security_assessment" {
  description = "Security assessment of OSPF configuration"
  value = {
    authentication_status = {
      md5_enabled = var.md5_key_id != null && var.md5_secret != null
      key_id     = var.md5_key_id
      # Don't expose the actual secret
      secret_configured = var.md5_secret != null
    }
    
    security_recommendations = {
      authentication_required = true
      current_security_level = var.md5_key_id != null ? "authenticated" : "insecure"
      
      compliance_status = {
        enterprise_ready = var.md5_key_id != null && var.md5_secret != null
        production_ready = (
          var.md5_key_id != null && 
          var.md5_secret != null && 
          var.dead_interval >= (var.hello_interval * 4)
        )
      }
    }
  }
  sensitive = true
}

# Best Practices Compliance
output "best_practices_compliance" {
  description = "Compliance with OSPF best practices"
  value = {
    timing_compliance = {
      dead_interval_multiplier = var.dead_interval / var.hello_interval
      meets_4x_rule = var.dead_interval >= (var.hello_interval * 4)
      timing_stability = var.dead_interval >= (var.hello_interval * 4) ? "excellent" : "needs-improvement"
    }
    
    cost_compliance = {
      cost_value = var.cost
      cost_reasonable = var.cost >= 1 && var.cost <= 65535
      cost_category_appropriate = (
        var.cost <= 10 ? "high-speed-links" :
        var.cost <= 100 ? "standard-links" : "low-speed-links"
      )
    }
    
    security_compliance = {
      authentication_configured = var.md5_key_id != null && var.md5_secret != null
      meets_security_standards = var.md5_key_id != null && var.md5_secret != null
    }
    
    overall_compliance_score = (
      (var.dead_interval >= (var.hello_interval * 4) ? 1 : 0) +
      (var.cost >= 1 && var.cost <= 65535 ? 1 : 0) +
      (var.md5_key_id != null && var.md5_secret != null ? 1 : 0)
    )
    
    compliance_grade = (
      local.compliance_score == 3 ? "A" :
      local.compliance_score == 2 ? "B" :
      local.compliance_score == 1 ? "C" : "D"
    )
  }
  sensitive = true
}

# Deployment Status
output "deployment_status" {
  description = "OSPF global configuration deployment status and metadata"
  value = {
    status              = "success"
    deployed_at        = timestamp()
    resource_type      = "element_ospf_global_config"
    resource_count     = 1
    configuration_ready = true
    
    configuration_summary = {
      site_name               = var.site_name
      element_name            = var.element_name
      router_id              = var.router_id
      hello_interval         = var.hello_interval
      dead_interval          = var.dead_interval
      cost                   = var.cost
      authentication_enabled = var.md5_key_id != null
    }
    
    resource_dependencies = {
      site_resolved        = prismasdwan_resource_locator.site.result != null
      element_resolved     = prismasdwan_resource_locator.element.result != null
      all_dependencies_met = (
        prismasdwan_resource_locator.site.result != null &&
        prismasdwan_resource_locator.element.result != null
      )
    }
    
    operational_readiness = {
      ospf_timers_configured = true
      cost_configured       = true
      router_id_set         = var.router_id != null
      authentication_ready  = var.md5_key_id != null && var.md5_secret != null
      
      production_readiness = (
        var.dead_interval >= (var.hello_interval * 4) &&
        var.md5_key_id != null &&
        var.md5_secret != null &&
        var.router_id != null
      ) ? "production-ready" : "requires-review"
    }
  }
  sensitive = true
}

# Local for compliance calculation
locals {
  compliance_score = (
    (var.dead_interval >= (var.hello_interval * 4) ? 1 : 0) +
    (var.cost >= 1 && var.cost <= 65535 ? 1 : 0) +
    (var.md5_key_id != null && var.md5_secret != null ? 1 : 0)
  )
}
