# Deployment Status Output
output "deployment_status" {
  description = "Status of the security policy stack deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "security_policy_stack"
    status         = "success"
  }
}

# Security Policy Stack ID
output "security_policy_stack_id" {
  description = "The ID of the created security policy stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.id
}

# Security Policy Stack Name
output "security_policy_stack_name" {
  description = "The name of the created security policy stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.name
}

# Description
output "security_policy_stack_description" {
  description = "The description of the security policy stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the security policy stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.tags
}

# Default Rule Policy Set Information
output "defaultrule_policyset_id" {
  description = "The resolved default rule policy set ID"
  value       = prismasdwan_resource_locator.defaultrule_policyset.result
}

output "defaultrule_policyset_name" {
  description = "The default rule policy set name used"
  value       = var.defaultrule_policyset_name
}

# Policy Sets Information
output "policyset_ids" {
  description = "List of policy set IDs in the stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids
}

output "policyset_names" {
  description = "List of policy set names used"
  value       = var.policyset_names
}

# Resource Locator Information
output "resource_locator_info" {
  description = "Information about the resource locators used"
  value = {
    defaultrule_locator = {
      type           = "prismasdwan_security_policy_set"
      property       = "name"
      value          = var.defaultrule_policyset_name
      resolved_id    = prismasdwan_resource_locator.defaultrule_policyset.result
    }
    policyset_locators = [
      for i, name in var.policyset_names : {
        index        = i
        type         = "prismasdwan_security_policy_set"
        property     = "name"
        value        = name
        resolved_id  = prismasdwan_resource_locator.policy_sets[i].result
      }
    ]
  }
}

# Schema and Etag (computed fields)
output "security_policy_stack_schema" {
  description = "Schema version for the security policy stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.x_schema
}

output "security_policy_stack_etag" {
  description = "Etag for the security policy stack"
  value       = prismasdwan_security_policy_stack.security_policy_stack_main.x_etag
}

# Complete Security Policy Stack Details
output "security_policy_stack_details" {
  description = "Complete details of the created security policy stack"
  value = {
    id                        = prismasdwan_security_policy_stack.security_policy_stack_main.id
    name                      = prismasdwan_security_policy_stack.security_policy_stack_main.name
    description               = prismasdwan_security_policy_stack.security_policy_stack_main.description
    tags                      = prismasdwan_security_policy_stack.security_policy_stack_main.tags
    defaultrule_policyset_id  = prismasdwan_security_policy_stack.security_policy_stack_main.defaultrule_policyset_id
    policyset_ids             = prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids
    x_etag                    = prismasdwan_security_policy_stack.security_policy_stack_main.x_etag
    x_schema                  = prismasdwan_security_policy_stack.security_policy_stack_main.x_schema
  }
}

# Stack Analysis
output "stack_analysis" {
  description = "Analysis of the security policy stack configuration"
  value = {
    has_description           = prismasdwan_security_policy_stack.security_policy_stack_main.description != null
    has_tags                  = prismasdwan_security_policy_stack.security_policy_stack_main.tags != null
    has_policy_sets           = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids) > 0
    policy_sets_count         = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids)
    has_default_rule_set      = prismasdwan_security_policy_stack.security_policy_stack_main.defaultrule_policyset_id != null
  }
}

# Configuration Counts
output "configuration_counts" {
  description = "Counts of various configuration elements"
  value = {
    policy_sets_count         = length(var.policyset_names)
    tags_count                = var.tags != null ? length(var.tags) : 0
    total_policy_sets         = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids)
  }
}

# Stack Type Classification
output "stack_type" {
  description = "Classification of the security policy stack type"
  value = {
    stack_scope               = "security-policy"
    has_multiple_policy_sets  = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids) > 1
    is_simple_stack           = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids) <= 1
    is_complex_stack          = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids) > 1
  }
}

# Validation Results - FIXED TO AVOID NULL LENGTH() CALLS
output "stack_validation" {
  description = "Validation checks for the security policy stack"
  value = {
    name_valid                = length(prismasdwan_security_policy_stack.security_policy_stack_main.name) > 0 && length(prismasdwan_security_policy_stack.security_policy_stack_main.name) <= 128
    description_valid         = prismasdwan_security_policy_stack.security_policy_stack_main.description == null ? true : length(prismasdwan_security_policy_stack.security_policy_stack_main.description) <= 256
    has_id                    = prismasdwan_security_policy_stack.security_policy_stack_main.id != null
    has_schema                = prismasdwan_security_policy_stack.security_policy_stack_main.x_schema != null
    has_etag                  = prismasdwan_security_policy_stack.security_policy_stack_main.x_etag != null
    defaultrule_resolved      = prismasdwan_resource_locator.defaultrule_policyset.result != null
    all_policysets_resolved   = alltrue([for locator in prismasdwan_resource_locator.policy_sets : locator.result != null])
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "security_policy_stack"
}

# Security Configuration Summary
output "security_configuration_summary" {
  description = "Summary of security configuration"
  value = {
    stack_name                = prismasdwan_security_policy_stack.security_policy_stack_main.name
    stack_id                  = prismasdwan_security_policy_stack.security_policy_stack_main.id
    default_policy_set_id     = prismasdwan_security_policy_stack.security_policy_stack_main.defaultrule_policyset_id
    policy_sets_in_stack      = length(prismasdwan_security_policy_stack.security_policy_stack_main.policyset_ids)
    has_custom_description    = prismasdwan_security_policy_stack.security_policy_stack_main.description != null
    has_tags                  = prismasdwan_security_policy_stack.security_policy_stack_main.tags != null
  }
}