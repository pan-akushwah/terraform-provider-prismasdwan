# Deployment Status Output
output "deployment_status" {
  description = "Status of the security policy global prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "security_policy_global_prefix"
    status         = "success"
  }
}

# Security Policy Global Prefix ID
output "security_policy_global_prefix_id" {
  description = "The ID of the created security policy global prefix"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.id
}

# Security Policy Global Prefix Name
output "security_policy_global_prefix_name" {
  description = "The name of the created security policy global prefix"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.name
}

# Description
output "security_policy_global_prefix_description" {
  description = "The description of the security policy global prefix"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the security policy global prefix"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.tags
}

# IPv4 Prefixes
output "ipv4_prefixes" {
  description = "IPv4 prefixes configured"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes
}

# IPv6 Prefixes
output "ipv6_prefixes" {
  description = "IPv6 prefixes configured"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes
}

# Schema and Etag (computed fields)
output "security_policy_global_prefix_schema" {
  description = "Schema version for the security policy global prefix"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.x_schema
}

output "security_policy_global_prefix_etag" {
  description = "Etag for the security policy global prefix"
  value       = prismasdwan_security_policy_global_prefix.global_prefix_main.x_etag
}

# Complete Security Policy Global Prefix Details
output "security_policy_global_prefix_details" {
  description = "Complete details of the created security policy global prefix"
  value = {
    id            = prismasdwan_security_policy_global_prefix.global_prefix_main.id
    name          = prismasdwan_security_policy_global_prefix.global_prefix_main.name
    description   = prismasdwan_security_policy_global_prefix.global_prefix_main.description
    tags          = prismasdwan_security_policy_global_prefix.global_prefix_main.tags
    ipv4_prefixes = prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes
    ipv6_prefixes = prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes
    x_etag        = prismasdwan_security_policy_global_prefix.global_prefix_main.x_etag
    x_schema      = prismasdwan_security_policy_global_prefix.global_prefix_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "security_policy_global_prefix"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_security_policy_global_prefix.global_prefix_main.tags)
}

# Prefix Counts
output "ipv4_prefixes_count" {
  description = "Number of IPv4 prefixes configured"
  value       = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes)
}

output "ipv6_prefixes_count" {
  description = "Number of IPv6 prefixes configured"
  value       = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
}

# Prefix Analysis
output "prefix_analysis" {
  description = "Analysis of the security policy global prefix configuration"
  value = {
    has_ipv4_prefixes     = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0
    has_ipv6_prefixes     = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0
    total_prefixes        = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) + length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
    has_tags              = length(prismasdwan_security_policy_global_prefix.global_prefix_main.tags) > 0
    has_description       = length(prismasdwan_security_policy_global_prefix.global_prefix_main.description) > 0
    ipv4_only             = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0 && length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) == 0
    ipv6_only             = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) == 0 && length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0
    dual_stack            = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0 && length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description     = length(prismasdwan_security_policy_global_prefix.global_prefix_main.description) > 0
    has_tags           = length(prismasdwan_security_policy_global_prefix.global_prefix_main.tags) > 0
    name_length        = length(prismasdwan_security_policy_global_prefix.global_prefix_main.name)
    desc_length        = length(prismasdwan_security_policy_global_prefix.global_prefix_main.description)
    tags_configured    = length(prismasdwan_security_policy_global_prefix.global_prefix_main.tags)
    prefixes_configured = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) + length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
  }
}

# Security Policy Global Prefix Validation
output "prefix_validation" {
  description = "Validation checks for the security policy global prefix"
  value = {
    name_valid           = length(prismasdwan_security_policy_global_prefix.global_prefix_main.name) > 0 && length(prismasdwan_security_policy_global_prefix.global_prefix_main.name) <= 128
    description_valid    = length(prismasdwan_security_policy_global_prefix.global_prefix_main.description) <= 256
    tags_count_valid     = length(prismasdwan_security_policy_global_prefix.global_prefix_main.tags) <= 10
    has_prefixes         = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0 || length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0
    has_id              = prismasdwan_security_policy_global_prefix.global_prefix_main.id != null
    has_schema          = prismasdwan_security_policy_global_prefix.global_prefix_main.x_schema != null
    has_etag            = prismasdwan_security_policy_global_prefix.global_prefix_main.x_etag != null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of the security policy global prefix configuration"
  value = {
    resource_name           = prismasdwan_security_policy_global_prefix.global_prefix_main.name
    resource_id            = prismasdwan_security_policy_global_prefix.global_prefix_main.id
    ipv4_prefixes_count     = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes)
    ipv6_prefixes_count     = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
    total_prefixes_count    = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) + length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
    tags_configured         = length(prismasdwan_security_policy_global_prefix.global_prefix_main.tags)
    description_provided    = length(prismasdwan_security_policy_global_prefix.global_prefix_main.description) > 0
  }
}

# Prefix Lists Details
output "prefix_lists" {
  description = "Detailed prefix lists"
  value = {
    ipv4_prefixes = prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes
    ipv6_prefixes = prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes
    all_prefixes  = concat(
      prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes,
      prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes
    )
  }
}

# Network Configuration Analysis
output "network_configuration" {
  description = "Network configuration analysis"
  value = {
    prefix_types = {
      ipv4_configured = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0
      ipv6_configured = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0
    }
    prefix_counts = {
      ipv4_count = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes)
      ipv6_count = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
      total_count = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) + length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes)
    }
    configuration_type = length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0 && length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0 ? "dual-stack" : (
      length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv4_prefixes) > 0 ? "ipv4-only" : (
        length(prismasdwan_security_policy_global_prefix.global_prefix_main.ipv6_prefixes) > 0 ? "ipv6-only" : "no-prefixes"
      )
    )
  }
}