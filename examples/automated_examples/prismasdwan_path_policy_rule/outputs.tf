# Deployment Status Output
output "deployment_status" {
  description = "Status of the path policy rule deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "path_policy_rule"
    status         = "success"
  }
}

# Path Policy Rule ID
output "path_policy_rule_id" {
  description = "The ID of the created path policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.id
}

# Path Policy Rule Name
output "path_policy_rule_name" {
  description = "The name of the created path policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.name
}

# Description
output "path_policy_rule_description" {
  description = "The description of the path policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the path policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.tags
}

# Order Number
output "order_number" {
  description = "Order number of the policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.order_number
}

# Enabled Status
output "enabled" {
  description = "Whether the policy rule is enabled"
  value       = prismasdwan_path_policy_rule.policy_rule_main.enabled
}

# Paths Allowed
output "paths_allowed" {
  description = "Paths allowed configuration"
  value       = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed
}

# Policy Set Information
output "policy_set_id" {
  description = "The resolved policy set ID"
  value       = prismasdwan_resource_locator.policy_set.result
}

output "policy_set_name" {
  description = "The policy set name used"
  value       = var.policy_set_name
}

# Schema and Etag (computed fields)
output "path_policy_rule_schema" {
  description = "Schema version for the path policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.x_schema
}

output "path_policy_rule_etag" {
  description = "Etag for the path policy rule"
  value       = prismasdwan_path_policy_rule.policy_rule_main.x_etag
}

# Complete Path Policy Rule Details
output "path_policy_rule_details" {
  description = "Complete details of the created path policy rule"
  value = {
    id                      = prismasdwan_path_policy_rule.policy_rule_main.id
    name                    = prismasdwan_path_policy_rule.policy_rule_main.name
    description             = prismasdwan_path_policy_rule.policy_rule_main.description
    tags                    = prismasdwan_path_policy_rule.policy_rule_main.tags
    network_context_id      = prismasdwan_path_policy_rule.policy_rule_main.network_context_id
    source_prefixes_id      = prismasdwan_path_policy_rule.policy_rule_main.source_prefixes_id
    destination_prefixes_id = prismasdwan_path_policy_rule.policy_rule_main.destination_prefixes_id
    app_def_ids             = prismasdwan_path_policy_rule.policy_rule_main.app_def_ids
    paths_allowed           = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed
    service_context         = prismasdwan_path_policy_rule.policy_rule_main.service_context
    order_number            = prismasdwan_path_policy_rule.policy_rule_main.order_number
    enabled                 = prismasdwan_path_policy_rule.policy_rule_main.enabled
    user_or_group           = prismasdwan_path_policy_rule.policy_rule_main.user_or_group
    src_device_ids          = prismasdwan_path_policy_rule.policy_rule_main.src_device_ids
    dest_device_ids         = prismasdwan_path_policy_rule.policy_rule_main.dest_device_ids
    best_path_config        = prismasdwan_path_policy_rule.policy_rule_main.best_path_config
    x_etag                  = prismasdwan_path_policy_rule.policy_rule_main.x_etag
    x_schema                = prismasdwan_path_policy_rule.policy_rule_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "path_policy_rule"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = prismasdwan_path_policy_rule.policy_rule_main.tags != null ? length(prismasdwan_path_policy_rule.policy_rule_main.tags) : 0
}

# Rule Analysis
output "rule_analysis" {
  description = "Analysis of the path policy rule configuration"
  value = {
    is_enabled               = prismasdwan_path_policy_rule.policy_rule_main.enabled
    has_active_paths         = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.active_paths != null ? length(prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.active_paths) > 0 : false
    has_backup_paths         = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.backup_paths != null ? length(prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.backup_paths) > 0 : false
    has_l3_failure_paths     = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.l3_failure_paths != null ? length(prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.l3_failure_paths) > 0 : false
    has_tags                 = prismasdwan_path_policy_rule.policy_rule_main.tags != null ? length(prismasdwan_path_policy_rule.policy_rule_main.tags) > 0 : false
    has_description          = length(prismasdwan_path_policy_rule.policy_rule_main.description) > 0
    has_service_context      = prismasdwan_path_policy_rule.policy_rule_main.service_context != null
    has_network_context      = prismasdwan_path_policy_rule.policy_rule_main.network_context_id != null
    has_app_definitions      = prismasdwan_path_policy_rule.policy_rule_main.app_def_ids != null ? length(prismasdwan_path_policy_rule.policy_rule_main.app_def_ids) > 0 : false
    has_user_or_group        = prismasdwan_path_policy_rule.policy_rule_main.user_or_group != null
    has_src_devices          = prismasdwan_path_policy_rule.policy_rule_main.src_device_ids != null ? length(prismasdwan_path_policy_rule.policy_rule_main.src_device_ids) > 0 : false
    has_dest_devices         = prismasdwan_path_policy_rule.policy_rule_main.dest_device_ids != null ? length(prismasdwan_path_policy_rule.policy_rule_main.dest_device_ids) > 0 : false
    has_best_path_config     = prismasdwan_path_policy_rule.policy_rule_main.best_path_config != null
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description     = length(prismasdwan_path_policy_rule.policy_rule_main.description) > 0
    has_tags           = prismasdwan_path_policy_rule.policy_rule_main.tags != null ? length(prismasdwan_path_policy_rule.policy_rule_main.tags) > 0 : false
    name_length        = length(prismasdwan_path_policy_rule.policy_rule_main.name)
    desc_length        = length(prismasdwan_path_policy_rule.policy_rule_main.description)
    order_in_range     = prismasdwan_path_policy_rule.policy_rule_main.order_number >= 1 && prismasdwan_path_policy_rule.policy_rule_main.order_number <= 65535
  }
}

# Path Policy Rule Validation
output "rule_validation" {
  description = "Validation checks for the path policy rule"
  value = {
    name_valid           = length(prismasdwan_path_policy_rule.policy_rule_main.name) > 0 && length(prismasdwan_path_policy_rule.policy_rule_main.name) <= 128
    description_valid    = length(prismasdwan_path_policy_rule.policy_rule_main.description) <= 256
    tags_count_valid     = prismasdwan_path_policy_rule.policy_rule_main.tags != null ? length(prismasdwan_path_policy_rule.policy_rule_main.tags) <= 10 : true
    order_number_valid   = prismasdwan_path_policy_rule.policy_rule_main.order_number >= 1 && prismasdwan_path_policy_rule.policy_rule_main.order_number <= 65535
    has_id              = prismasdwan_path_policy_rule.policy_rule_main.id != null
    has_schema          = prismasdwan_path_policy_rule.policy_rule_main.x_schema != null
    has_etag            = prismasdwan_path_policy_rule.policy_rule_main.x_etag != null
    has_paths_allowed   = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed != null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of the path policy rule configuration"
  value = {
    resource_name           = prismasdwan_path_policy_rule.policy_rule_main.name
    resource_id            = prismasdwan_path_policy_rule.policy_rule_main.id
    is_enabled             = prismasdwan_path_policy_rule.policy_rule_main.enabled
    order_number           = prismasdwan_path_policy_rule.policy_rule_main.order_number
    policy_set_name        = var.policy_set_name
    policy_set_id          = prismasdwan_resource_locator.policy_set.result
    has_paths_configured   = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed != null
    tags_configured        = prismasdwan_path_policy_rule.policy_rule_main.tags != null
    description_provided   = length(prismasdwan_path_policy_rule.policy_rule_main.description) > 0
  }
}

# Resource Locator Details
output "resource_locator_details" {
  description = "Details about resource locators used"
  value = {
    policy_set_name = var.policy_set_name
    policy_set_id   = prismasdwan_resource_locator.policy_set.result
    locator_type    = "prismasdwan_path_policy_set"
  }
}

# Paths Configuration Details
output "paths_configuration" {
  description = "Detailed paths configuration"
  value = {
    active_paths_count     = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.active_paths != null ? length(prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.active_paths) : 0
    backup_paths_count     = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.backup_paths != null ? length(prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.backup_paths) : 0
    l3_failure_paths_count = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.l3_failure_paths != null ? length(prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.l3_failure_paths) : 0
    active_paths           = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.active_paths
    backup_paths           = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.backup_paths
    l3_failure_paths       = prismasdwan_path_policy_rule.policy_rule_main.paths_allowed.l3_failure_paths
  }
}