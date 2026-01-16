# NAT Policy Pool ID
output "nat_policy_pool_id" {
  description = "The ID of the created NAT policy pool"
  value       = prismasdwan_nat_policy_pool.nat_policy_pool_main.id
}

# NAT Policy Pool Name
output "nat_policy_pool_name" {
  description = "The name of the created NAT policy pool"
  value       = prismasdwan_nat_policy_pool.nat_policy_pool_main.name
}

# Complete NAT Policy Pool Details
output "nat_policy_pool_details" {
  description = "Complete details of the created NAT policy pool"
  value = {
    id          = prismasdwan_nat_policy_pool.nat_policy_pool_main.id
    name        = prismasdwan_nat_policy_pool.nat_policy_pool_main.name
    description = prismasdwan_nat_policy_pool.nat_policy_pool_main.description
    tags        = prismasdwan_nat_policy_pool.nat_policy_pool_main.tags
    x_etag      = prismasdwan_nat_policy_pool.nat_policy_pool_main.x_etag
    x_schema    = prismasdwan_nat_policy_pool.nat_policy_pool_main.x_schema
  }
}

# Basic Information
output "pool_description" {
  description = "Description of the NAT policy pool"
  value       = prismasdwan_nat_policy_pool.nat_policy_pool_main.description
}

output "pool_tags" {
  description = "Tags of the NAT policy pool"
  value       = prismasdwan_nat_policy_pool.nat_policy_pool_main.tags
}

# Schema and Etag (computed fields)
output "nat_policy_pool_schema" {
  description = "Schema version for the NAT policy pool"
  value       = prismasdwan_nat_policy_pool.nat_policy_pool_main.x_schema
}

output "nat_policy_pool_etag" {
  description = "Etag for the NAT policy pool"
  value       = prismasdwan_nat_policy_pool.nat_policy_pool_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of NAT policy pool configuration"
  value = {
    pool_name           = prismasdwan_nat_policy_pool.nat_policy_pool_main.name
    pool_id             = prismasdwan_nat_policy_pool.nat_policy_pool_main.id
    has_description     = prismasdwan_nat_policy_pool.nat_policy_pool_main.description != null
    has_tags            = length(prismasdwan_nat_policy_pool.nat_policy_pool_main.tags) > 0
    tag_count           = length(prismasdwan_nat_policy_pool.nat_policy_pool_main.tags)
    resource_type       = "nat_policy_pool"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the NAT policy pool"
  value = {
    name_valid          = length(prismasdwan_nat_policy_pool.nat_policy_pool_main.name) > 0 && length(prismasdwan_nat_policy_pool.nat_policy_pool_main.name) <= 128
    description_valid   = length(prismasdwan_nat_policy_pool.nat_policy_pool_main.description) <= 256
    tags_count_valid    = length(prismasdwan_nat_policy_pool.nat_policy_pool_main.tags) <= 10
    has_id              = prismasdwan_nat_policy_pool.nat_policy_pool_main.id != null
    has_schema          = prismasdwan_nat_policy_pool.nat_policy_pool_main.x_schema != null
    has_etag            = prismasdwan_nat_policy_pool.nat_policy_pool_main.x_etag != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "nat_policy_pool"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the NAT policy pool deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "nat_policy_pool"
    status         = "success"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags           = length(var.tags)
    tag_list             = var.tags
    has_terraform_tag    = contains(var.tags, "terraform")
    has_nat_tag          = contains(var.tags, "nat")
    has_policy_pool_tag  = contains(var.tags, "policy-pool")
    max_tag_length       = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit    = length(var.tags) <= 10
  }
}

# Pool Purpose Analysis
output "pool_purpose_analysis" {
  description = "Analysis of the NAT policy pool purpose and configuration"
  value = {
    is_terraform_managed = contains(var.tags, "terraform")
    is_nat_resource      = contains(var.tags, "nat")
    is_policy_pool       = contains(var.tags, "policy-pool")
    management_type      = contains(var.tags, "managed") ? "managed" : "unmanaged"
    pool_category        = "nat_policy_pool"
    resource_purpose     = "Network Address Translation Pool Management"
  }
}

# Resource Information
output "resource_information" {
  description = "General information about the NAT policy pool resource"
  value = {
    api_endpoints = {
      get    = "/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}"
      post   = "/sdwan/v2.0/api/natpolicypools"
      put    = "/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}"
      delete = "/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}"
    }
    resource_schema = "NATPolicyPool"
    terraform_resource = "prismasdwan_nat_policy_pool"
    computed_fields = ["id", "x_etag", "x_schema"]
    required_fields = ["name"]
    optional_fields = ["description", "tags"]
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_nat_policy_pool.nat_policy_pool_main ${prismasdwan_nat_policy_pool.nat_policy_pool_main.id}"
    import_block = {
      to = "prismasdwan_nat_policy_pool.nat_policy_pool_main"
      id = prismasdwan_nat_policy_pool.nat_policy_pool_main.id
    }
  }
}

# Field Validation Summary
output "field_validation_summary" {
  description = "Summary of field validations applied"
  value = {
    name_constraints = {
      required = true
      max_length = 128
      min_length = 1
      current_length = length(var.nat_policy_pool_name)
      validation_passed = length(var.nat_policy_pool_name) > 0 && length(var.nat_policy_pool_name) <= 128
    }
    description_constraints = {
      required = false
      max_length = 256
      min_length = 0
      current_length = length(var.description)
      validation_passed = length(var.description) <= 256
    }
    tags_constraints = {
      required = false
      max_count = 10
      max_tag_length = 128
      current_count = length(var.tags)
      validation_passed = length(var.tags) <= 10 && alltrue([for tag in var.tags : length(tag) <= 128])
      no_commas_whitespace = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
    }
  }
}