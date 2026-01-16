# Deployment Status Output
output "deployment_status" {
  description = "Status of the path policy stack deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "path_policy_stack"
    status         = "success"
  }
}

# Path Policy Stack ID
output "path_policy_stack_id" {
  description = "The ID of the created path policy stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.id
}

# Path Policy Stack Name
output "path_policy_stack_name" {
  description = "The name of the created path policy stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.name
}

# Description
output "path_policy_stack_description" {
  description = "The description of the path policy stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the path policy stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.tags
}

# Default Policy Set Stack
output "default_policysetstack" {
  description = "Whether this is a default policy set stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.default_policysetstack
}

# Policy Set IDs
output "policyset_ids" {
  description = "Policy set IDs included in the stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.policyset_ids
}

# Default Rule Policy Set ID
output "defaultrule_policyset_id" {
  description = "Default rule policy set ID"
  value       = prismasdwan_path_policy_stack.policy_stack_main.defaultrule_policyset_id
}

# Resource Locator Results
output "defaultrule_policyset_resolved_id" {
  description = "Resolved ID for default rule policy set"
  value       = prismasdwan_resource_locator.defaultrule_policyset.result
}

output "policy_sets_resolved_ids" {
  description = "Resolved IDs for policy sets"
  value       = [for locator in prismasdwan_resource_locator.policy_sets : locator.result]
}

# Schema and Etag (computed fields)
output "path_policy_stack_schema" {
  description = "Schema version for the path policy stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.x_schema
}

output "path_policy_stack_etag" {
  description = "Etag for the path policy stack"
  value       = prismasdwan_path_policy_stack.policy_stack_main.x_etag
}

# Complete Path Policy Stack Details
output "path_policy_stack_details" {
  description = "Complete details of the created path policy stack"
  value = {
    id                       = prismasdwan_path_policy_stack.policy_stack_main.id
    name                     = prismasdwan_path_policy_stack.policy_stack_main.name
    description              = prismasdwan_path_policy_stack.policy_stack_main.description
    tags                     = prismasdwan_path_policy_stack.policy_stack_main.tags
    default_policysetstack   = prismasdwan_path_policy_stack.policy_stack_main.default_policysetstack
    policyset_ids            = prismasdwan_path_policy_stack.policy_stack_main.policyset_ids
    defaultrule_policyset_id = prismasdwan_path_policy_stack.policy_stack_main.defaultrule_policyset_id
    x_etag                   = prismasdwan_path_policy_stack.policy_stack_main.x_etag
    x_schema                 = prismasdwan_path_policy_stack.policy_stack_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "path_policy_stack"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = prismasdwan_path_policy_stack.policy_stack_main.tags != null ? length(prismasdwan_path_policy_stack.policy_stack_main.tags) : 0
}

# Policy Set Count
output "policyset_count" {
  description = "Number of policy sets in the stack"
  value       = length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids)
}

# Policy Stack Analysis
output "policy_stack_analysis" {
  description = "Analysis of the path policy stack configuration"
  value = {
    is_default_stack      = prismasdwan_path_policy_stack.policy_stack_main.default_policysetstack
    has_policy_sets       = length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids) > 0
    policy_sets_count     = length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids)
    has_tags              = prismasdwan_path_policy_stack.policy_stack_main.tags != null ? length(prismasdwan_path_policy_stack.policy_stack_main.tags) > 0 : false
    has_description       = prismasdwan_path_policy_stack.policy_stack_main.description != null
    has_default_rule_set  = prismasdwan_path_policy_stack.policy_stack_main.defaultrule_policyset_id != null
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description        = prismasdwan_path_policy_stack.policy_stack_main.description != null
    has_tags              = prismasdwan_path_policy_stack.policy_stack_main.tags != null ? length(prismasdwan_path_policy_stack.policy_stack_main.tags) > 0 : false
    has_policy_sets       = length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids) > 0
    name_length           = length(prismasdwan_path_policy_stack.policy_stack_main.name)
    desc_length           = prismasdwan_path_policy_stack.policy_stack_main.description != null ? length(prismasdwan_path_policy_stack.policy_stack_main.description) : 0
    default_rule_id_valid = can(regex("^[0-9]{1,30}$", prismasdwan_path_policy_stack.policy_stack_main.defaultrule_policyset_id))
  }
}

# Path Policy Stack Validation
output "policy_stack_validation" {
  description = "Validation checks for the path policy stack"
  value = {
    name_valid              = length(prismasdwan_path_policy_stack.policy_stack_main.name) > 0 && length(prismasdwan_path_policy_stack.policy_stack_main.name) <= 128
    description_valid       = prismasdwan_path_policy_stack.policy_stack_main.description != null ? length(prismasdwan_path_policy_stack.policy_stack_main.description) <= 256 : true
    tags_count_valid        = prismasdwan_path_policy_stack.policy_stack_main.tags != null ? length(prismasdwan_path_policy_stack.policy_stack_main.tags) <= 10 : true
    policyset_count_valid   = length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids) >= 0 && length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids) <= 4
    defaultrule_id_valid    = can(regex("^[0-9]{1,30}$", prismasdwan_path_policy_stack.policy_stack_main.defaultrule_policyset_id))
    has_id                  = prismasdwan_path_policy_stack.policy_stack_main.id != null
    has_schema              = prismasdwan_path_policy_stack.policy_stack_main.x_schema != null
    has_etag                = prismasdwan_path_policy_stack.policy_stack_main.x_etag != null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of the path policy stack configuration"
  value = {
    resource_name           = prismasdwan_path_policy_stack.policy_stack_main.name
    resource_id            = prismasdwan_path_policy_stack.policy_stack_main.id
    is_default_stack       = prismasdwan_path_policy_stack.policy_stack_main.default_policysetstack
    policy_sets_configured = length(prismasdwan_path_policy_stack.policy_stack_main.policyset_ids)
    has_default_rule_set   = prismasdwan_path_policy_stack.policy_stack_main.defaultrule_policyset_id != null
    tags_configured        = prismasdwan_path_policy_stack.policy_stack_main.tags != null
    description_provided   = prismasdwan_path_policy_stack.policy_stack_main.description != null
  }
}

# Resource Locator Details
output "resource_locator_details" {
  description = "Details about resource locators used"
  value = {
    defaultrule_policyset_name = var.defaultrule_policyset_name
    defaultrule_policyset_id   = prismasdwan_resource_locator.defaultrule_policyset.result
    policy_set_names          = var.policyset_names
    policy_set_ids            = [for locator in prismasdwan_resource_locator.policy_sets : locator.result]
    total_locators            = length(var.policyset_names) + 1
  }
}