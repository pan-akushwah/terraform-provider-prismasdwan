# NAT Local Prefix ID
output "nat_local_prefix_id" {
  description = "The ID of the created NAT local prefix"
  value       = prismasdwan_nat_local_prefix.nat_local_prefix_main.id
}

# NAT Local Prefix Name
output "nat_local_prefix_name" {
  description = "The name of the created NAT local prefix"
  value       = prismasdwan_nat_local_prefix.nat_local_prefix_main.name
}

# Complete NAT Local Prefix Details
output "nat_local_prefix_details" {
  description = "Complete details of the created NAT local prefix"
  value = {
    id          = prismasdwan_nat_local_prefix.nat_local_prefix_main.id
    name        = prismasdwan_nat_local_prefix.nat_local_prefix_main.name
    description = prismasdwan_nat_local_prefix.nat_local_prefix_main.description
    tags        = prismasdwan_nat_local_prefix.nat_local_prefix_main.tags
    x_etag      = prismasdwan_nat_local_prefix.nat_local_prefix_main.x_etag
    x_schema    = prismasdwan_nat_local_prefix.nat_local_prefix_main.x_schema
  }
}

# Basic Information
output "prefix_description" {
  description = "Description of the NAT local prefix"
  value       = prismasdwan_nat_local_prefix.nat_local_prefix_main.description
}

output "prefix_tags" {
  description = "Tags of the NAT local prefix"
  value       = prismasdwan_nat_local_prefix.nat_local_prefix_main.tags
}

# Schema and Etag (computed fields)
output "nat_local_prefix_schema" {
  description = "Schema version for the NAT local prefix"
  value       = prismasdwan_nat_local_prefix.nat_local_prefix_main.x_schema
}

output "nat_local_prefix_etag" {
  description = "Etag for the NAT local prefix"
  value       = prismasdwan_nat_local_prefix.nat_local_prefix_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of NAT local prefix configuration"
  value = {
    prefix_name         = prismasdwan_nat_local_prefix.nat_local_prefix_main.name
    prefix_id           = prismasdwan_nat_local_prefix.nat_local_prefix_main.id
    has_description     = prismasdwan_nat_local_prefix.nat_local_prefix_main.description != null
    has_tags            = length(prismasdwan_nat_local_prefix.nat_local_prefix_main.tags) > 0
    tag_count           = length(prismasdwan_nat_local_prefix.nat_local_prefix_main.tags)
    resource_type       = "nat_local_prefix"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the NAT local prefix"
  value = {
    name_valid          = length(prismasdwan_nat_local_prefix.nat_local_prefix_main.name) > 0 && length(prismasdwan_nat_local_prefix.nat_local_prefix_main.name) <= 128
    description_valid   = length(prismasdwan_nat_local_prefix.nat_local_prefix_main.description) <= 256
    tags_count_valid    = length(prismasdwan_nat_local_prefix.nat_local_prefix_main.tags) <= 10
    has_id              = prismasdwan_nat_local_prefix.nat_local_prefix_main.id != null
    has_schema          = prismasdwan_nat_local_prefix.nat_local_prefix_main.x_schema != null
    has_etag            = prismasdwan_nat_local_prefix.nat_local_prefix_main.x_etag != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "nat_local_prefix"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the NAT local prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "nat_local_prefix"
    status         = "success"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags      = length(var.tags)
    tag_list        = var.tags
    has_terraform_tag = contains(var.tags, "terraform")
    max_tag_length  = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
  }
}