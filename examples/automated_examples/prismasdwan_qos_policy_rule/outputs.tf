# QoS Policy Rule Details
output "qos_policy_rule_details" {
  description = "Details of the created QoS Policy Rule"
  value = {
    id                      = prismasdwan_qos_policy_rule.qos_policy_rule_full.id
    name                    = prismasdwan_qos_policy_rule.qos_policy_rule_full.name
    description             = prismasdwan_qos_policy_rule.qos_policy_rule_full.description
    tags                    = prismasdwan_qos_policy_rule.qos_policy_rule_full.tags
    enabled                 = prismasdwan_qos_policy_rule.qos_policy_rule_full.enabled
    priority_number         = prismasdwan_qos_policy_rule.qos_policy_rule_full.priority_number
    order_number            = prismasdwan_qos_policy_rule.qos_policy_rule_full.order_number
    app_def_ids             = prismasdwan_qos_policy_rule.qos_policy_rule_full.app_def_ids
    source_prefixes_id      = prismasdwan_qos_policy_rule.qos_policy_rule_full.source_prefixes_id
    destination_prefixes_id = prismasdwan_qos_policy_rule.qos_policy_rule_full.destination_prefixes_id
    network_context_id      = prismasdwan_qos_policy_rule.qos_policy_rule_full.network_context_id
    src_device_ids          = prismasdwan_qos_policy_rule.qos_policy_rule_full.src_device_ids
    dest_device_ids         = prismasdwan_qos_policy_rule.qos_policy_rule_full.dest_device_ids
    user_or_group           = prismasdwan_qos_policy_rule.qos_policy_rule_full.user_or_group
    dscp                    = prismasdwan_qos_policy_rule.qos_policy_rule_full.dscp
    x_etag                  = prismasdwan_qos_policy_rule.qos_policy_rule_full.x_etag
    x_schema                = prismasdwan_qos_policy_rule.qos_policy_rule_full.x_schema
  }
}

# Individual outputs for easy access
output "qos_policy_rule_id" {
  description = "ID of the QoS Policy Rule"
  value       = prismasdwan_qos_policy_rule.qos_policy_rule_full.id
}

output "qos_policy_rule_name" {
  description = "Name of the QoS Policy Rule"
  value       = prismasdwan_qos_policy_rule.qos_policy_rule_full.name
}

output "policy_set_id" {
  description = "ID of the parent policy set"
  value       = prismasdwan_resource_locator.policy_set.result
}

output "rule_priority" {
  description = "Priority number of the rule"
  value       = prismasdwan_qos_policy_rule.qos_policy_rule_full.priority_number
}

output "rule_enabled" {
  description = "Whether the rule is enabled"
  value       = prismasdwan_qos_policy_rule.qos_policy_rule_full.enabled
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    policy_set_resolution = {
      name = var.policy_set_name
      resolved_id = prismasdwan_resource_locator.policy_set.result
      resolution_ok = prismasdwan_resource_locator.policy_set.result != null
    }
    
    app_def_resolutions = [
      for i, locator in prismasdwan_resource_locator.app_definitions : {
        index = i
        app_name = var.app_def_names[i]
        resolved_id = locator.result
        resolution_ok = locator.result != null
      }
    ]
    
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
    
    device_resolutions = {
      src_devices = [
        for i, locator in prismasdwan_resource_locator.src_devices : {
          index = i
          device_name = var.src_device_names[i]
          resolved_id = locator.result
          resolution_ok = locator.result != null
        }
      ]
      
      dest_devices = [
        for i, locator in prismasdwan_resource_locator.dest_devices : {
          index = i
          device_name = var.dest_device_names[i]
          resolved_id = locator.result
          resolution_ok = locator.result != null
        }
      ]
    }
    
    overall_resolution_status = (
      prismasdwan_resource_locator.policy_set.result != null &&
      alltrue([for locator in prismasdwan_resource_locator.app_definitions : locator.result != null]) &&
      (length(prismasdwan_resource_locator.source_prefixes) == 0 || prismasdwan_resource_locator.source_prefixes[0].result != null) &&
      (length(prismasdwan_resource_locator.destination_prefixes) == 0 || prismasdwan_resource_locator.destination_prefixes[0].result != null) &&
      alltrue([for locator in prismasdwan_resource_locator.src_devices : locator.result != null]) &&
      alltrue([for locator in prismasdwan_resource_locator.dest_devices : locator.result != null])
    ) ? "success" : "failed"
  }
}

# Traffic Classification Summary
output "traffic_classification_summary" {
  description = "Summary of traffic classification configuration"
  value = {
    application_filtering = {
      app_count = length(var.app_def_names)
      applications = var.app_def_names
      has_app_filtering = length(var.app_def_names) > 0
    }
    
    network_filtering = {
      has_source_prefixes = var.source_prefixes_name != null
      has_dest_prefixes = var.destination_prefixes_name != null
      has_network_context = var.network_context_name != null
      source_prefixes_name = var.source_prefixes_name
      dest_prefixes_name = var.destination_prefixes_name
      network_context_name = var.network_context_name
    }
    
    device_filtering = {
      src_device_count = length(var.src_device_names)
      dest_device_count = length(var.dest_device_names)
      src_devices = var.src_device_names
      dest_devices = var.dest_device_names
      has_device_filtering = length(var.src_device_names) > 0 || length(var.dest_device_names) > 0
    }
    
    user_filtering = {
      user_count = length(var.user_ids)
      user_group_count = length(var.user_group_ids)
      has_user_filtering = length(var.user_ids) > 0 || length(var.user_group_ids) > 0
      user_ids = var.user_ids
      user_group_ids = var.user_group_ids
    }
    
    dscp_configuration = {
      has_dscp = var.dscp_value != null
      dscp_value = var.dscp_value
      dscp_class = var.dscp_value != null ? (
        var.dscp_value >= 46 ? "network_control" : (
          var.dscp_value >= 34 ? "voice" : (
            var.dscp_value >= 26 ? "video" : (
              var.dscp_value >= 18 ? "critical_data" : "best_effort"
            )
          )
        )
      ) : null
    }
  }
}

# Rule Configuration Analysis
output "rule_configuration_analysis" {
  description = "Analysis of QoS policy rule configuration"
  value = {
    rule_characteristics = {
      priority_level = var.priority_number == 1 ? "highest" : (
        var.priority_number == 2 ? "high" : (
          var.priority_number == 3 ? "medium" : "low"
        )
      )
      is_enabled = var.enabled
      order_position = var.order_number
      evaluation_precedence = var.order_number <= 100 ? "early" : (
        var.order_number <= 1000 ? "normal" : "late"
      )
    }
    
    classification_complexity = {
      filter_types_used = sum([
        length(var.app_def_names) > 0 ? 1 : 0,
        var.source_prefixes_name != null ? 1 : 0,
        var.destination_prefixes_name != null ? 1 : 0,
        var.network_context_name != null ? 1 : 0,
        length(var.src_device_names) > 0 ? 1 : 0,
        length(var.dest_device_names) > 0 ? 1 : 0,
        length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? 1 : 0
      ])
      complexity_level = sum([
        length(var.app_def_names) > 0 ? 1 : 0,
        var.source_prefixes_name != null ? 1 : 0,
        var.destination_prefixes_name != null ? 1 : 0,
        var.network_context_name != null ? 1 : 0,
        length(var.src_device_names) > 0 ? 1 : 0,
        length(var.dest_device_names) > 0 ? 1 : 0,
        length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? 1 : 0
      ]) <= 2 ? "simple" : (
        sum([
          length(var.app_def_names) > 0 ? 1 : 0,
          var.source_prefixes_name != null ? 1 : 0,
          var.destination_prefixes_name != null ? 1 : 0,
          var.network_context_name != null ? 1 : 0,
          length(var.src_device_names) > 0 ? 1 : 0,
          length(var.dest_device_names) > 0 ? 1 : 0,
          length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? 1 : 0
        ]) <= 4 ? "moderate" : "complex"
      )
      is_comprehensive = sum([
        length(var.app_def_names) > 0 ? 1 : 0,
        var.source_prefixes_name != null ? 1 : 0,
        var.destination_prefixes_name != null ? 1 : 0,
        var.network_context_name != null ? 1 : 0,
        length(var.src_device_names) > 0 ? 1 : 0,
        length(var.dest_device_names) > 0 ? 1 : 0,
        length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? 1 : 0
      ]) >= 3
    }
    
    performance_impact = {
      app_lookups = length(var.app_def_names)
      device_lookups = length(var.src_device_names) + length(var.dest_device_names)
      user_lookups = length(var.user_ids) + length(var.user_group_ids)
      total_lookups = length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)
      performance_rating = (
        length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)
      ) <= 10 ? "low_impact" : (
        (length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)) <= 50 ? "medium_impact" : "high_impact"
      )
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "QoS Policy Rule deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "qos_policy_rule"
    resource_count = 1
    parent_policy_set = var.policy_set_name
    
    configuration_summary = {
      rule_name = var.qos_policy_rule_name
      priority = var.priority_number
      enabled = var.enabled
      order = var.order_number
      has_app_filtering = length(var.app_def_names) > 0
      has_network_filtering = var.source_prefixes_name != null || var.destination_prefixes_name != null || var.network_context_name != null
      has_device_filtering = length(var.src_device_names) > 0 || length(var.dest_device_names) > 0
      has_user_filtering = length(var.user_ids) > 0 || length(var.user_group_ids) > 0
      has_dscp_marking = var.dscp_value != null
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of QoS Policy Rule resources"
  value = {
    primary_resource = {
      type = "prismasdwan_qos_policy_rule"
      id = prismasdwan_qos_policy_rule.qos_policy_rule_full.id
      name = var.qos_policy_rule_name
      parent_policy_set = var.policy_set_name
    }
    
    dependencies = {
      policy_set = {
        name = var.policy_set_name
        id = prismasdwan_resource_locator.policy_set.result
      }
      app_definitions = [
        for i, name in var.app_def_names : {
          name = name
          id = length(prismasdwan_resource_locator.app_definitions) > i ? prismasdwan_resource_locator.app_definitions[i].result : null
        }
      ]
      network_prefixes = {
        source = var.source_prefixes_name != null ? {
          name = var.source_prefixes_name
          id = length(prismasdwan_resource_locator.source_prefixes) > 0 ? prismasdwan_resource_locator.source_prefixes[0].result : null
        } : null
        destination = var.destination_prefixes_name != null ? {
          name = var.destination_prefixes_name
          id = length(prismasdwan_resource_locator.destination_prefixes) > 0 ? prismasdwan_resource_locator.destination_prefixes[0].result : null
        } : null
      }
      devices = {
        source_devices = [
          for i, name in var.src_device_names : {
            name = name
            id = length(prismasdwan_resource_locator.src_devices) > i ? prismasdwan_resource_locator.src_devices[i].result : null
          }
        ]
        destination_devices = [
          for i, name in var.dest_device_names : {
            name = name
            id = length(prismasdwan_resource_locator.dest_devices) > i ? prismasdwan_resource_locator.dest_devices[i].result : null
          }
        ]
      }
    }
    
    configuration_health = {
      has_parent_policy_set = prismasdwan_resource_locator.policy_set.result != null
      all_app_defs_resolved = alltrue([for locator in prismasdwan_resource_locator.app_definitions : locator.result != null])
      all_devices_resolved = (
        alltrue([for locator in prismasdwan_resource_locator.src_devices : locator.result != null]) &&
        alltrue([for locator in prismasdwan_resource_locator.dest_devices : locator.result != null])
      )
      has_classification_criteria = (
        length(var.app_def_names) > 0 ||
        var.source_prefixes_name != null ||
        var.destination_prefixes_name != null ||
        var.network_context_name != null ||
        length(var.src_device_names) > 0 ||
        length(var.dest_device_names) > 0 ||
        length(var.user_ids) > 0 ||
        length(var.user_group_ids) > 0
      )
      is_functional_rule = (
        prismasdwan_resource_locator.policy_set.result != null &&
        var.enabled &&
        (length(var.app_def_names) > 0 || var.source_prefixes_name != null || var.destination_prefixes_name != null)
      )
    }
    
    scale_metrics = {
      app_definitions_count = length(var.app_def_names)
      src_devices_count = length(var.src_device_names)
      dest_devices_count = length(var.dest_device_names)
      user_ids_count = length(var.user_ids)
      user_groups_count = length(var.user_group_ids)
      tag_count = length(var.tags)
      total_filter_items = length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)
    }
  }
}

# QoS Rule Analysis
output "qos_rule_analysis" {
  description = "Detailed QoS policy rule analysis"
  value = {
    traffic_targeting = {
      application_based = length(var.app_def_names) > 0
      location_based = var.source_prefixes_name != null || var.destination_prefixes_name != null
      device_based = length(var.src_device_names) > 0 || length(var.dest_device_names) > 0
      user_based = length(var.user_ids) > 0 || length(var.user_group_ids) > 0
      network_context_aware = var.network_context_name != null
      
      targeting_scope = (
        (length(var.app_def_names) > 0 ? 1 : 0) +
        (var.source_prefixes_name != null || var.destination_prefixes_name != null ? 1 : 0) +
        (length(var.src_device_names) > 0 || length(var.dest_device_names) > 0 ? 1 : 0) +
        (length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? 1 : 0) +
        (var.network_context_name != null ? 1 : 0)
      ) <= 2 ? "narrow" : (
        (
          (length(var.app_def_names) > 0 ? 1 : 0) +
          (var.source_prefixes_name != null || var.destination_prefixes_name != null ? 1 : 0) +
          (length(var.src_device_names) > 0 || length(var.dest_device_names) > 0 ? 1 : 0) +
          (length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? 1 : 0) +
          (var.network_context_name != null ? 1 : 0)
        ) <= 4 ? "broad" : "comprehensive"
      )
    }
    
    qos_treatment = {
      priority_class = var.priority_number == 1 ? "critical" : (
        var.priority_number == 2 ? "high" : (
          var.priority_number == 3 ? "normal" : "low"
        )
      )
      has_dscp_marking = var.dscp_value != null
      dscp_analysis = var.dscp_value != null ? {
        value = var.dscp_value
        traffic_class = var.dscp_value >= 56 ? "network_control" : (
          var.dscp_value >= 48 ? "voice" : (
            var.dscp_value >= 40 ? "video_conference" : (
              var.dscp_value >= 32 ? "real_time_interactive" : (
                var.dscp_value >= 24 ? "multimedia_streaming" : (
                  var.dscp_value >= 16 ? "high_throughput_data" : (
                    var.dscp_value >= 8 ? "standard_data" : "best_effort"
                  )
                )
              )
            )
          )
        )
        precedence = floor(var.dscp_value / 8)
        drop_precedence = var.dscp_value % 8
      } : null
      
      rule_effectiveness = var.enabled && (
        length(var.app_def_names) > 0 || 
        var.source_prefixes_name != null || 
        var.destination_prefixes_name != null
      ) ? "effective" : (
        !var.enabled ? "disabled" : "ineffective"
      )
    }
    
    operational_characteristics = {
      rule_position = var.order_number <= 100 ? "early_evaluation" : (
        var.order_number <= 1000 ? "normal_evaluation" : "late_evaluation"
      )
      matching_complexity = (
        length(var.app_def_names) > 0 ? "high" : "low"
      )
      maintenance_complexity = (
        length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)
      ) <= 10 ? "low" : (
        (length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)) <= 50 ? "medium" : "high"
      )
      
      is_production_ready = (
        var.enabled &&
        prismasdwan_resource_locator.policy_set.result != null &&
        (length(var.app_def_names) > 0 || var.source_prefixes_name != null) &&
        var.priority_number >= 1 && var.priority_number <= 4
      )
    }
  }
}

# Performance Metrics
output "performance_metrics" {
  description = "Expected performance characteristics"
  value = {
    processing_overhead = {
      app_definition_lookups = length(var.app_def_names)
      device_lookups = length(var.src_device_names) + length(var.dest_device_names)
      user_lookups = length(var.user_ids) + length(var.user_group_ids)
      total_lookups = length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)
      
      processing_complexity = (
        length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)
      ) <= 5 ? "low" : (
        (length(var.app_def_names) + length(var.src_device_names) + length(var.dest_device_names) + length(var.user_ids) + length(var.user_group_ids)) <= 20 ? "medium" : "high"
      )
    }
    
    scalability_considerations = {
      app_utilization = "${length(var.app_def_names)}/256 (${(length(var.app_def_names) / 256.0) * 100}%)"
      src_device_utilization = "${length(var.src_device_names)}/256 (${(length(var.src_device_names) / 256.0) * 100}%)"
      dest_device_utilization = "${length(var.dest_device_names)}/10 (${(length(var.dest_device_names) / 10.0) * 100}%)"
      user_utilization = "${length(var.user_ids)}/256 (${(length(var.user_ids) / 256.0) * 100}%)"
      user_group_utilization = "${length(var.user_group_ids)}/256 (${(length(var.user_group_ids) / 256.0) * 100}%)"
      
      near_limits = [
        for limit_check in [
          {name = "app_definitions", current = length(var.app_def_names), max = 256},
          {name = "src_devices", current = length(var.src_device_names), max = 256},
          {name = "dest_devices", current = length(var.dest_device_names), max = 10},
          {name = "user_ids", current = length(var.user_ids), max = 256},
          {name = "user_group_ids", current = length(var.user_group_ids), max = 256}
        ] : limit_check.name if (limit_check.current / limit_check.max) > 0.8
      ]
    }
    
    optimization_suggestions = {
      reduce_app_definitions = length(var.app_def_names) > 20
      consolidate_devices = (length(var.src_device_names) + length(var.dest_device_names)) > 20
      use_user_groups = length(var.user_ids) > 10 && length(var.user_group_ids) == 0
      consider_network_context = var.network_context_name == null && (var.source_prefixes_name != null || var.destination_prefixes_name != null)
    }
  }
}

# Validation Summary
output "validation_summary" {
  description = "Summary of configuration validation"
  value = {
    required_fields_present = {
      rule_name = var.qos_policy_rule_name != ""
      policy_set_name = var.policy_set_name != ""
      priority_number = var.priority_number >= 1 && var.priority_number <= 4
    }
    
    constraint_compliance = {
      name_length_ok = length(var.qos_policy_rule_name) <= 128
      description_length_ok = length(var.description) <= 256
      tag_count_ok = length(var.tags) <= 10
      priority_range_ok = var.priority_number >= 1 && var.priority_number <= 4
      order_range_ok = var.order_number >= 1 && var.order_number <= 65535
      app_def_count_ok = length(var.app_def_names) <= 256
      src_device_count_ok = length(var.src_device_names) <= 256
      dest_device_count_ok = length(var.dest_device_names) <= 10
      user_count_ok = length(var.user_ids) <= 256
      user_group_count_ok = length(var.user_group_ids) <= 256
      dscp_range_ok = var.dscp_value == null || (var.dscp_value >= 0 && var.dscp_value <= 63)
    }
    
    configuration_completeness = {
      has_classification_criteria = (
        length(var.app_def_names) > 0 ||
        var.source_prefixes_name != null ||
        var.destination_prefixes_name != null ||
        var.network_context_name != null ||
        length(var.src_device_names) > 0 ||
        length(var.dest_device_names) > 0 ||
        length(var.user_ids) > 0 ||
        length(var.user_group_ids) > 0
      )
      has_qos_action = var.dscp_value != null || var.priority_number != null
      is_actionable = var.enabled
      ready_for_deployment = (
        var.qos_policy_rule_name != "" &&
        var.policy_set_name != "" &&
        var.priority_number >= 1 && var.priority_number <= 4 &&
        var.enabled &&
        (length(var.app_def_names) > 0 || var.source_prefixes_name != null || var.destination_prefixes_name != null)
      )
    }
  }
}
