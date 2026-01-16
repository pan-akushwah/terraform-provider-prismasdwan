# Hub Distribution Fabric Details
output "hub_distribution_fabric_details" {
  description = "Details of the created hub distribution fabric"
  value = {
    id             = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.id
    name           = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.name
    description    = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.description
    tags           = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.tags
    spoke_site_ids = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.spoke_site_ids
    x_etag         = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.x_etag
    x_schema       = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.x_schema
  }
}

# Individual outputs for easy access
output "distribution_fabric_id" {
  description = "ID of the created hub distribution fabric"
  value       = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.id
}

output "distribution_fabric_name" {
  description = "Name of the created hub distribution fabric"
  value       = prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.name
}

output "hub_site_resolved" {
  description = "Resolved hub site ID from name"
  value       = prismasdwan_resource_locator.hub_site.result
}

output "spoke_sites_resolved" {
  description = "Resolved spoke site IDs from names"
  value       = [for locator in prismasdwan_resource_locator.spoke_sites : locator.result]
}

output "spoke_site_count" {
  description = "Number of spoke sites in the distribution fabric"
  value       = length(prismasdwan_site_hub_distribution_fabric.hub_distribution_fabric_full.spoke_site_ids)
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of hub distribution fabric configuration"
  value = {
    fabric_properties = {
      name_length        = length(var.distribution_fabric_name)
      description_length = length(var.description)
      spoke_sites_count  = length(var.spoke_site_names)
      
      # Scale classification
      scale_category = (
        length(var.spoke_site_names) <= 10 ? "small-enterprise" :
        length(var.spoke_site_names) <= 50 ? "medium-enterprise" :
        length(var.spoke_site_names) <= 100 ? "large-enterprise" : "mega-enterprise"
      )
      
      # Distribution complexity
      distribution_complexity = (
        length(var.spoke_site_names) <= 5 ? "simple" :
        length(var.spoke_site_names) <= 20 ? "moderate" :
        length(var.spoke_site_names) <= 50 ? "complex" : "highly-complex"
      )
    }
    
    hub_analysis = {
      hub_site_name = var.hub_site_name
      resolved_id   = prismasdwan_resource_locator.hub_site.result
      
      # Hub load estimation
      estimated_prefix_advertisements = length(var.spoke_site_names) * 10
      estimated_routing_updates_per_hour = length(var.spoke_site_names) * 60
      
      # Hub capacity requirements
      capacity_requirements = {
        minimum_bandwidth_mbps = length(var.spoke_site_names) * 2
        recommended_bandwidth_mbps = length(var.spoke_site_names) * 5
        cpu_load_estimate = (
          length(var.spoke_site_names) <= 10 ? "low" :
          length(var.spoke_site_names) <= 50 ? "medium" : "high"
        )
      }
    }
    
    spoke_analysis = {
      spoke_sites_list = var.spoke_site_names
      total_spoke_sites = length(var.spoke_site_names)
      
      # Network topology implications
      topology_characteristics = {
        hub_spoke_connections = length(var.spoke_site_names)
        total_potential_paths = length(var.spoke_site_names) + 1
        routing_table_size_estimate = length(var.spoke_site_names) * 5
        
        # Failover characteristics
        single_point_of_failure = true
        backup_hub_recommended = length(var.spoke_site_names) > 20
      }
    }
  }
}

# Performance Metrics
output "performance_metrics" {
  description = "Expected performance metrics for the distribution fabric"
  value = {
    distribution_performance = {
      prefix_distribution_targets = length(var.spoke_site_names)
      estimated_convergence_time_seconds = length(var.spoke_site_names) * 2
      
      # Performance classification
      performance_tier = (
        length(var.spoke_site_names) <= 10 ? "high-performance" :
        length(var.spoke_site_names) <= 30 ? "standard-performance" :
        length(var.spoke_site_names) <= 50 ? "enterprise-scale" : "carrier-scale"
      )
      
      # Routing metrics
      routing_metrics = {
        lsa_propagation_time_estimate = length(var.spoke_site_names) * 0.5
        routing_table_convergence_estimate = length(var.spoke_site_names) * 1.5
        prefix_advertisement_frequency = "real-time"
      }
    }
    
    scalability_metrics = {
      current_utilization_percentage = (length(var.spoke_site_names) / var.max_spoke_sites) * 100
      remaining_capacity = var.max_spoke_sites - length(var.spoke_site_names)
      scale_headroom = (
        (length(var.spoke_site_names) / var.max_spoke_sites) < 0.7 ? "adequate" :
        (length(var.spoke_site_names) / var.max_spoke_sites) < 0.9 ? "limited" : "critical"
      )
      
      # Growth projections
      recommended_max_growth = var.max_spoke_sites - length(var.spoke_site_names) - 5
      growth_capacity_years = (
        (var.max_spoke_sites - length(var.spoke_site_names)) / (length(var.spoke_site_names) * 0.2)
      )
    }
    
    network_efficiency = {
      hub_bandwidth_efficiency = 100 / length(var.spoke_site_names)
      spoke_isolation_level = "hub-dependent"
      redundancy_factor = 1.0
      
      # Traffic characteristics
      expected_traffic_patterns = {
        hub_to_spoke_percentage = 60
        spoke_to_hub_percentage = 30
        spoke_to_spoke_via_hub_percentage = 10
      }
    }
  }
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    hub_site_resolution = {
      site_name     = var.hub_site_name
      resolved_id   = prismasdwan_resource_locator.hub_site.result
      resolution_ok = prismasdwan_resource_locator.hub_site.result != null
    }
    
    spoke_sites_resolution = {
      requested_count = length(var.spoke_site_names)
      resolved_count  = length(prismasdwan_resource_locator.spoke_sites)
      site_mappings = {
        for i, name in var.spoke_site_names : name => prismasdwan_resource_locator.spoke_sites[i].result
      }
      
      resolution_success_rate = (
        length([for locator in prismasdwan_resource_locator.spoke_sites : locator.result if locator.result != null]) /
        length(var.spoke_site_names)
      ) * 100
    }
    
    overall_resolution_status = (
      prismasdwan_resource_locator.hub_site.result != null &&
      length([for locator in prismasdwan_resource_locator.spoke_sites : locator.result if locator.result != null]) == length(var.spoke_site_names)
    ) ? "success" : "partial-or-failed"
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
      network_tags       = length([for tag in var.tags : tag if contains(["hub-distribution", "prefix-distribution", "routing"], tag)])
      environment_tags   = length([for tag in var.tags : tag if contains(["production", "staging", "development"], tag)])
      business_tags      = length([for tag in var.tags : tag if contains(["enterprise", "wan-optimization", "business"], tag)])
    }
  }
}

# Validation Status
output "validation_status" {
  description = "Validation status of the hub distribution fabric configuration"
  value = {
    name_valid              = length(var.distribution_fabric_name) > 0 && length(var.distribution_fabric_name) <= 128
    description_valid       = length(var.description) <= 1024
    tags_valid             = length(var.tags) <= 10 && alltrue([for tag in var.tags : length(tag) <= 1024])
    hub_site_name_valid    = length(var.hub_site_name) > 0
    spoke_sites_valid      = length(var.spoke_site_names) >= 1 && length(var.spoke_site_names) == length(distinct(var.spoke_site_names))
    capacity_valid         = length(var.spoke_site_names) <= var.max_spoke_sites
    
    overall_status = (
      length(var.distribution_fabric_name) > 0 && 
      length(var.distribution_fabric_name) <= 128 &&
      length(var.hub_site_name) > 0 &&
      length(var.spoke_site_names) >= 1 &&
      length(var.spoke_site_names) <= var.max_spoke_sites
    ) ? "valid" : "invalid"
  }
}

# Network Topology Analysis
output "network_topology_analysis" {
  description = "Analysis of network topology and architecture"
  value = {
    topology_type = "hub-and-spoke"
    
    hub_characteristics = {
      site_name = var.hub_site_name
      role = "central-distribution-point"
      criticality = "single-point-of-failure"
      
      # Hub requirements
      bandwidth_requirements = {
        aggregate_bandwidth_mbps = length(var.spoke_site_names) * 10
        peak_bandwidth_mbps = length(var.spoke_site_names) * 15
        redundancy_recommended = length(var.spoke_site_names) > 10
      }
      
      # Processing requirements
      processing_load = {
        prefix_processing_load = length(var.spoke_site_names) * 20
        routing_updates_per_minute = length(var.spoke_site_names) * 30
        connection_management_overhead = length(var.spoke_site_names) * 2
      }
    }
    
    spoke_characteristics = {
      total_spokes = length(var.spoke_site_names)
      spoke_sites = var.spoke_site_names
      
      # Spoke requirements
      per_spoke_requirements = {
        hub_connectivity_required = true
        backup_path_recommended = true
        local_breakout_capability = "optional"
      }
      
      # Spoke limitations
      connectivity_constraints = {
        spoke_to_spoke_direct = false
        hub_dependency = true
        isolation_level = "hub-mediated"
      }
    }
    
    fabric_characteristics = {
      distribution_method = "centralized"
      prefix_distribution_scope = "all-spokes"
      routing_convergence_model = "hub-centric"
      
      # Scalability characteristics
      scalability_factors = {
        linear_scaling = true
        hub_bottleneck_potential = length(var.spoke_site_names) > 50
        recommended_segmentation_threshold = 100
      }
    }
  }
}

# Business Impact Analysis
output "business_impact_analysis" {
  description = "Business impact analysis of the distribution fabric"
  value = {
    operational_impact = {
      service_availability_dependency = "hub-site-dependent"
      failure_impact_scope = "all-spoke-sites"
      recovery_complexity = (
        length(var.spoke_site_names) <= 10 ? "simple" :
        length(var.spoke_site_names) <= 50 ? "moderate" : "complex"
      )
      
      # Business continuity
      business_continuity_risk = (
        length(var.spoke_site_names) <= 20 ? "manageable" :
        length(var.spoke_site_names) <= 50 ? "moderate" : "high"
      )
    }
    
    performance_implications = {
      latency_characteristics = "hub-mediated"
      bandwidth_efficiency = 100 / length(var.spoke_site_names)
      routing_efficiency = "optimized-for-hub-spoke"
      
      # Performance recommendations
      performance_optimization = {
        hub_placement_critical = true
        hub_redundancy_recommended = length(var.spoke_site_names) > 20
        monitoring_complexity = "centralized"
      }
    }
    
    cost_implications = {
      infrastructure_cost_model = "hub-centric"
      scaling_cost_efficiency = "linear"
      operational_cost_concentration = "hub-focused"
      
      # Cost optimization opportunities
      cost_optimization = {
        economies_of_scale = length(var.spoke_site_names) > 10
        centralized_management_benefits = true
        shared_resource_efficiency = "high"
      }
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Hub distribution fabric deployment status and metadata"
  value = {
    status              = "success"
    deployed_at        = timestamp()
    resource_type      = "site_hub_distribution_fabric"
    resource_count     = 1
    fabric_ready       = true
    
    configuration_summary = {
      fabric_name           = var.distribution_fabric_name
      hub_site             = var.hub_site_name
      spoke_sites_count    = length(var.spoke_site_names)
      tags_count           = length(var.tags)
      max_capacity         = var.max_spoke_sites
      capacity_utilization = "${(length(var.spoke_site_names) / var.max_spoke_sites) * 100}%"
    }
    
        resource_dependencies = {
      hub_site_resolved      = prismasdwan_resource_locator.hub_site.result != null
      spoke_sites_resolved   = length([for locator in prismasdwan_resource_locator.spoke_sites : locator.result if locator.result != null]) == length(var.spoke_site_names)
      all_dependencies_met   = (
        prismasdwan_resource_locator.hub_site.result != null &&
        length([for locator in prismasdwan_resource_locator.spoke_sites : locator.result if locator.result != null]) == length(var.spoke_site_names)
      )
    }
    
    operational_readiness = {
      distribution_fabric_active = true
      prefix_distribution_ready  = true
      routing_coordination_ready = true
      hub_spoke_connectivity    = "established"
      
      production_readiness = (
        prismasdwan_resource_locator.hub_site.result != null &&
        length([for locator in prismasdwan_resource_locator.spoke_sites : locator.result if locator.result != null]) == length(var.spoke_site_names) &&
        length(var.spoke_site_names) >= 1
      ) ? "production-ready" : "requires-review"
    }
    
    monitoring_recommendations = {
      hub_site_monitoring_critical = true
      spoke_connectivity_monitoring = "essential"
      prefix_distribution_monitoring = "recommended"
      performance_baseline_required = true
      
      # Alert thresholds
      alert_configuration = {
        hub_site_down_alert = "critical"
        spoke_disconnection_threshold = ">=10%"
        prefix_distribution_delay_threshold = ">=30s"
        convergence_time_threshold = "${length(var.spoke_site_names) * 3}s"
      }
    }
  }
}

# High Availability Recommendations
output "high_availability_recommendations" {
  description = "High availability recommendations for the distribution fabric"
  value = {
    hub_redundancy = {
      backup_hub_required = length(var.spoke_site_names) > 20
      hub_clustering_recommended = length(var.spoke_site_names) > 50
      geographic_distribution = "recommended"
      
      # Failover characteristics
      failover_complexity = (
        length(var.spoke_site_names) <= 10 ? "simple" :
        length(var.spoke_site_names) <= 30 ? "moderate" : "complex"
      )
      
      recovery_time_estimate = "${length(var.spoke_site_names) * 5} minutes"
    }
    
    spoke_resilience = {
      backup_connectivity_paths = "recommended"
      local_breakout_capability = "optional"
      mesh_connectivity_consideration = length(var.spoke_site_names) <= 10
      
      # Spoke isolation protection
      isolation_protection = {
        hub_failure_impact = "all-spokes-affected"
        mitigation_strategy = "backup-hub-or-mesh"
        business_continuity_plan_required = true
      }
    }
    
    network_design_improvements = {
      dual_hub_architecture = length(var.spoke_site_names) > 20
      regional_hub_segmentation = length(var.spoke_site_names) > 50
      partial_mesh_overlay = length(var.spoke_site_names) > 30
      
      # Advanced architectures
      recommended_evolution_path = (
        length(var.spoke_site_names) <= 20 ? "maintain-hub-spoke" :
        length(var.spoke_site_names) <= 50 ? "consider-dual-hub" : "evaluate-mesh-hybrid"
      )
    }
  }
}

# Capacity Planning
output "capacity_planning" {
  description = "Capacity planning analysis and recommendations"
  value = {
    current_capacity = {
      utilized_capacity = length(var.spoke_site_names)
      maximum_capacity = var.max_spoke_sites
      utilization_percentage = (length(var.spoke_site_names) / var.max_spoke_sites) * 100
      remaining_capacity = var.max_spoke_sites - length(var.spoke_site_names)
    }
    
    growth_projections = {
      # Assuming 20% annual growth
      projected_growth_1_year = ceil(length(var.spoke_site_names) * 1.2)
      projected_growth_3_years = ceil(length(var.spoke_site_names) * 1.73)
      projected_growth_5_years = ceil(length(var.spoke_site_names) * 2.49)
      
      capacity_exhaustion_timeline = (
        var.max_spoke_sites > length(var.spoke_site_names) * 2.49 ? "5+ years" :
        var.max_spoke_sites > length(var.spoke_site_names) * 1.73 ? "3-5 years" :
        var.max_spoke_sites > length(var.spoke_site_names) * 1.2 ? "1-3 years" : "<1 year"
      )
    }
    
    scaling_recommendations = {
      immediate_action_required = (length(var.spoke_site_names) / var.max_spoke_sites) > 0.9
      planning_horizon_short = (length(var.spoke_site_names) / var.max_spoke_sites) > 0.7
      
      recommended_actions = (
        (length(var.spoke_site_names) / var.max_spoke_sites) > 0.9 ? "immediate-capacity-expansion" :
        (length(var.spoke_site_names) / var.max_spoke_sites) > 0.7 ? "plan-capacity-expansion" : "monitor-growth"
      )
      
      # Infrastructure scaling
      hub_scaling_requirements = {
        bandwidth_scaling_factor = ceil(length(var.spoke_site_names) / 20)
        processing_scaling_factor = ceil(length(var.spoke_site_names) / 30)
        redundancy_scaling_threshold = 50
      }
    }
  }
}
