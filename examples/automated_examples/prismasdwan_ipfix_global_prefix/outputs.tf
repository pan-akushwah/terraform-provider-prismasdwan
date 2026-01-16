# Deployment Status Output
output "deployment_status" {
  description = "Status of the IPFIX global prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "ipfix_global_prefix"
    status         = "success"
  }
}

# IPFIX Global Prefix ID
output "ipfix_global_prefix_id" {
  description = "The ID of the created IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.id
}

# IPFIX Global Prefix Name
output "ipfix_global_prefix_name" {
  description = "The name of the created IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.name
}

# IPFIX Global Prefix Description
output "ipfix_global_prefix_description" {
  description = "The description of the IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.description
}

# IPv4 Prefixes
output "ipv4_prefixes" {
  description = "The IPv4 prefixes configured in the IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes
}

# Tags
output "tags" {
  description = "Tags assigned to the IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.tags
}

# Schema and Etag (computed fields)
output "ipfix_global_prefix_schema" {
  description = "Schema version for the IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.x_schema
}

output "ipfix_global_prefix_etag" {
  description = "Etag for the IPFIX global prefix"
  value       = prismasdwan_ipfix_global_prefix.prefix_main.x_etag
}

# Complete IPFIX Global Prefix Details
output "ipfix_global_prefix_details" {
  description = "Complete details of the created IPFIX global prefix"
  value = {
    id            = prismasdwan_ipfix_global_prefix.prefix_main.id
    name          = prismasdwan_ipfix_global_prefix.prefix_main.name
    description   = prismasdwan_ipfix_global_prefix.prefix_main.description
    tags          = prismasdwan_ipfix_global_prefix.prefix_main.tags
    ipv4_prefixes = prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes
    x_etag        = prismasdwan_ipfix_global_prefix.prefix_main.x_etag
    x_schema      = prismasdwan_ipfix_global_prefix.prefix_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "ipfix_global_prefix"
}

# IPv4 Prefixes Count
output "ipv4_prefixes_count" {
  description = "Number of IPv4 prefixes configured"
  value       = length(prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes)
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_ipfix_global_prefix.prefix_main.tags)
}

# Prefix Analysis
output "prefix_analysis" {
  description = "Analysis of configured IPv4 prefixes"
  value = {
    total_prefixes = length(prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes)
    prefixes_by_mask = {
      for prefix in prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes :
      prefix => split("/", prefix)[1]
    }
    has_class_a = length([
      for prefix in prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes :
      prefix if tonumber(split("/", prefix)[1]) <= 8
    ]) > 0
    has_class_b = length([
      for prefix in prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes :
      prefix if tonumber(split("/", prefix)[1]) > 8 && tonumber(split("/", prefix)[1]) <= 16
    ]) > 0
    has_class_c = length([
      for prefix in prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes :
      prefix if tonumber(split("/", prefix)[1]) > 16 && tonumber(split("/", prefix)[1]) <= 24
    ]) > 0
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description  = length(prismasdwan_ipfix_global_prefix.prefix_main.description) > 0
    has_tags        = length(prismasdwan_ipfix_global_prefix.prefix_main.tags) > 0
    has_prefixes    = length(prismasdwan_ipfix_global_prefix.prefix_main.ipv4_prefixes) > 0
    name_length     = length(prismasdwan_ipfix_global_prefix.prefix_main.name)
  }
}