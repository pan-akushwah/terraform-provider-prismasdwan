# Deployment Status Output
output "deployment_status" {
  description = "Status of the security policy set deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "security_policy_set"
    status         = "success"
  }
}

# Security Policy Set ID
output "security_policy_set_id" {
  description = "The ID of the created security policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.id
}

# Security Policy Set Name
output "security_policy_set_name" {
  description = "The name of the created security policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.name
}

# Description
output "security_policy_set_description" {
  description = "The description of the security policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the security policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.tags
}

# Default Rule Policy Set
output "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.defaultrule_policyset
}

# Policy Rule Order
output "policyrule_order" {
  description = "Order of policy rules in the policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.policyrule_order
}

# Clone From
output "clone_from" {
  description = "Source policy set ID if cloned"
  value       = prismasdwan_security_policy_set.security_policy_set_main.clone_from
}

# Schema and Etag (computed fields)
output "security_policy_set_schema" {
  description = "Schema version for the security policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.x_schema
}

output "security_policy_set_etag" {
  description = "Etag for the security policy set"
  value       = prismasdwan_security_policy_set.security_policy_set_main.x_etag
}

# Complete Security Policy Set Details
output "security_policy_set_details" {
  description = "Complete details of the created security policy set"
  value = {
    id                    = prismasdwan_security_policy_set.security_policy_set_main.id
    name                  = prismasdwan_security_policy_set.security_policy_set_main.name
    description           = prismasdwan_security_policy_set.security_policy_set_main.description
    tags                  = prismasdwan_security_policy_set.security_policy_set_main.tags
    defaultrule_policyset = prismasdwan_security_policy_set.security_policy_set_main.defaultrule_policyset
    policyrule_order      = prismasdwan_security_policy_set.security_policy_set_main.policyrule_order
    clone_from            = prismasdwan_security_policy_set.security_policy_set_main.clone_from
    x_etag                = prismasdwan_security_policy_set.security_policy_set_main.x_etag
    x_schema              = prismasdwan_security_policy_set.security_policy_set_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "security_policy_set"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_security_policy_set.security_policy_set_main.tags)
}

# Policy Rules Count
output "policyrule_order_count" {
  description = "Number of policy rules in the order"
  value       = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order)
}

# Policy Set Analysis
output "policy_set_analysis" {
  description = "Analysis of the security policy set configuration"
  value = {
    is_default_policyset     = prismasdwan_security_policy_set.security_policy_set_main.defaultrule_policyset
    has_policy_rules         = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order) > 0
    policy_rules_count       = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order)
    has_tags                 = length(prismasdwan_security_policy_set.security_policy_set_main.tags) > 0
    tags_count               = length(prismasdwan_security_policy_set.security_policy_set_main.tags)
    has_description          = length(prismasdwan_security_policy_set.security_policy_set_main.description) > 0
    is_cloned                = prismasdwan_security_policy_set.security_policy_set_main.clone_from != null
    clone_source             = prismasdwan_security_policy_set.security_policy_set_main.clone_from
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description       = length(prismasdwan_security_policy_set.security_policy_set_main.description) > 0
    has_tags             = length(prismasdwan_security_policy_set.security_policy_set_main.tags) > 0
    name_length          = length(prismasdwan_security_policy_set.security_policy_set_main.name)
    desc_length          = length(prismasdwan_security_policy_set.security_policy_set_main.description)
    tags_configured      = length(prismasdwan_security_policy_set.security_policy_set_main.tags)
    rules_configured     = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order)
    is_default_set       = prismasdwan_security_policy_set.security_policy_set_main.defaultrule_policyset
    creation_method      = prismasdwan_security_policy_set.security_policy_set_main.clone_from != null ? "cloned" : "new"
  }
}

# Security Policy Set Validation
output "policy_set_validation" {
  description = "Validation checks for the security policy set"
  value = {
    name_valid           = length(prismasdwan_security_policy_set.security_policy_set_main.name) > 0 && length(prismasdwan_security_policy_set.security_policy_set_main.name) <= 128
    description_valid    = length(prismasdwan_security_policy_set.security_policy_set_main.description) <= 256
    tags_count_valid     = length(prismasdwan_security_policy_set.security_policy_set_main.tags) <= 10
    has_id              = prismasdwan_security_policy_set.security_policy_set_main.id != null
    has_schema          = prismasdwan_security_policy_set.security_policy_set_main.x_schema != null
    has_etag            = prismasdwan_security_policy_set.security_policy_set_main.x_etag != null
    clone_from_valid    = prismasdwan_security_policy_set.security_policy_set_main.clone_from == null || can(regex("^[0-9]+$", prismasdwan_security_policy_set.security_policy_set_main.clone_from))
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of the security policy set configuration"
  value = {
    resource_name           = prismasdwan_security_policy_set.security_policy_set_main.name
    resource_id            = prismasdwan_security_policy_set.security_policy_set_main.id
    is_default_policyset    = prismasdwan_security_policy_set.security_policy_set_main.defaultrule_policyset
    policy_rules_count      = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order)
    tags_configured         = length(prismasdwan_security_policy_set.security_policy_set_main.tags)
    description_provided    = length(prismasdwan_security_policy_set.security_policy_set_main.description) > 0
    is_cloned_set          = prismasdwan_security_policy_set.security_policy_set_main.clone_from != null
    clone_source_id        = prismasdwan_security_policy_set.security_policy_set_main.clone_from
  }
}

# Policy Set Type
output "policy_set_type" {
  description = "Type and characteristics of the policy set"
  value = {
    set_type = prismasdwan_security_policy_set.security_policy_set_main.defaultrule_policyset ? "default-rule-set" : "custom-policy-set"
    creation_type = prismasdwan_security_policy_set.security_policy_set_main.clone_from != null ? "cloned" : "new"
    has_rules = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order) > 0
    rules_count = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order)
  }
}

# Tag Analysis
output "tag_analysis" {
  description = "Detailed analysis of tags"
  value = {
    tags_list        = prismasdwan_security_policy_set.security_policy_set_main.tags
    tags_count       = length(prismasdwan_security_policy_set.security_policy_set_main.tags)
    has_test_tag     = contains(prismasdwan_security_policy_set.security_policy_set_main.tags, "test")
    has_terraform_tag = contains(prismasdwan_security_policy_set.security_policy_set_main.tags, "terraform")
    unique_tags      = length(prismasdwan_security_policy_set.security_policy_set_main.tags) == length(distinct(prismasdwan_security_policy_set.security_policy_set_main.tags))
  }
}

# System Information
output "system_information" {
  description = "System generated information"
  value = {
    resource_id     = prismasdwan_security_policy_set.security_policy_set_main.id
    schema_version  = prismasdwan_security_policy_set.security_policy_set_main.x_schema
    etag_value      = prismasdwan_security_policy_set.security_policy_set_main.x_etag
    created_at      = timestamp()
  }
}

# Policy Rule Order Details
output "policy_rule_order_details" {
  description = "Details about policy rule ordering"
  value = {
    rules_list     = prismasdwan_security_policy_set.security_policy_set_main.policyrule_order
    rules_count    = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order)
    has_rules      = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order) > 0
    is_empty_order = length(prismasdwan_security_policy_set.security_policy_set_main.policyrule_order) == 0
  }
}