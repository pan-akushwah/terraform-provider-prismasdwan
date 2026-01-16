# QoS Policy Stack Details
output "qos_policy_stack_details" {
  description = "Details of the created QoS Policy Stack"
  value = {
    id                     = prismasdwan_qos_policy_stack.qos_policy_stack_full.id
    name                   = prismasdwan_qos_policy_stack.qos_policy_stack_full.name
    description            = prismasdwan_qos_policy_stack.qos_policy_stack_full.description
    tags                   = prismasdwan_qos_policy_stack.qos_policy_stack_full.tags
    default_policysetstack = prismasdwan_qos_policy_stack.qos_policy_stack_full.default_policysetstack
    defaultrule_policyset_id = prismasdwan_qos_policy_stack.qos_policy_stack_full.defaultrule_policyset_id
    policyset_ids          = prismasdwan_qos_policy_stack.qos_policy_stack_full.policyset_ids
    tfid                   = prismasdwan_qos_policy_stack.qos_policy_stack_full.tfid
    x_etag                 = prismasdwan_qos_policy_stack.qos_policy_stack_full.x_etag
    x_schema               = prismasdwan_qos_policy_stack.qos_policy_stack_full.x_schema
  }
}

# Individual outputs for easy access
output "qos_policy_stack_id" {
  description = "ID of the QoS Policy Stack"
  value       = prismasdwan_qos_policy_stack.qos_policy_stack_full.id
}

output "qos_policy_stack_name" {
  description = "Name of the QoS Policy Stack"
  value       = prismasdwan_qos_policy_stack.qos_policy_stack_full.name
}

output "qos_policy_stack_tfid" {
  description = "Terraform ID of the QoS Policy Stack"
  value       = prismasdwan_qos_policy_stack.qos_policy_stack_full.tfid
}

output "is_default_stack" {
  description = "Whether this is a default policy set stack"
  value       = prismasdwan_qos_policy_stack.qos_policy_stack_full.default_policysetstack
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of policy set name to ID resolution"
  value = {
    defaultrule_resolution = {
      policyset_name = var.defaultrule_policyset_name
      resolved_id    = prismasdwan_resource_locator.defaultrule_policyset.result
      resolution_ok  = prismasdwan_resource_locator.defaultrule_policyset.result != null
    }
    
    policyset_resolutions = [
      for i, locator in prismasdwan_resource_locator.policy_sets : {
        index          = i
        policyset_name = var.policyset_names[i]
        resolved_id    = locator.result
        resolution_ok  = locator.result != null
      }
    ]
    
    overall_resolution_status = (
      prismasdwan_resource_locator.defaultrule_policyset.result != null &&
      alltrue([for locator in prismasdwan_resource_locator.policy_sets : locator.result != null])
    ) ? "success" : "failed"
  }
}

# Policy Set Summary
output "policy_set_summary" {
  description = "Summary of policy sets in the stack"
  value = {
    defaultrule_policyset = {
      name = var.defaultrule_policyset_name
      id   = prismasdwan_resource_locator.defaultrule_policyset.result
    }
    
    stack_policy_sets = [
      for i, name in var.policyset_names : {
        index = i + 1
        name  = name
        id    = length(prismasdwan_resource_locator.policy_sets) > i ? prismasdwan_resource_locator.policy_sets[i].result : null
      }
    ]
    
    total_policy_sets = length(var.policyset_names) + 1  # +1 for default rule policy set
    stack_policy_count = length(var.policyset_names)
  }
}

# Stack Configuration Analysis
output "stack_configuration_analysis" {
  description = "Analysis of QoS policy stack configuration"
  value = {
    stack_characteristics = {
      is_default_stack = var.default_policysetstack
      has_custom_policies = length(var.policyset_names) > 0
      policy_depth = length(var.policyset_names)
      is_minimal_stack = length(var.policyset_names) == 0
      is_comprehensive_stack = length(var.policyset_names) >= 3
    }
    
    policy_organization = {
      defaultrule_defined = var.defaultrule_policyset_name != ""
      stack_policies_defined = length(var.policyset_names) > 0
      uses_all_policy_slots = length(var.policyset_names) == 4
      policy_utilization_percent = (length(var.policyset_names) / 4.0) * 100
    }
    
    naming_analysis = {
      follows_naming_convention = alltrue([
        for name in concat([var.defaultrule_policyset_name], var.policyset_names) : 
        can(regex("QoS|Policy|Set", name))
      ])
      has_descriptive_names = alltrue([
        for name in concat([var.defaultrule_policyset_name], var.policyset_names) : 
        length(name) > 10
      ])
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "QoS Policy Stack deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "qos_policy_stack"
    resource_count = 1
    
    configuration_summary = {
      stack_name = var.qos_policy_stack_name
      is_default_stack = var.default_policysetstack
      defaultrule_configured = var.defaultrule_policyset_name != ""
      policy_sets_configured = length(var.policyset_names)
      has_comprehensive_coverage = length(var.policyset_names) >= 2
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of QoS Policy Stack resources"
  value = {
    primary_resource = {
      type = "prismasdwan_qos_policy_stack"
      id = prismasdwan_qos_policy_stack.qos_policy_stack_full.id
      name = var.qos_policy_stack_name
    }
    
    dependencies = {
      defaultrule_policyset = {
        name = var.defaultrule_policyset_name
        id = prismasdwan_resource_locator.defaultrule_policyset.result
      }
      stack_policy_sets = [
        for i, name in var.policyset_names : {
          name = name
          id = length(prismasdwan_resource_locator.policy_sets) > i ? prismasdwan_resource_locator.policy_sets[i].result : null
        }
      ]
    }
    
    configuration_health = {
      has_default_rule = var.defaultrule_policyset_name != ""
      has_stack_policies = length(var.policyset_names) > 0
      all_dependencies_resolved = (
        prismasdwan_resource_locator.defaultrule_policyset.result != null &&
        alltrue([for locator in prismasdwan_resource_locator.policy_sets : locator.result != null])
      )
      is_functional_stack = (
        var.defaultrule_policyset_name != "" && 
        length(var.policyset_names) > 0
      )
    }
    
    scale_metrics = {
      policy_sets_in_stack = length(var.policyset_names)
      tag_count = length(var.tags)
      max_policy_sets = 4
      utilization_percentage = (length(var.policyset_names) / 4.0) * 100
    }
  }
}

# QoS Stack Analysis
output "qos_stack_analysis" {
  description = "Detailed QoS policy stack analysis"
  value = {
    traffic_management_scope = {
      has_default_handling = var.defaultrule_policyset_name != ""
      policy_layers = length(var.policyset_names)
      coverage_level = length(var.policyset_names) == 0 ? "basic" : (
        length(var.policyset_names) <= 2 ? "intermediate" : "comprehensive"
      )
      supports_complex_scenarios = length(var.policyset_names) >= 3
    }
    
    policy_hierarchy = {
      default_rule_base = var.defaultrule_policyset_name
      policy_precedence = var.policyset_names
    }
  }
}