# Deployment Status Output
output "deployment_status" {
  description = "Status of the security policy rule deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "security_policy_rule"
    status         = "success"
  }
}

# Security Policy Rule ID
output "security_policy_rule_id" {
  description = "The ID of the created security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.id
}

# Security Policy Rule Name
output "security_policy_rule_name" {
  description = "The name of the created security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.name
}

# Description
output "security_policy_rule_description" {
  description = "The description of the security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.description
}

# Action and Enabled Status
output "action" {
  description = "Action configured for the security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.action
}

output "enabled" {
  description = "Whether the security policy rule is enabled"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.enabled
}

# Tags
output "tags" {
  description = "Tags assigned to the security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.tags
}

# Zone IDs
output "source_zone_ids" {
  description = "Source zone IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids
}

output "destination_zone_ids" {
  description = "Destination zone IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids
}

# Prefix IDs
output "source_prefix_ids" {
  description = "Source prefix IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids
}

output "destination_prefix_ids" {
  description = "Destination prefix IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids
}

# Application Definition IDs
output "app_def_ids" {
  description = "Application definition IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids
}

# Services
output "services" {
  description = "Services configuration"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.services
}

# User or Group
output "user_or_group" {
  description = "User or group configuration"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.user_or_group
}

# Device IDs
output "src_device_ids" {
  description = "Source device IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.src_device_ids
}

output "dest_device_ids" {
  description = "Destination device IDs configured"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.dest_device_ids
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
output "security_policy_rule_schema" {
  description = "Schema version for the security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.x_schema
}

output "security_policy_rule_etag" {
  description = "Etag for the security policy rule"
  value       = prismasdwan_security_policy_rule.security_policy_rule_main.x_etag
}

# Complete Security Policy Rule Details
output "security_policy_rule_details" {
  description = "Complete details of the created security policy rule"
  value = {
    id                        = prismasdwan_security_policy_rule.security_policy_rule_main.id
    name                      = prismasdwan_security_policy_rule.security_policy_rule_main.name
    description               = prismasdwan_security_policy_rule.security_policy_rule_main.description
    tags                      = prismasdwan_security_policy_rule.security_policy_rule_main.tags
    action                    = prismasdwan_security_policy_rule.security_policy_rule_main.action
    enabled                   = prismasdwan_security_policy_rule.security_policy_rule_main.enabled
    source_zone_ids           = prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids
    source_prefix_ids         = prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids
      destination_zone_ids      = prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids
      destination_prefix_ids    = prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids
      app_def_ids              = prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids
      services                 = prismasdwan_security_policy_rule.security_policy_rule_main.services
      user_or_group            = prismasdwan_security_policy_rule.security_policy_rule_main.user_or_group
      src_device_ids           = prismasdwan_security_policy_rule.security_policy_rule_main.src_device_ids
      dest_device_ids          = prismasdwan_security_policy_rule.security_policy_rule_main.dest_device_ids
      policy_set_id            = prismasdwan_resource_locator.policy_set.result
      x_etag                   = prismasdwan_security_policy_rule.security_policy_rule_main.x_etag
      x_schema                 = prismasdwan_security_policy_rule.security_policy_rule_main.x_schema
    }
}

# Resource Type Output
output "resource_type" {
    description = "The type of resource"
    value       = "security_policy_rule"
}

# Rule Analysis
output "rule_analysis" {
    description = "Analysis of the security policy rule configuration"
    value = {
      is_allow_rule              = prismasdwan_security_policy_rule.security_policy_rule_main.action == "allow"
      is_deny_rule               = prismasdwan_security_policy_rule.security_policy_rule_main.action == "deny"
      is_enabled                 = prismasdwan_security_policy_rule.security_policy_rule_main.enabled
      has_source_zones           = prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids != null
      has_destination_zones      = prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids != null
      has_source_prefixes        = prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids != null
      has_destination_prefixes   = prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids != null
      has_app_definitions        = prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids != null
      has_services               = prismasdwan_security_policy_rule.security_policy_rule_main.services != null
      has_user_or_group          = prismasdwan_security_policy_rule.security_policy_rule_main.user_or_group != null
      has_source_devices         = prismasdwan_security_policy_rule.security_policy_rule_main.src_device_ids != null
      has_destination_devices    = prismasdwan_security_policy_rule.security_policy_rule_main.dest_device_ids != null
      has_tags                   = prismasdwan_security_policy_rule.security_policy_rule_main.tags != null
      has_description            = length(prismasdwan_security_policy_rule.security_policy_rule_main.description) > 0
    }
}

# Configuration Counts
output "configuration_counts" {
    description = "Counts of various configuration elements"
    value = {
      source_zones_count           = prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids) : 0
      destination_zones_count      = prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids) : 0
      source_prefixes_count        = prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids) : 0
      destination_prefixes_count   = prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids) : 0
      app_definitions_count        = prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids) : 0
      services_count               = prismasdwan_security_policy_rule.security_policy_rule_main.services != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.services) : 0
      source_devices_count         = prismasdwan_security_policy_rule.security_policy_rule_main.src_device_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.src_device_ids) : 0
      destination_devices_count    = prismasdwan_security_policy_rule.security_policy_rule_main.dest_device_ids != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.dest_device_ids) : 0
      tags_count                   = prismasdwan_security_policy_rule.security_policy_rule_main.tags != null ? length(prismasdwan_security_policy_rule.security_policy_rule_main.tags) : 0
    }
}

# Rule Type Classification
output "rule_type" {
    description = "Classification of the security policy rule type"
    value = {
      rule_action = prismasdwan_security_policy_rule.security_policy_rule_main.action
      rule_status = prismasdwan_security_policy_rule.security_policy_rule_main.enabled ? "enabled" : "disabled"
      rule_scope  = "security-policy"
      has_restrictions = (
        prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.services != null
      )
    }
}

# Validation Results
output "rule_validation" {
    description = "Validation checks for the security policy rule"
    value = {
      name_valid              = length(prismasdwan_security_policy_rule.security_policy_rule_main.name) > 0 && length(prismasdwan_security_policy_rule.security_policy_rule_main.name) <= 128
      description_valid       = length(prismasdwan_security_policy_rule.security_policy_rule_main.description) <= 256
      action_valid           = contains(["allow", "deny"], prismasdwan_security_policy_rule.security_policy_rule_main.action)
      has_id                 = prismasdwan_security_policy_rule.security_policy_rule_main.id != null
      has_schema             = prismasdwan_security_policy_rule.security_policy_rule_main.x_schema != null
      has_etag               = prismasdwan_security_policy_rule.security_policy_rule_main.x_etag != null
      policy_set_resolved    = prismasdwan_resource_locator.policy_set.result != null
    }
}

# X Parameters Information
output "x_parameters_info" {
    description = "Information about x_parameters used"
    value = {
      policy_set_id_used     = prismasdwan_resource_locator.policy_set.result
      policy_set_name_used   = var.policy_set_name
      x_parameters_configured = true
    }
}

# Resource Locator Information
output "resource_locator_info" {
    description = "Information about the resource locator used"
    value = {
      locator_type           = "prismasdwan_security_policy_set"
      locator_property       = "name"
      locator_value          = var.policy_set_name
      resolved_id            = prismasdwan_resource_locator.policy_set.result
    }
}

# Security Configuration Summary
output "security_configuration_summary" {
    description = "Summary of security configuration"
    value = {
      rule_name              = prismasdwan_security_policy_rule.security_policy_rule_main.name
      rule_id                = prismasdwan_security_policy_rule.security_policy_rule_main.id
      action                 = prismasdwan_security_policy_rule.security_policy_rule_main.action
      enabled                = prismasdwan_security_policy_rule.security_policy_rule_main.enabled
      policy_set_id          = prismasdwan_resource_locator.policy_set.result
      has_source_restrictions = (
        prismasdwan_security_policy_rule.security_policy_rule_main.source_zone_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.source_prefix_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.src_device_ids != null
      )
      has_destination_restrictions = (
        prismasdwan_security_policy_rule.security_policy_rule_main.destination_zone_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.destination_prefix_ids != null ||
        prismasdwan_security_policy_rule.security_policy_rule_main.dest_device_ids != null
      )
      has_application_restrictions = prismasdwan_security_policy_rule.security_policy_rule_main.app_def_ids != null
      has_service_restrictions = prismasdwan_security_policy_rule.security_policy_rule_main.services != null
      has_user_restrictions = prismasdwan_security_policy_rule.security_policy_rule_main.user_or_group != null
    }
}

# Complete Rule Status
output "complete_rule_status" {
    description = "Complete status of the security policy rule"
    value = {
      creation_successful    = prismasdwan_security_policy_rule.security_policy_rule_main.id != null
      rule_is_active        = prismasdwan_security_policy_rule.security_policy_rule_main.enabled
      action_configured     = prismasdwan_security_policy_rule.security_policy_rule_main.action
      policy_set_linked     = prismasdwan_resource_locator.policy_set.result != null
      has_metadata          = prismasdwan_security_policy_rule.security_policy_rule_main.x_etag != null && prismasdwan_security_policy_rule.security_policy_rule_main.x_schema != null
    }
}