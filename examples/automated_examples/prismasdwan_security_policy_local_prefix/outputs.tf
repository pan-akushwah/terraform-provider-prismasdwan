# Deployment Status Output
output "deployment_status" {
  description = "Status of the security policy local prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "security_policy_local_prefix"
    status         = "success"
  }
}

# Security Policy Local Prefix ID
output "security_policy_local_prefix_id" {
  description = "The ID of the created security policy local prefix"
  value       = prismasdwan_security_policy_local_prefix.local_prefix_main.id
}

# Security Policy Local Prefix Name
output "security_policy_local_prefix_name" {
  description = "The name of the created security policy local prefix"
  value       = prismasdwan_security_policy_local_prefix.local_prefix_main.name
}

# Description
output "security_policy_local_prefix_description" {
  description = "The description of the security policy local prefix"
  value       = prismasdwan_security_policy_local_prefix.local_prefix_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the security policy local prefix"
  value       = prismasdwan_security_policy_local_prefix.local_prefix_main.tags
}

# Schema and Etag (computed fields)
output "security_policy_local_prefix_schema" {
  description = "Schema version for the security policy local prefix"
  value       = prismasdwan_security_policy_local_prefix.local_prefix_main.x_schema
}

output "security_policy_local_prefix_etag" {
  description = "Etag for the security policy local prefix"
  value       = prismasdwan_security_policy_local_prefix.local_prefix_main.x_etag
}

# Complete Security Policy Local Prefix Details
output "security_policy_local_prefix_details" {
  description = "Complete details of the created security policy local prefix"
  value = {
    id          = prismasdwan_security_policy_local_prefix.local_prefix_main.id
    name        = prismasdwan_security_policy_local_prefix.local_prefix_main.name
    description = prismasdwan_security_policy_local_prefix.local_prefix_main.description
    tags        = prismasdwan_security_policy_local_prefix.local_prefix_main.tags
    x_etag      = prismasdwan_security_policy_local_prefix.local_prefix_main.x_etag
    x_schema    = prismasdwan_security_policy_local_prefix.local_prefix_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "security_policy_local_prefix"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags)
}

# Prefix Analysis
output "prefix_analysis" {
  description = "Analysis of the security policy local prefix configuration"
  value = {
    has_tags              = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags) > 0
    has_description       = length(prismasdwan_security_policy_local_prefix.local_prefix_main.description) > 0
    tags_count            = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags)
    description_length    = length(prismasdwan_security_policy_local_prefix.local_prefix_main.description)
    name_length           = length(prismasdwan_security_policy_local_prefix.local_prefix_main.name)
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description     = length(prismasdwan_security_policy_local_prefix.local_prefix_main.description) > 0
    has_tags           = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags) > 0
    name_length        = length(prismasdwan_security_policy_local_prefix.local_prefix_main.name)
    desc_length        = length(prismasdwan_security_policy_local_prefix.local_prefix_main.description)
    tags_configured    = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags)
  }
}

# Security Policy Local Prefix Validation
output "prefix_validation" {
  description = "Validation checks for the security policy local prefix"
  value = {
    name_valid           = length(prismasdwan_security_policy_local_prefix.local_prefix_main.name) > 0 && length(prismasdwan_security_policy_local_prefix.local_prefix_main.name) <= 128
    description_valid    = length(prismasdwan_security_policy_local_prefix.local_prefix_main.description) <= 256
    tags_count_valid     = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags) <= 10
    has_id              = prismasdwan_security_policy_local_prefix.local_prefix_main.id != null
    has_schema          = prismasdwan_security_policy_local_prefix.local_prefix_main.x_schema != null
    has_etag            = prismasdwan_security_policy_local_prefix.local_prefix_main.x_etag != null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of the security policy local prefix configuration"
  value = {
    resource_name           = prismasdwan_security_policy_local_prefix.local_prefix_main.name
    resource_id            = prismasdwan_security_policy_local_prefix.local_prefix_main.id
    tags_configured         = length(prismasdwan_security_policy_local_prefix.local_prefix_main.tags)
    description_provided    = length(prismasdwan_security_policy_local_prefix.local_prefix_main.description) > 0
    has_content            = length(prismasdwan_security_policy_local_prefix.local_prefix_main.name) > 0
  }
}

# Resource Status
output "resource_status" {
  description = "Resource creation status and details"
  value = {
    created_successfully = prismasdwan_security_policy_local_prefix.local_prefix_main.id != null
    has_etag            = prismasdwan_security_policy_local_prefix.local_prefix_main.x_etag != null
    has_schema          = prismasdwan_security_policy_local_prefix.local_prefix_main.x_schema != null
    resource_ready      = prismasdwan_security_policy_local_prefix.local_prefix_main.id != null && prismasdwan_security_policy_local_prefix.local_prefix_main.x_etag != null
  }
}

# Basic Information
output "basic_info" {
  description = "Basic information about the security policy local prefix"
  value = {
    name        = prismasdwan_security_policy_local_prefix.local_prefix_main.name
    id          = prismasdwan_security_policy_local_prefix.local_prefix_main.id
    description = prismasdwan_security_policy_local_prefix.local_prefix_main.description
    tags        = prismasdwan_security_policy_local_prefix.local_prefix_main.tags
  }
}

# System Fields
output "system_fields" {
  description = "System generated fields"
  value = {
    id       = prismasdwan_security_policy_local_prefix.local_prefix_main.id
    x_etag   = prismasdwan_security_policy_local_prefix.local_prefix_main.x_etag
    x_schema = prismasdwan_security_policy_local_prefix.local_prefix_main.x_schema
  }
}

# User Defined Fields
output "user_defined_fields" {
  description = "User defined fields"
  value = {
    name        = prismasdwan_security_policy_local_prefix.local_prefix_main.name
    description = prismasdwan_security_policy_local_prefix.local_prefix_main.description
    tags        = prismasdwan_security_policy_local_prefix.local_prefix_main.tags
  }
}