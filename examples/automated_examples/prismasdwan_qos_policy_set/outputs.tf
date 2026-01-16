# QoS Policy Set Details
output "qos_policy_set_details" {
  description = "Details of the created QoS Policy Set"
  value = {
    id                          = prismasdwan_qos_policy_set.qos_policy_set_full.id
    name                        = prismasdwan_qos_policy_set.qos_policy_set_full.name
    description                 = prismasdwan_qos_policy_set.qos_policy_set_full.description
    tags                        = prismasdwan_qos_policy_set.qos_policy_set_full.tags
    template                    = prismasdwan_qos_policy_set.qos_policy_set_full.template
    defaultrule_policyset       = prismasdwan_qos_policy_set.qos_policy_set_full.defaultrule_policyset
    clone_from                  = prismasdwan_qos_policy_set.qos_policy_set_full.clone_from
    business_priority_names     = prismasdwan_qos_policy_set.qos_policy_set_full.business_priority_names
    bandwidth_allocation_schemes = prismasdwan_qos_policy_set.qos_policy_set_full.bandwidth_allocation_schemes
    default_rule_dscp_mappings  = prismasdwan_qos_policy_set.qos_policy_set_full.default_rule_dscp_mappings
    tfid                        = prismasdwan_qos_policy_set.qos_policy_set_full.tfid
    x_etag                      = prismasdwan_qos_policy_set.qos_policy_set_full.x_etag
    x_schema                    = prismasdwan_qos_policy_set.qos_policy_set_full.x_schema
  }
}

# Individual outputs for easy access
output "qos_policy_set_id" {
  description = "ID of the QoS Policy Set"
  value       = prismasdwan_qos_policy_set.qos_policy_set_full.id
}

output "qos_policy_set_name" {
  description = "Name of the QoS Policy Set"
  value       = prismasdwan_qos_policy_set.qos_policy_set_full.name
}

output "qos_policy_set_tfid" {
  description = "Terraform ID of the QoS Policy Set"
  value       = prismasdwan_qos_policy_set.qos_policy_set_full.tfid
}

# Business Priority Configuration
output "business_priorities" {
  description = "Business priority configuration"
  value = {
    count = length(var.business_priority_names)
    priorities = [
      for priority in var.business_priority_names : {
        name   = priority.priority_name
        number = priority.priority_number
      }
    ]
  }
}

# Bandwidth Allocation Summary
output "bandwidth_allocation_summary" {
  description = "Summary of bandwidth allocation schemes"
  value = {
    scheme_count = length(var.bandwidth_allocation_schemes)
    schemes = [
      for i, scheme in var.bandwidth_allocation_schemes : {
        scheme_index = i + 1
        bandwidth_range = "${scheme.bandwidth_range.low}Mbps - ${scheme.bandwidth_range.high}Mbps"
        priority_count = length(scheme.business_priorities)
        total_allocation = sum([for bp in scheme.business_priorities : bp.bandwidth_allocation])
      }
    ]
  }
}

# DSCP Mapping Summary
output "dscp_mapping_summary" {
  description = "Summary of DSCP mappings"
  value = {
    mapping_count = length(var.default_rule_dscp_mappings)
    mappings = [
      for mapping in var.default_rule_dscp_mappings : {
        transfer_type = mapping.transfer_type
        priority = mapping.priority_number
        dscp_values = mapping.dscp
        dscp_count = length(mapping.dscp)
      }
    ]
  }
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of QoS policy set configuration"
  value = {
    policy_type = var.template ? "template" : (var.defaultrule_policyset ? "default_rule" : "standard")
    is_cloned = var.clone_from != null
    clone_source = var.clone_from
    
    priority_analysis = {
      priority_count = length(var.business_priority_names)
      has_full_range = length(var.business_priority_names) == 4
      priority_numbers = [for p in var.business_priority_names : p.priority_number]
    }
    
    bandwidth_analysis = {
      scheme_count = length(var.bandwidth_allocation_schemes)
      has_multiple_ranges = length(var.bandwidth_allocation_schemes) > 1
      bandwidth_ranges = [
        for scheme in var.bandwidth_allocation_schemes : {
          low = scheme.bandwidth_range.low
          high = scheme.bandwidth_range.high
          span = scheme.bandwidth_range.high - scheme.bandwidth_range.low
        }
      ]
    }
    
    dscp_analysis = {
      has_dscp_mappings = length(var.default_rule_dscp_mappings) > 0
      mapping_count = length(var.default_rule_dscp_mappings)
      transfer_types_covered = distinct([for m in var.default_rule_dscp_mappings : m.transfer_type])
      total_dscp_values = sum([for m in var.default_rule_dscp_mappings : length(m.dscp)])
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "QoS Policy Set deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "qos_policy_set"
    resource_count = 1
    
    configuration_summary = {
      name = var.qos_policy_set_name
      is_template = var.template
      is_default_rule = var.defaultrule_policyset
      has_business_priorities = length(var.business_priority_names) > 0
      has_bandwidth_schemes = length(var.bandwidth_allocation_schemes) > 0
      has_dscp_mappings = length(var.default_rule_dscp_mappings) > 0
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of QoS Policy Set resource"
  value = {
    primary_resource = {
      type = "prismasdwan_qos_policy_set"
      id = prismasdwan_qos_policy_set.qos_policy_set_full.id
      name = var.qos_policy_set_name
    }
    
    configuration_health = {
      has_priorities = length(var.business_priority_names) > 0
      has_bandwidth_allocation = length(var.bandwidth_allocation_schemes) > 0
      has_dscp_classification = length(var.default_rule_dscp_mappings) > 0
      is_comprehensive = (
        length(var.business_priority_names) > 0 &&
        length(var.bandwidth_allocation_schemes) > 0 &&
        length(var.default_rule_dscp_mappings) > 0
      )
    }
    
    scale_metrics = {
      priority_count = length(var.business_priority_names)
      bandwidth_scheme_count = length(var.bandwidth_allocation_schemes)
      dscp_mapping_count = length(var.default_rule_dscp_mappings)
      tag_count = length(var.tags)
    }
  }
}

# QoS Analysis
output "qos_analysis" {
  description = "Detailed QoS configuration analysis"
  value = {
    traffic_classification = {
      priority_levels = length(var.business_priority_names)
      transfer_types_mapped = length(distinct([for m in var.default_rule_dscp_mappings : m.transfer_type]))
      dscp_values_total = length(flatten([for m in var.default_rule_dscp_mappings : m.dscp]))
      has_real_time_audio = contains([for m in var.default_rule_dscp_mappings : m.transfer_type], "RT_AUDIO")
      has_real_time_video = contains([for m in var.default_rule_dscp_mappings : m.transfer_type], "RT_VIDEO")
      has_transactional = contains([for m in var.default_rule_dscp_mappings : m.transfer_type], "TRANSACTIONAL")
      has_bulk = contains([for m in var.default_rule_dscp_mappings : m.transfer_type], "BULK")
    }
    
    bandwidth_management = {
      bandwidth_ranges = length(var.bandwidth_allocation_schemes)
      adaptive_allocation = length(var.bandwidth_allocation_schemes) > 1
      covers_low_bandwidth = anytrue([
        for scheme in var.bandwidth_allocation_schemes : scheme.bandwidth_range.low <= 10
      ])
      covers_high_bandwidth = anytrue([
        for scheme in var.bandwidth_allocation_schemes : scheme.bandwidth_range.high >= 100
      ])
    }
    
    policy_characteristics = {
      policy_purpose = var.template ? "template_for_reuse" : (
        var.defaultrule_policyset ? "default_rule_handling" : "standard_qos_policy"
      )
      is_derived = var.clone_from != null
      customization_level = length(var.tags) > 2 ? "highly_customized" : "standard"
    }
  }
}

# Validation Summary
output "validation_summary" {
  description = "Summary of configuration validation"
  value = {
    required_fields_present = {
      name = var.qos_policy_set_name != ""
      business_priorities = length(var.business_priority_names) > 0
      bandwidth_schemes = length(var.bandwidth_allocation_schemes) > 0
    }
    
    constraint_compliance = {
      name_length_ok = length(var.qos_policy_set_name) <= 128
      description_length_ok = length(var.description) <= 256
      tag_count_ok = length(var.tags) <= 10
      priority_count_ok = length(var.business_priority_names) <= 4
      bandwidth_scheme_count_ok = length(var.bandwidth_allocation_schemes) <= 4
      dscp_mapping_count_ok = length(var.default_rule_dscp_mappings) <= 16
    }
    
    configuration_completeness = {
      has_all_transfer_types = length(distinct([for m in var.default_rule_dscp_mappings : m.transfer_type])) == 4
      bandwidth_totals_valid = alltrue([
        for scheme in var.bandwidth_allocation_schemes : 
        abs(sum([for bp in scheme.business_priorities : bp.bandwidth_allocation]) - 100) < 1
      ])
      priority_numbers_sequential = alltrue([
        for i, p in var.business_priority_names : p.priority_number == i + 1
      ])
    }
  }
}