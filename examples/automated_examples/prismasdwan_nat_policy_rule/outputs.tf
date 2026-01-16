# NAT Policy Rule Details
output "nat_policy_rule_details" {
  description = "Details of the created NAT Policy Rule"
  value = {
    id                      = prismasdwan_nat_policy_rule.nat_policy_rule_full.id
    name                    = prismasdwan_nat_policy_rule.nat_policy_rule_full.name
    description             = prismasdwan_nat_policy_rule.nat_policy_rule_full.description
    tags                    = prismasdwan_nat_policy_rule.nat_policy_rule_full.tags
    enabled                 = prismasdwan_nat_policy_rule.nat_policy_rule_full.enabled
    disabled                = prismasdwan_nat_policy_rule.nat_policy_rule_full.disabled
    disabled_reason         = prismasdwan_nat_policy_rule.nat_policy_rule_full.disabled_reason
    inactive                = prismasdwan_nat_policy_rule.nat_policy_rule_full.inactive
    inactive_reason         = prismasdwan_nat_policy_rule.nat_policy_rule_full.inactive_reason
    actions                 = prismasdwan_nat_policy_rule.nat_policy_rule_full.actions
    protocol                = prismasdwan_nat_policy_rule.nat_policy_rule_full.protocol
    source_ports            = prismasdwan_nat_policy_rule.nat_policy_rule_full.source_ports
    destination_ports       = prismasdwan_nat_policy_rule.nat_policy_rule_full.destination_ports
    source_zone_id          = prismasdwan_nat_policy_rule.nat_policy_rule_full.source_zone_id
    destination_zone_id     = prismasdwan_nat_policy_rule.nat_policy_rule_full.destination_zone_id
    source_prefixes_id      = prismasdwan_nat_policy_rule.nat_policy_rule_full.source_prefixes_id
    destination_prefixes_id = prismasdwan_nat_policy_rule.nat_policy_rule_full.destination_prefixes_id
    x_etag                  = prismasdwan_nat_policy_rule.nat_policy_rule_full.x_etag
    x_schema                = prismasdwan_nat_policy_rule.nat_policy_rule_full.x_schema
  }
}

# Individual outputs for easy access
output "nat_policy_rule_id" {
  description = "ID of the NAT Policy Rule"
  value       = prismasdwan_nat_policy_rule.nat_policy_rule_full.id
}

output "nat_policy_rule_name" {
  description = "Name of the NAT Policy Rule"
  value       = prismasdwan_nat_policy_rule.nat_policy_rule_full.name
}

output "nat_policy_set_id" {
  description = "ID of the parent NAT policy set"
  value       = prismasdwan_resource_locator.nat_policy_set.result
}

output "rule_enabled" {
  description = "Whether the rule is enabled"
  value       = prismasdwan_nat_policy_rule.nat_policy_rule_full.enabled
}

output "nat_actions" {
  description = "NAT actions configured for the rule"
  value       = prismasdwan_nat_policy_rule.nat_policy_rule_full.actions
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    nat_policy_set_resolution = {
      name = var.nat_policy_set_name
      resolved_id = prismasdwan_resource_locator.nat_policy_set.result
      resolution_ok = prismasdwan_resource_locator.nat_policy_set.result != null
    }
    
    zone_resolutions = {
      source_zone = var.source_zone_name != null ? {
        name = var.source_zone_name
        resolved_id = length(prismasdwan_resource_locator.source_zone) > 0 ? prismasdwan_resource_locator.source_zone[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.source_zone) > 0 ? prismasdwan_resource_locator.source_zone[0].result != null : false
      } : null
      
      destination_zone = var.destination_zone_name != null ? {
        name = var.destination_zone_name
        resolved_id = length(prismasdwan_resource_locator.destination_zone) > 0 ? prismasdwan_resource_locator.destination_zone[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.destination_zone) > 0 ? prismasdwan_resource_locator.destination_zone[0].result != null : false
      } : null
    }
    
    prefix_resolutions = {
      source_prefixes = var.source_prefixes_name != null ? {
        name = var.source_prefixes_name
        resolved_id = length(prismasdwan_resource_locator.source_prefixes) > 0 ? prismasdwan_resource_locator.source_prefixes[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.source_prefixes) > 0 ? prismasdwan_resource_locator.source_prefixes[0].result != null : true
      } : null
      
      destination_prefixes = var.destination_prefixes_name != null ? {
        name = var.destination_prefixes_name
        resolved_id = length(prismasdwan_resource_locator.destination_prefixes) > 0 ? prismasdwan_resource_locator.destination_prefixes[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.destination_prefixes) > 0 ? prismasdwan_resource_locator.destination_prefixes[0].result != null : true
      } : null
    }
    
    nat_pool_resolutions = [
      for i, name in var.nat_pool_names : {
        index = i
        pool_name = name
        resolved_id = length(prismasdwan_resource_locator.nat_pools) > i ? prismasdwan_resource_locator.nat_pools[i].result : null
        resolution_ok = length(prismasdwan_resource_locator.nat_pools) > i ? prismasdwan_resource_locator.nat_pools[i].result != null : false
      }
    ]
    
    overall_resolution_status = (
      prismasdwan_resource_locator.nat_policy_set.result != null &&
      (var.source_zone_name == null || (length(prismasdwan_resource_locator.source_zone) > 0 ? prismasdwan_resource_locator.source_zone[0].result != null : false)) &&
      (var.destination_zone_name == null || (length(prismasdwan_resource_locator.destination_zone) > 0 ? prismasdwan_resource_locator.destination_zone[0].result != null : false)) &&
      (length(prismasdwan_resource_locator.source_prefixes) == 0 || prismasdwan_resource_locator.source_prefixes[0].result != null) &&
      (length(prismasdwan_resource_locator.destination_prefixes) == 0 || prismasdwan_resource_locator.destination_prefixes[0].result != null) &&
      alltrue([for locator in prismasdwan_resource_locator.nat_pools : locator.result != null])
    ) ? "success" : "failed"
  }
}

# NAT Configuration Analysis
output "nat_configuration_analysis" {
  description = "Analysis of NAT policy rule configuration"
  value = {
    nat_action_analysis = {
      action_count = length(var.nat_actions)
      action_types = [for action in var.nat_actions : action.type]
      has_source_nat = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "SOURCE_NAT_STATIC"], action.type)])
      has_destination_nat = anytrue([for action in var.nat_actions : contains(["DESTINATION_NAT_DYNAMIC", "DESTINATION_NAT_STATIC"], action.type)])
      has_no_nat = anytrue([for action in var.nat_actions : action.type == "NO_NAT"])
      has_alg_disable = anytrue([for action in var.nat_actions : action.type == "ALG_DISABLE"])
      uses_dynamic_nat = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)])
      uses_static_nat = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_STATIC", "DESTINATION_NAT_STATIC"], action.type)])
      requires_nat_pools = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)])
    }
    
    traffic_classification = {
      has_protocol_filter = var.protocol != null
      protocol_name = var.protocol != null ? (
        var.protocol == 1 ? "ICMP" : (
          var.protocol == 6 ? "TCP" : (
            var.protocol == 17 ? "UDP" : "Protocol-${var.protocol}"
          )
        )
      ) : null
      has_source_ports = length(var.source_ports) > 0
      has_destination_ports = length(var.destination_ports) > 0
      source_port_count = length(var.source_ports)
      destination_port_count = length(var.destination_ports)
      has_zone_filtering = var.source_zone_name != null && var.destination_zone_name != null
      has_prefix_filtering = var.source_prefixes_name != null || var.destination_prefixes_name != null
    }
    
    rule_characteristics = {
      is_operational = var.enabled && !var.disabled && !var.inactive
      rule_state = var.enabled ? (
        var.disabled ? "disabled" : (
          var.inactive ? "inactive" : "active"
        )
      ) : "not_enabled"
      has_disable_reason = var.disabled_reason != null
      has_inactive_reason = var.inactive_reason != null
      is_comprehensive = (
        var.protocol != null &&
        (length(var.source_ports) > 0 || length(var.destination_ports) > 0) &&
        var.source_zone_name != null &&
        var.destination_zone_name != null
      )
    }
  }
}

# Traffic Flow Analysis
output "traffic_flow_analysis" {
  description = "Analysis of traffic flow and NAT behavior"
  value = {
    flow_direction = {
      source_zone = var.source_zone_name
      destination_zone = var.destination_zone_name
      flow_type = (
        var.source_zone_name != null && var.destination_zone_name != null ? (
          var.source_zone_name == "LAN" && var.destination_zone_name == "WAN" ? "outbound" : (
            var.source_zone_name == "WAN" && var.destination_zone_name == "LAN" ? "inbound" : "inter-zone"
          )
        ) : "unknown"
      )
      is_internet_bound = var.destination_zone_name != null ? contains(["WAN", "Internet", "External"], var.destination_zone_name) : false
      is_internal_traffic = (
        var.source_zone_name != null && var.destination_zone_name != null ? (
          contains(["LAN", "Internal", "Private"], var.source_zone_name) && 
          contains(["LAN", "Internal", "Private"], var.destination_zone_name)
        ) : false
      )

    }
    
    nat_behavior_prediction = {
      primary_action = length(var.nat_actions) > 0 ? var.nat_actions[0].type : null
      translation_type = length(var.nat_actions) > 0 ? (
        contains(["SOURCE_NAT_DYNAMIC", "SOURCE_NAT_STATIC"], var.nat_actions[0].type) ? "source_translation" : (
          contains(["DESTINATION_NAT_DYNAMIC", "DESTINATION_NAT_STATIC"], var.nat_actions[0].type) ? "destination_translation" : (
            var.nat_actions[0].type == "NO_NAT" ? "no_translation" : "special_handling"
          )
        )
      ) : null
      
      ip_allocation = length(var.nat_actions) > 0 ? (
        contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], var.nat_actions[0].type) ? "dynamic" : (
          contains(["SOURCE_NAT_STATIC", "DESTINATION_NAT_STATIC"], var.nat_actions[0].type) ? "static" : "none"
        )
      ) : null
      
      requires_pool = length(var.nat_actions) > 0 ? contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], var.nat_actions[0].type) : false
      pool_dependency = length(var.nat_pool_names) > 0 ? "configured" : (
        anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)]) ? "required_but_missing" : "not_required"
      )
    }
    
    port_behavior = {
      preserves_source_ports = !anytrue([for action in var.nat_actions : action.port != null])
      has_port_translation = anytrue([for action in var.nat_actions : action.port != null])
      port_translation_ports = [for action in var.nat_actions : action.port if action.port != null]
      source_port_ranges = var.source_ports
      destination_port_ranges = var.destination_ports
      affects_well_known_ports = anytrue([
        for port_range in var.destination_ports : 
        (port_range.from <= 1024 && port_range.to >= 1) || 
        (port_range.from <= 80 && port_range.to >= 80) ||
        (port_range.from <= 443 && port_range.to >= 443) ||
        (port_range.from <= 53 && port_range.to >= 53)
      ])
    }
    
    alg_considerations = {
      has_alg_disable = anytrue([for action in var.nat_actions : action.type == "ALG_DISABLE"])
      disabled_protocols = flatten([for action in var.nat_actions : action.protocols if action.type == "ALG_DISABLE"])
      affects_voice = anytrue([
        for action in var.nat_actions : 
        action.type == "ALG_DISABLE" && action.protocols != null && contains(action.protocols, "sip")
      ])
      affects_file_transfer = anytrue([
        for action in var.nat_actions : 
        action.type == "ALG_DISABLE" && action.protocols != null && (contains(action.protocols, "ftp") || contains(action.protocols, "tftp"))
      ])
      affects_vpn = anytrue([
        for action in var.nat_actions : 
        action.type == "ALG_DISABLE" && action.protocols != null && contains(action.protocols, "pptp")
      ])
    }
  }
}

# Performance and Scale Metrics
output "performance_metrics" {
  description = "Performance and scalability considerations"
  value = {
    processing_complexity = {
      action_count = length(var.nat_actions)
      port_range_count = length(var.source_ports) + length(var.destination_ports)
      nat_pool_dependencies = length(var.nat_pool_names)
      total_classification_criteria = (
        (var.protocol != null ? 1 : 0) +
        length(var.source_ports) +
        length(var.destination_ports) +
        (var.source_prefixes_name != null ? 1 : 0) +
        (var.destination_prefixes_name != null ? 1 : 0)
      )
      complexity_rating = (
        length(var.nat_actions) + 
        length(var.source_ports) + 
        length(var.destination_ports) + 
        length(var.nat_pool_names)
      ) <= 5 ? "low" : (
        (length(var.nat_actions) + length(var.source_ports) + length(var.destination_ports) + length(var.nat_pool_names)) <= 15 ? "medium" : "high"
      )
    }
    
    resource_utilization = {
      action_utilization = "${length(var.nat_actions)}/4 (${(length(var.nat_actions) / 4.0) * 100}%)"
      source_port_utilization = "${length(var.source_ports)}/16 (${(length(var.source_ports) / 16.0) * 100}%)"
      destination_port_utilization = "${length(var.destination_ports)}/16 (${(length(var.destination_ports) / 16.0) * 100}%)"
      near_limits = [
        for limit_check in [
          {name = "nat_actions", current = length(var.nat_actions), max = 4},
          {name = "source_ports", current = length(var.source_ports), max = 16},
          {name = "destination_ports", current = length(var.destination_ports), max = 16}
        ] : limit_check.name if (limit_check.current / limit_check.max) > 0.8
      ]
    }
    
    operational_impact = {
      session_state_tracking = anytrue([for action in var.nat_actions : action.type != "NO_NAT"])
      requires_pool_management = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)])
      affects_logging = var.enabled && !var.disabled && !var.inactive
      connection_persistence = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_STATIC", "DESTINATION_NAT_STATIC"], action.type)])
      scalability_impact = length(var.nat_actions) > 2 ? "high" : (length(var.nat_actions) > 1 ? "medium" : "low")
    }
  }
}

# Configuration Validation
output "validation_summary" {
  description = "Configuration validation results"
  value = {
    required_fields_validation = {
      has_rule_name = var.nat_policy_rule_name != ""
      has_policy_set_name = var.nat_policy_set_name != ""
      has_nat_actions = length(var.nat_actions) > 0
      has_source_zone = var.source_zone_name != null && var.source_zone_name != ""
      has_destination_zone = var.destination_zone_name != null && var.destination_zone_name != ""
      all_required_present = (
        var.nat_policy_rule_name != "" &&
        var.nat_policy_set_name != "" &&
        length(var.nat_actions) > 0 &&
        var.source_zone_name != null && var.source_zone_name != "" &&
        var.destination_zone_name != null && var.destination_zone_name != ""
      )
    }
    
    constraint_compliance = {
      name_length_ok = length(var.nat_policy_rule_name) <= 128
      description_length_ok = length(var.description) <= 256
      tag_count_ok = length(var.tags) <= 10
      action_count_ok = length(var.nat_actions) >= 1 && length(var.nat_actions) <= 4
      protocol_range_ok = var.protocol == null || (var.protocol >= 1 && var.protocol <= 255)
      source_port_count_ok = length(var.source_ports) <= 16
      destination_port_count_ok = length(var.destination_ports) <= 16
      disabled_reason_length_ok = var.disabled_reason == null || length(var.disabled_reason) <= 5000
      inactive_reason_length_ok = var.inactive_reason == null || length(var.inactive_reason) <= 5000
      
      all_constraints_met = (
        length(var.nat_policy_rule_name) <= 128 &&
        length(var.description) <= 256 &&
        length(var.tags) <= 10 &&
        length(var.nat_actions) >= 1 && length(var.nat_actions) <= 4 &&
        (var.protocol == null || (var.protocol >= 1 && var.protocol <= 255)) &&
        length(var.source_ports) <= 16 &&
        length(var.destination_ports) <= 16
      )
    }
    
    logical_consistency = {
      enabled_disabled_conflict = var.enabled && var.disabled
      has_pool_for_dynamic_nat = (
        !anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)]) ||
        length(var.nat_pool_names) > 0
      )
      port_ranges_valid = alltrue([
        for port_range in concat(var.source_ports, var.destination_ports) :
        port_range.from <= port_range.to
      ])
      alg_protocols_valid = alltrue([
        for action in var.nat_actions :
        action.type != "ALG_DISABLE" || (
          action.protocols != null && 
          alltrue([for protocol in action.protocols : contains(["sip", "ftp", "tftp", "pptp"], protocol)])
        )
      ])
      
      configuration_consistent = (
        !(var.enabled && var.disabled) &&
        alltrue([for port_range in concat(var.source_ports, var.destination_ports) : port_range.from <= port_range.to]) &&
        (!anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)]) || length(var.nat_pool_names) > 0)
      )
    }
    
    deployment_readiness = {
      is_functional = (
        var.enabled &&
        !var.disabled &&
        !var.inactive &&
        length(var.nat_actions) > 0 &&
        var.source_zone_name != "" &&
        var.destination_zone_name != ""
      )
      has_classification = (
        var.protocol != null ||
        length(var.source_ports) > 0 ||
        length(var.destination_ports) > 0 ||
        var.source_prefixes_name != null ||
        var.destination_prefixes_name != null
      )
      dependency_requirements_met = (
        (!anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)]) || length(var.nat_pool_names) > 0)
      )
      ready_for_production = (
        var.enabled &&
        !var.disabled &&
        !var.inactive &&
        length(var.nat_actions) > 0 &&
        var.source_zone_name != "" &&
        var.destination_zone_name != "" &&
        (var.protocol != null || length(var.source_ports) > 0 || length(var.destination_ports) > 0)
      )
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "NAT Policy Rule deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "nat_policy_rule"
    resource_count = 1
    parent_policy_set = var.nat_policy_set_name
    
    configuration_summary = {
      rule_name = var.nat_policy_rule_name
      enabled = var.enabled
      action_count = length(var.nat_actions)
      primary_action = length(var.nat_actions) > 0 ? var.nat_actions[0].type : null
      has_traffic_classification = (
        var.protocol != null ||
        length(var.source_ports) > 0 ||
        length(var.destination_ports) > 0 ||
        var.source_prefixes_name != null ||
        var.destination_prefixes_name != null
      )
      has_zone_filtering = var.source_zone_name != null && var.destination_zone_name != null
      requires_nat_pools = anytrue([for action in var.nat_actions : contains(["SOURCE_NAT_DYNAMIC", "DESTINATION_NAT_DYNAMIC"], action.type)])
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of NAT Policy Rule resources and dependencies"
  value = {
    primary_resource = {
      type = "prismasdwan_nat_policy_rule"
      id = prismasdwan_nat_policy_rule.nat_policy_rule_full.id
      name = var.nat_policy_rule_name
      parent_policy_set = var.nat_policy_set_name
    }
    
    dependencies = {
      nat_policy_set = {
        name = var.nat_policy_set_name
        id = prismasdwan_resource_locator.nat_policy_set.result
      }
      zones = {
        source_zone = var.source_zone_name != null ? {
          name = var.source_zone_name
          id = length(prismasdwan_resource_locator.source_zone) > 0 ? prismasdwan_resource_locator.source_zone[0].result : null
        } : null
        destination_zone = var.destination_zone_name != null ? {
          name = var.destination_zone_name
          id = length(prismasdwan_resource_locator.destination_zone) > 0 ? prismasdwan_resource_locator.destination_zone[0].result : null
        } : null
      }
      prefixes = {
        source_prefixes = var.source_prefixes_name != null ? {
          name = var.source_prefixes_name
          id = length(prismasdwan_resource_locator.source_prefixes) > 0 ? prismasdwan_resource_locator.source_prefixes[0].result : null
        } : null
        destination_prefixes = var.destination_prefixes_name != null ? {
          name = var.destination_prefixes_name
          id = length(prismasdwan_resource_locator.destination_prefixes) > 0 ? prismasdwan_resource_locator.destination_prefixes[0].result : null
        } : null
      }
      nat_pools = [
        for i, name in var.nat_pool_names : {
          name = name
          id = length(prismasdwan_resource_locator.nat_pools) > i ? prismasdwan_resource_locator.nat_pools[i].result : null
        }
      ]
    }
    
    configuration_health = {
      has_parent_policy_set = prismasdwan_resource_locator.nat_policy_set.result != null
      all_zones_resolved = (
        (var.source_zone_name == null || (length(prismasdwan_resource_locator.source_zone) > 0 ? prismasdwan_resource_locator.source_zone[0].result != null : false)) &&
        (var.destination_zone_name == null || (length(prismasdwan_resource_locator.destination_zone) > 0 ? prismasdwan_resource_locator.destination_zone[0].result != null : false))
      )
      all_prefixes_resolved = (
        (length(prismasdwan_resource_locator.source_prefixes) == 0 || prismasdwan_resource_locator.source_prefixes[0].result != null) &&
        (length(prismasdwan_resource_locator.destination_prefixes) == 0 || prismasdwan_resource_locator.destination_prefixes[0].result != null)
      )
      all_nat_pools_resolved = alltrue([for locator in prismasdwan_resource_locator.nat_pools : locator.result != null])
      has_traffic_classification = (
        var.protocol != null ||
        length(var.source_ports) > 0 ||
        length(var.destination_ports) > 0 ||
        var.source_prefixes_name != null ||
        var.destination_prefixes_name != null
      )
      is_functional_rule = (
        prismasdwan_resource_locator.nat_policy_set.result != null &&
        var.enabled &&
        !var.disabled &&
        !var.inactive &&
        length(var.nat_actions) > 0
      )
    }
    
    scale_metrics = {
      nat_actions_count = length(var.nat_actions)
      source_ports_count = length(var.source_ports)
      destination_ports_count = length(var.destination_ports)
      nat_pools_count = length(var.nat_pool_names)
      tag_count = length(var.tags)
      total_dependencies = 2 + length(var.nat_pool_names) + (var.source_prefixes_name != null ? 1 : 0) + (var.destination_prefixes_name != null ? 1 : 0)
    }
  }
}
