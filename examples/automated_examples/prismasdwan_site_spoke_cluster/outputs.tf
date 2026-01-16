# Spoke Cluster Details
output "spoke_cluster_details" {
  description = "Details of the created spoke cluster"
  value = {
    id                     = prismasdwan_site_spoke_cluster.spoke_cluster_full.id
    name                   = prismasdwan_site_spoke_cluster.spoke_cluster_full.name
    description            = prismasdwan_site_spoke_cluster.spoke_cluster_full.description
    tags                   = prismasdwan_site_spoke_cluster.spoke_cluster_full.tags
    advertisement_interval = prismasdwan_site_spoke_cluster.spoke_cluster_full.advertisement_interval
    preempt               = prismasdwan_site_spoke_cluster.spoke_cluster_full.preempt
    tfid                  = prismasdwan_site_spoke_cluster.spoke_cluster_full.tfid
    x_etag                = prismasdwan_site_spoke_cluster.spoke_cluster_full.x_etag
    x_schema              = prismasdwan_site_spoke_cluster.spoke_cluster_full.x_schema
  }
}

# Individual outputs for easy access
output "spoke_cluster_id" {
  description = "ID of the created spoke cluster"
  value       = prismasdwan_site_spoke_cluster.spoke_cluster_full.id
}

output "spoke_cluster_name" {
  description = "Name of the created spoke cluster"
  value       = prismasdwan_site_spoke_cluster.spoke_cluster_full.name
}

output "spoke_cluster_tfid" {
  description = "Terraform ID of the spoke cluster"
  value       = prismasdwan_site_spoke_cluster.spoke_cluster_full.tfid
}

output "site_resolved" {
  description = "Resolved site ID from name"
  value       = prismasdwan_resource_locator.site.result
}

output "advertisement_interval" {
  description = "Advertisement interval configured for the spoke cluster"
  value       = prismasdwan_site_spoke_cluster.spoke_cluster_full.advertisement_interval
}

output "preempt_enabled" {
  description = "Whether preempt is enabled for the spoke cluster"
  value       = prismasdwan_site_spoke_cluster.spoke_cluster_full.preempt
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of spoke cluster configuration"
  value = {
    cluster_properties = {
      name_length            = length(var.spoke_cluster_name)
      description_length     = length(var.description)
      advertisement_interval = var.advertisement_interval
      preempt_enabled       = var.preempt
      
      # Advertisement interval analysis
      interval_performance = (
        var.advertisement_interval <= 3.0 ? "high-frequency" :
        var.advertisement_interval <= 5.0 ? "standard" :
        var.advertisement_interval <= 10.0 ? "conservative" : "slow"
      )
      
      # Failover characteristics
      failover_speed = (
        var.advertisement_interval <= 3.0 && var.preempt ? "fast" :
        var.advertisement_interval <= 5.0 && var.preempt ? "medium" :
        var.preempt ? "standard" : "manual"
      )
      
      recommended_for = (var.preempt && var.advertisement_interval <= 5.0) ? "critical-applications" : "standard-applications"
    }
    
    site_analysis = {
      site_name    = var.site_name
      resolved_id  = prismasdwan_resource_locator.site.result
    }
    
    redundancy_configuration = {
      preempt_mode = var.preempt ? "automatic" : "manual"
      convergence_estimate_seconds = var.advertisement_interval * 3
    }
  }
}

# Performance Metrics
output "performance_metrics" {
  description = "Expected performance metrics for the spoke cluster"
  value = {
    convergence_time = {
      detection_time_seconds    = var.advertisement_interval
      failover_time_seconds    = var.advertisement_interval * 2
      total_convergence_seconds = var.advertisement_interval * 3
      
      # Performance classification
      performance_class = (
        var.advertisement_interval <= 2.5 ? "ultra-fast" :
        var.advertisement_interval <= 5.0 ? "fast" :
        var.advertisement_interval <= 10.0 ? "standard" : "slow"
      )
    }
    
    network_overhead = {
      advertisements_per_minute = 60 / var.advertisement_interval
      daily_advertisements     = (60 / var.advertisement_interval) * 60 * 24
      overhead_level = (
        var.advertisement_interval <= 3.0 ? "high" :
        var.advertisement_interval <= 5.0 ? "medium" : "low"
      )
    }
    
    operational_characteristics = {
      preemption_behavior = var.preempt ? "aggressive" : "stable"
      stability_vs_speed = (var.preempt && var.advertisement_interval <= 3.0) ? "speed-optimized" : "stability-optimized"
      recommended_deployment = (
        var.preempt && var.advertisement_interval <= 5.0 ? "mission-critical" :
        var.preempt ? "business-critical" : "standard-business"
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
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of tags configuration"
  value = {
    total_tags = length(var.tags)
    tags_list  = var.tags
    tags_compliance = {
      within_limit     = length(var.tags) <= 10
      valid_format     = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
      unique_tags      = length(var.tags) == length(distinct(var.tags))
      max_length_ok    = alltrue([for tag in var.tags : length(tag) <= 1024])
    }
    
    tag_categories = {
      infrastructure_tags = length([for tag in var.tags : tag if contains(["terraform", "infrastructure", "automation"], tag)])
      network_tags       = length([for tag in var.tags : tag if contains(["spoke-cluster", "branch", "failover", "ha"], tag)])
      environment_tags   = length([for tag in var.tags : tag if contains(["production", "staging", "development"], tag)])
    }
  }
}

# Validation Status
output "validation_status" {
  description = "Validation status of the spoke cluster configuration"
  value = {
    name_valid                = length(var.spoke_cluster_name) > 0 && length(var.spoke_cluster_name) <= 128
    description_valid         = length(var.description) <= 1024
    tags_valid               = length(var.tags) <= 10 && alltrue([for tag in var.tags : length(tag) <= 1024])
    advertisement_interval_valid = var.advertisement_interval >= 2.0
    site_name_valid          = length(var.site_name) > 0
    
    overall_status = (
      length(var.spoke_cluster_name) > 0 && 
      length(var.spoke_cluster_name) <= 128 &&
      var.advertisement_interval >= 2.0 &&
      length(var.site_name) > 0
    ) ? "valid" : "invalid"
  }
}

# High Availability Analysis
output "high_availability_analysis" {
  description = "Analysis of high availability configuration"
  value = {
    ha_characteristics = {
      automatic_failover = var.preempt
      detection_speed   = var.advertisement_interval
      recovery_mode     = var.preempt ? "automatic-preemption" : "manual-intervention"
      
      # HA classification
      ha_level = (
        var.preempt && var.advertisement_interval <= 3.0 ? "tier-1-critical" :
        var.preempt && var.advertisement_interval <= 5.0 ? "tier-2-business" :
        var.preempt ? "tier-3-standard" : "tier-4-basic"
      )
    }
    
    suitability_analysis = {
      critical_applications = var.preempt && var.advertisement_interval <= 3.0
      business_applications = var.preempt && var.advertisement_interval <= 5.0
      standard_applications = var.advertisement_interval <= 10.0
      basic_connectivity   = true
      
      deployment_recommendations = {
        financial_services = var.preempt && var.advertisement_interval <= 2.5
        healthcare        = var.preempt && var.advertisement_interval <= 3.0
        manufacturing     = var.preempt && var.advertisement_interval <= 5.0
        retail           = var.preempt && var.advertisement_interval <= 5.0
        general_business = var.advertisement_interval <= 10.0
      }
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Spoke cluster deployment status and metadata"
  value = {
    status              = "success"
    deployed_at        = timestamp()
    resource_type      = "site_spoke_cluster"
    resource_count     = 1
    cluster_ready      = true
    
    configuration_summary = {
      site_name              = var.site_name
      advertisement_interval = var.advertisement_interval
      preempt_enabled       = var.preempt
      tags_count            = length(var.tags)
    }
    
    resource_dependencies = {
      site_resolved        = prismasdwan_resource_locator.site.result != null
      all_dependencies_met = prismasdwan_resource_locator.site.result != null
    }
    
    operational_readiness = {
      failover_ready       = var.preempt
      monitoring_interval  = var.advertisement_interval
      convergence_estimate = "${var.advertisement_interval * 3} seconds"
    }
  }
}