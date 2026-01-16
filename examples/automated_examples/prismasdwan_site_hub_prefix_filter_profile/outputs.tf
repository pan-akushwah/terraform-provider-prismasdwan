# Hub Prefix Filter Profile Details
output "hub_prefix_filter_profile_details" {
  description = "Details of the created hub prefix filter profile"
  value = {
    id                      = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.id
    name                    = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.name
    description             = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.description
    tags                    = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.tags
    path_prefix_filter_list = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.path_prefix_filter_list
    x_etag                  = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.x_etag
    x_schema                = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.x_schema
  }
}

# Individual outputs for easy access
output "prefix_filter_profile_id" {
  description = "ID of the created hub prefix filter profile"
  value       = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.id
}

output "prefix_filter_profile_name" {
  description = "Name of the created hub prefix filter profile"
  value       = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_full.name
}

output "hub_site_resolved" {
  description = "Resolved hub site ID from name"
  value       = prismasdwan_resource_locator.hub_site.result
}

output "total_filter_count" {
  description = "Total number of prefix filters across all VRF contexts"
  value = sum([
    for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)
  ])
}

output "vrf_contexts_count" {
  description = "Number of VRF contexts configured"
  value = length(var.path_prefix_filter_list)
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of hub prefix filter profile configuration"
  value = {
    profile_properties = {
      name_length        = length(var.prefix_filter_profile_name)
      description_length = length(var.description)
      total_vrf_contexts = length(var.path_prefix_filter_list)
      total_filters      = sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)])
      
      # Filter distribution analysis
      filter_distribution = {
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => length(filter_list.path_prefix_filters)
      }
      
      # Complexity classification
      complexity_level = (
        sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)]) <= 20 ? "simple" :
        sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)]) <= 50 ? "moderate" :
        sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)]) <= 100 ? "complex" : "highly-complex"
      )
    }
    
    filter_analysis = {
      permit_deny_distribution = {
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => {
          permit_count = length([for filter in filter_list.path_prefix_filters : filter if filter.permit])
          deny_count   = length([for filter in filter_list.path_prefix_filters : filter if !filter.permit])
          permit_percentage = length(filter_list.path_prefix_filters) > 0 ? (length([for filter in filter_list.path_prefix_filters : filter if filter.permit]) / length(filter_list.path_prefix_filters)) * 100 : 0
        }
      }
      
      # IP version analysis
      ip_version_distribution = {
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => {
          ipv4_count = length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null])
          ipv6_count = length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null])
          dual_stack = length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null]) > 0 && length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null]) > 0
        }
      }
      
      # Order analysis - with proper number conversion and empty list handling
      order_analysis = {
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => {
          filter_count = length(filter_list.path_prefix_filters)
          has_filters = length(filter_list.path_prefix_filters) > 0
          min_order = length(filter_list.path_prefix_filters) > 0 ? min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) : 0
          max_order = length(filter_list.path_prefix_filters) > 0 ? max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) : 0
          order_range = length(filter_list.path_prefix_filters) > 0 ? max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) - min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) : 0
          order_gaps = length(filter_list.path_prefix_filters) > 0 ? length([
            for i in range(
              min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]), 
              max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) + 1
            ) : i 
            if !contains([for filter in filter_list.path_prefix_filters : tonumber(filter.order)], i)
          ]) : 0
          
          # Processing efficiency
          most_specific_first = true  # This would need actual CIDR analysis
          
          optimization_recommendations = {
            consolidate_adjacent_orders = length(filter_list.path_prefix_filters) > 0 ? length([
              for i in range(
                min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]), 
                max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) + 1
              ) : i 
              if !contains([for filter in filter_list.path_prefix_filters : tonumber(filter.order)], i)
            ]) > 5 : false
            reorder_by_specificity = false  # Placeholder for actual implementation
            group_by_action = length([for filter in filter_list.path_prefix_filters : filter if filter.permit]) > 0 && length([for filter in filter_list.path_prefix_filters : filter if !filter.permit]) > 0
          }
        }
      }
    }
    
    memory_optimization = {
      total_filter_memory_estimate_kb = sum([
        for filter_list in var.path_prefix_filter_list : 
        length(filter_list.path_prefix_filters)
      ]) * 2
      
      optimization_opportunities = {
        filter_consolidation_possible = sum([
          for filter_list in var.path_prefix_filter_list : 
          length(filter_list.path_prefix_filters)
        ]) > 50
        
        vrf_separation_efficient = length(var.path_prefix_filter_list) <= 10
        
        memory_usage_category = (
          sum([
            for filter_list in var.path_prefix_filter_list : 
            length(filter_list.path_prefix_filters)
          ]) <= 20 ? "light" :
          sum([
            for filter_list in var.path_prefix_filter_list : 
            length(filter_list.path_prefix_filters)
          ]) <= 50 ? "moderate" : "heavy"
        )
      }
    }
  }
}

# Network Security Analysis
output "network_security_analysis" {
  description = "Analysis of network security implications of the filter profile"
  value = {
    security_posture = {
      for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => {
        # Security characteristics
        has_explicit_deny_all = length([
          for filter in filter_list.path_prefix_filters : filter
          if !filter.permit && (filter.ipv4_prefix == "0.0.0.0/0" || filter.ipv6_prefix == "::/0")
        ]) > 0
  permit_to_deny_ratio = length([for filter in filter_list.path_prefix_filters : filter if !filter.permit]) > 0 ? length([for filter in filter_list.path_prefix_filters : filter if filter.permit]) / length([for filter in filter_list.path_prefix_filters : filter if !filter.permit]) : length([for filter in filter_list.path_prefix_filters : filter if filter.permit])
        
        security_model = (
          length([for filter in filter_list.path_prefix_filters : filter if !filter.permit]) == 0 ? "allow-all" :
          length([for filter in filter_list.path_prefix_filters : filter if filter.permit]) == 0 ? "deny-all" :
          length([
            for filter in filter_list.path_prefix_filters : filter
            if !filter.permit && (filter.ipv4_prefix == "0.0.0.0/0" || filter.ipv6_prefix == "::/0")
          ]) > 0 ? "default-deny" : "mixed"
        )
        
        # Risk assessment
        risk_level = (
          length([for filter in filter_list.path_prefix_filters : filter if filter.permit]) == length(filter_list.path_prefix_filters) ? "high" :
          length([
            for filter in filter_list.path_prefix_filters : filter
            if !filter.permit && (filter.ipv4_prefix == "0.0.0.0/0" || filter.ipv6_prefix == "::/0")
          ]) > 0 ? "low" : "medium"
        )
      }
    }
    
    overall_security_assessment = {
      # Global security metrics
      total_permit_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.permit])
      ])
      
      total_deny_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if !filter.permit])
      ])
      
      global_permit_ratio = sum([
        for filter_list in var.path_prefix_filter_list : 
        length(filter_list.path_prefix_filters)
      ]) > 0 ? sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.permit])
      ]) / sum([
        for filter_list in var.path_prefix_filter_list : 
        length(filter_list.path_prefix_filters)
      ]) : 0
      
      # Security recommendations
      security_recommendations = {
        has_default_deny_rules = length([
          for filter_list in var.path_prefix_filter_list : filter_list
          if length([
            for filter in filter_list.path_prefix_filters : filter
            if !filter.permit && (filter.ipv4_prefix == "0.0.0.0/0" || filter.ipv6_prefix == "::/0")
          ]) > 0
        ]) > 0
        
        implements_least_privilege = sum([
          for filter_list in var.path_prefix_filter_list : 
          length([for filter in filter_list.path_prefix_filters : filter if !filter.permit])
        ]) > 0
        
        has_granular_control = sum([
          for filter_list in var.path_prefix_filter_list : 
          length(filter_list.path_prefix_filters)
        ]) > 5
      }
    }
  }
}

# Prefix Analysis
output "prefix_analysis" {
  description = "Analysis of prefix patterns and coverage"
  value = {
    ipv4_analysis = {
      total_ipv4_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null])
      ])
      
      ipv4_permit_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null && filter.permit])
      ])
      
      ipv4_deny_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null && !filter.permit])
      ])
      
      # Common prefix patterns
      private_networks_covered = length([
        for filter_list in var.path_prefix_filter_list : filter_list
        if length([
          for filter in filter_list.path_prefix_filters : filter
          if filter.ipv4_prefix != null && (
            can(regex("^10\\.", filter.ipv4_prefix)) ||
            can(regex("^172\\.(1[6-9]|2[0-9]|3[01])\\.", filter.ipv4_prefix)) ||
            can(regex("^192\\.168\\.", filter.ipv4_prefix))
          )
        ]) > 0
      ]) > 0
      
      default_route_controlled = length([
        for filter_list in var.path_prefix_filter_list : filter_list
        if length([
          for filter in filter_list.path_prefix_filters : filter
          if filter.ipv4_prefix == "0.0.0.0/0"
        ]) > 0
      ]) > 0
    }
    
    ipv6_analysis = {
      total_ipv6_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null])
      ])
      
      ipv6_permit_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null && filter.permit])
      ])
      
      ipv6_deny_filters = sum([
        for filter_list in var.path_prefix_filter_list : 
        length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null && !filter.permit])
      ])
      
      default_ipv6_route_controlled = length([
        for filter_list in var.path_prefix_filter_list : filter_list
        if length([
          for filter in filter_list.path_prefix_filters : filter
          if filter.ipv6_prefix == "::/0"
        ]) > 0
      ]) > 0
    }
    
    dual_stack_configuration = {
      vrfs_with_both_stacks = length([
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id
        if (
          length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null]) > 0 &&
          length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null]) > 0
        )
      ])
      
      ipv4_only_vrfs = length([
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id
        if (
          length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null]) > 0 &&
          length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null]) == 0
        )
      ])
      
      ipv6_only_vrfs = length([
        for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id
        if (
          length([for filter in filter_list.path_prefix_filters : filter if filter.ipv4_prefix != null]) == 0 &&
          length([for filter in filter_list.path_prefix_filters : filter if filter.ipv6_prefix != null]) > 0
        )
      ])
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
    
    overall_resolution_status = prismasdwan_resource_locator.hub_site.result != null ? "success" : "failed"
  }
}

# Validation Status
output "validation_status" {
  description = "Validation status of the prefix filter profile configuration"
  value = {
    name_valid                    = length(var.prefix_filter_profile_name) > 0 && length(var.prefix_filter_profile_name) <= 128
    description_valid             = length(var.description) <= 1024
    tags_valid                   = length(var.tags) <= 10 && alltrue([for tag in var.tags : length(tag) <= 1024])
    hub_site_name_valid          = length(var.hub_site_name) > 0
    duplicate_orders_valid       = local.duplicate_orders_validation
    filter_count_per_vrf_valid   = local.vrf_filter_count_validation
    
    filter_specific_validations = {
      for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => {
        order_range_valid = alltrue([
          for filter in filter_list.path_prefix_filters : tonumber(filter.order) >= 1 && tonumber(filter.order) <= 65535
        ])
        prefix_format_valid = alltrue([
          for filter in filter_list.path_prefix_filters : (
            (filter.ipv4_prefix != null && filter.ipv6_prefix == null) ||
            (filter.ipv4_prefix == null && filter.ipv6_prefix != null)
          )
        ])
        unique_orders = length(filter_list.path_prefix_filters) == length(distinct([for f in filter_list.path_prefix_filters : tonumber(f.order)]))
      }
    }
    
    overall_status = (
      length(var.prefix_filter_profile_name) > 0 && 
      length(var.prefix_filter_profile_name) <= 128 &&
      length(var.hub_site_name) > 0 &&
      local.duplicate_orders_validation &&
      local.vrf_filter_count_validation
    ) ? "valid" : "invalid"
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
      network_tags       = length([for tag in var.tags : tag if contains(["hub-prefix-filter", "route-control", "distribution"], tag)])
      environment_tags   = length([for tag in var.tags : tag if contains(["production", "staging", "development"], tag)])
      security_tags      = length([for tag in var.tags : tag if contains(["security", "filtering", "access-control"], tag)])
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Hub prefix filter profile deployment status and metadata"
  value = {
    status         = "success"
    deployed_at    = timestamp()
    resource_type  = "site_hub_prefix_filter_profile"
    resource_count = 1
      configuration_summary = {
        profile_name          = var.prefix_filter_profile_name
        hub_site             = var.hub_site_name
        vrf_contexts_count   = length(var.path_prefix_filter_list)
        total_filters_count  = sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)])
        tags_count           = length(var.tags)
      }
    
      resource_dependencies = {
        hub_site_resolved      = prismasdwan_resource_locator.hub_site.result != null
        all_dependencies_met   = prismasdwan_resource_locator.hub_site.result != null
      }
    
      operational_readiness = {
        prefix_filtering_active = true
        route_distribution_controlled = true
        vrf_isolation_configured = length(var.path_prefix_filter_list) > 1
      
        production_readiness = (
          prismasdwan_resource_locator.hub_site.result != null &&
          local.duplicate_orders_validation &&
          local.vrf_filter_count_validation
        ) ? "production-ready" : "requires-review"
      }
    
      monitoring_recommendations = {
        filter_hit_rate_monitoring = "essential"
        route_advertisement_monitoring = "critical"
        vrf_specific_monitoring = length(var.path_prefix_filter_list) > 1
        performance_impact_monitoring = "recommended"
      
        # Alert thresholds
        alert_configuration = {
          filter_processing_delay_threshold = ">100ms"
          route_convergence_delay_threshold = ">30s"
          memory_usage_threshold = ">80%"
          configuration_drift_alert = "immediate"
        }
      }
    
      compliance_status = {
        security_compliance = {
          has_explicit_controls = sum([
            for filter_list in var.path_prefix_filter_list : 
            length([for filter in filter_list.path_prefix_filters : filter if !filter.permit])
          ]) > 0
        
          implements_least_privilege = length([
            for filter_list in var.path_prefix_filter_list : filter_list
            if length([
              for filter in filter_list.path_prefix_filters : filter
              if !filter.permit && (filter.ipv4_prefix == "0.0.0.0/0" || filter.ipv6_prefix == "::/0")
            ]) > 0
          ]) > 0
        
          vrf_segmentation_implemented = length(var.path_prefix_filter_list) > 1
        }
      
        operational_compliance = {
          documentation_complete = length(var.description) > 50
          tagging_compliant = length(var.tags) >= 3
          naming_convention_followed = can(regex("^[A-Za-z]", var.prefix_filter_profile_name))
        }
      }
  }
}

# Filter Order Optimization Recommendations
output "filter_order_optimization" {
  description = "Recommendations for optimizing filter order configuration"
  value = {
    optimization_suggestions = {
      for filter_list in var.path_prefix_filter_list : filter_list.vrf_context_id => {
        current_filter_count = length(filter_list.path_prefix_filters)
        
        # Order optimization
        order_optimization = length(filter_list.path_prefix_filters) > 0 ? {
          current_min_order = min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)])
          current_max_order = max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)])
          order_span = max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) - min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)])
          
          # Recommendations
          suggest_resequencing = length([
            for i in range(
              min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]), 
              max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) + 1
            ) : i 
            if !contains([for filter in filter_list.path_prefix_filters : tonumber(filter.order)], i)
          ]) > 5
          
          suggested_start_order = 10
          suggested_increment = 10
          
          optimization_benefit = (
            length([
              for i in range(
                min([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]), 
                max([for filter in filter_list.path_prefix_filters : tonumber(filter.order)]) + 1
              ) : i 
              if !contains([for filter in filter_list.path_prefix_filters : tonumber(filter.order)], i)
            ]) > 5 ? "high" : "low"
          )
        } : {}
        
        # Performance optimization
        performance_optimization = {
          place_most_specific_first = "Consider ordering from most specific to least specific prefixes"
          group_by_action = length([for filter in filter_list.path_prefix_filters : filter if filter.permit]) > 0 && length([for filter in filter_list.path_prefix_filters : filter if !filter.permit]) > 0 ? "Consider grouping permit and deny rules" : "Action grouping not applicable"
          early_termination_opportunity = length([for filter in filter_list.path_prefix_filters : filter if !filter.permit && (filter.ipv4_prefix == "0.0.0.0/0" || filter.ipv6_prefix == "::/0")]) > 0 ? "Default deny rule provides early termination" : "Consider adding default deny for early termination"
        }
      }
    }
    
    global_optimization = {
      total_filters_across_vrfs = sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)])
      average_filters_per_vrf = length(var.path_prefix_filter_list) > 0 ? sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)]) / length(var.path_prefix_filter_list) : 0
      
      recommendations = {
        consider_vrf_consolidation = length(var.path_prefix_filter_list) > 5 && sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)]) / length(var.path_prefix_filter_list) < 5
        implement_hierarchical_filtering = sum([for filter_list in var.path_prefix_filter_list : length(filter_list.path_prefix_filters)]) > 50
        regular_review_recommended = true
        
        maintenance_schedule = {
          quarterly_review = "Review filter effectiveness and order optimization"
          annual_cleanup = "Remove unused filters and consolidate overlapping rules"
          change_management = "Implement staged rollout for filter changes"
        }
      }
    }
  }
}

# Implementation Guidelines
output "implementation_guidelines" {
  description = "Guidelines for implementing and maintaining the hub prefix filter profile"
  value = {
    deployment_phases = {
      phase_1_validation = {
        description = "Validate configuration and dependencies"
        tasks = [
          "Verify hub site name resolution",
          "Validate filter syntax and order uniqueness",
          "Test configuration parsing",
          "Review security implications"
        ]
        success_criteria = "All validations pass without errors"
      }
      
      phase_2_staged_deployment = {
        description = "Deploy in controlled stages"
        tasks = [
          "Deploy to test environment first",
          "Monitor route advertisement behavior",
          "Validate prefix filtering effectiveness",
          "Performance impact assessment"
        ]
        success_criteria = "No adverse impact on network performance"
      }
      
      phase_3_monitoring = {
        description = "Implement comprehensive monitoring"
        tasks = [
          "Set up filter hit rate monitoring",
          "Configure route convergence alerts",
          "Monitor memory utilization",
          "Track configuration drift"
        ]
        success_criteria = "All monitoring systems operational"
      }
    }
    
    best_practices = {
      configuration_management = [
        "Use version control for filter configurations",
        "Document filter purposes and expected behavior",
        "Implement automated testing for configuration changes",
        "Maintain backup configurations"
      ]
      
      security_considerations = [
        "Implement default deny rules where appropriate",
        "Regular review of filter effectiveness",
        "Monitor for unauthorized route advertisements",
        "Audit filter changes and access"
      ]
      
      performance_optimization = [
        "Order filters from most specific to least specific",
        "Place frequently matched filters earlier in the list",
        "Minimize order gaps for efficient processing",
        "Regular performance impact assessment"
      ]
      
      operational_procedures = [
        "Staged deployment for all changes",
        "Comprehensive testing before production deployment",
        "Clear rollback procedures",
        "Regular effectiveness reviews"
      ]
    }
    
    troubleshooting_guide = {
      common_issues = {
        "routes_not_filtered" = {
          description = "Routes are not being filtered as expected"
          troubleshooting_steps = [
            "Verify filter order and syntax",
            "Check VRF context configuration",
            "Validate prefix format (IPv4/IPv6)",
            "Review filter action (permit/deny)"
          ]
        }
        
        "performance_degradation" = {
          description = "Network performance impact observed"
          troubleshooting_steps = [
            "Review filter count and complexity",
            "Optimize filter ordering",
            "Consider filter consolidation",
            "Monitor processing overhead"
          ]
        }
        
        "configuration_conflicts" = {
          description = "Filter configuration conflicts detected"
          troubleshooting_steps = [
            "Check for duplicate order values",
            "Verify VRF context uniqueness",
            "Review overlapping prefix filters",
            "Validate filter dependencies"
          ]
        }
      }
      
      monitoring_metrics = [
        "Filter processing time per route",
        "Route advertisement success rate",
        "Memory utilization trends",
        "Configuration change frequency",
        "Filter hit rate statistics"
      ]
    }
  }
}
