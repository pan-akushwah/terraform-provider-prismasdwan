# Deployment Status Output
output "deployment_status" {
  description = "Status of the path policy set deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "path_policy_set"
    status         = "success"
  }
}

# Path Policy Set ID
output "path_policy_set_id" {
  description = "The ID of the created path policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.id
}

# Path Policy Set Name
output "path_policy_set_name" {
  description = "The name of the created path policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.name
}

# Description
output "path_policy_set_description" {
  description = "The description of the path policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the path policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.tags
}

# Default Rule Policy Set
output "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.defaultrule_policyset
}

# Clone From
output "clone_from" {
  description = "Policy set ID this was cloned from"
  value       = prismasdwan_path_policy_set.policy_set_main.clone_from
}

# Schema and Etag (computed fields)
output "path_policy_set_schema" {
  description = "Schema version for the path policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.x_schema
}

output "path_policy_set_etag" {
  description = "Etag for the path policy set"
  value       = prismasdwan_path_policy_set.policy_set_main.x_etag
}

# Complete Path Policy Set Details
output "path_policy_set_details" {
  description = "Complete details of the created path policy set"
  value = {
    id                    = prismasdwan_path_policy_set.policy_set_main.id
    name                  = prismasdwan_path_policy_set.policy_set_main.name
    description           = prismasdwan_path_policy_set.policy_set_main.description
    tags                  = prismasdwan_path_policy_set.policy_set_main.tags
    defaultrule_policyset = prismasdwan_path_policy_set.policy_set_main.defaultrule_policyset
    clone_from            = prismasdwan_path_policy_set.policy_set_main.clone_from
    x_etag                = prismasdwan_path_policy_set.policy_set_main.x_etag
    x_schema              = prismasdwan_path_policy_set.policy_set_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "path_policy_set"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = prismasdwan_path_policy_set.policy_set_main.tags != null ? length(prismasdwan_path_policy_set.policy_set_main.tags) : 0
}

# Policy Set Analysis
output "policy_set_analysis" {
  description = "Analysis of the path policy set configuration"
  value = {
    is_default_rule_set = prismasdwan_path_policy_set.policy_set_main.defaultrule_policyset
    is_cloned           = prismasdwan_path_policy_set.policy_set_main.clone_from != null
    has_tags            = prismasdwan_path_policy_set.policy_set_main.tags != null ? length(prismasdwan_path_policy_set.policy_set_main.tags) > 0 : false
    has_description     = length(prismasdwan_path_policy_set.policy_set_main.description) > 0
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description = length(prismasdwan_path_policy_set.policy_set_main.description) > 0
    has_tags        = prismasdwan_path_policy_set.policy_set_main.tags != null ? length(prismasdwan_path_policy_set.policy_set_main.tags) > 0 : false
    has_clone_from  = prismasdwan_path_policy_set.policy_set_main.clone_from != null
    name_length     = length(prismasdwan_path_policy_set.policy_set_main.name)
    desc_length     = length(prismasdwan_path_policy_set.policy_set_main.description)
  }
}

# Path Policy Set Validation
output "policy_set_validation" {
  description = "Validation checks for the path policy set"
  value = {
    name_valid        = length(prismasdwan_path_policy_set.policy_set_main.name) > 0 && length(prismasdwan_path_policy_set.policy_set_main.name) <= 128
    description_valid = length(prismasdwan_path_policy_set.policy_set_main.description) <= 256
    tags_count_valid  = prismasdwan_path_policy_set.policy_set_main.tags != null ? length(prismasdwan_path_policy_set.policy_set_main.tags) <= 10 : true
    has_id           = prismasdwan_path_policy_set.policy_set_main.id != null
    has_schema       = prismasdwan_path_policy_set.policy_set_main.x_schema != null
    has_etag         = prismasdwan_path_policy_set.policy_set_main.x_etag != null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of the path policy set configuration"
  value = {
    resource_name         = prismasdwan_path_policy_set.policy_set_main.name
    resource_id          = prismasdwan_path_policy_set.policy_set_main.id
    is_default_policy    = prismasdwan_path_policy_set.policy_set_main.defaultrule_policyset
    created_from_clone   = prismasdwan_path_policy_set.policy_set_main.clone_from != null
    tags_configured      = prismasdwan_path_policy_set.policy_set_main.tags != null
    description_provided = length(prismasdwan_path_policy_set.policy_set_main.description) > 0
  }
}