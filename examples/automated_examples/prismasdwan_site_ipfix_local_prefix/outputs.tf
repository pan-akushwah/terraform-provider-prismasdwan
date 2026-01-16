# Basic IPFix Local Prefix Information
output "ipfix_local_prefix_id" {
  description = "The ID of the IPFix local prefix configuration"
  value       = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.id
}

output "site_id" {
  description = "The site ID where the IPFix local prefix is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "prefix_id" {
  description = "The prefix ID of the IPFix local prefix configuration"
  value       = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.prefix_id
}

# Detailed IPFix Local Prefix Information
output "ipfix_local_prefix_details" {
  description = "Detailed information about the IPFix local prefix configuration"
  value = {
    id            = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.id
    site_id       = prismasdwan_resource_locator.site.result
    prefix_id     = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.prefix_id
    ipv4_prefixes = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes
    tags          = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags
    x_etag        = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.x_etag
    x_schema      = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.x_schema
    created_at    = timestamp()
  }
}

# IPFix Configuration Summary
output "ipfix_configuration_summary" {
  description = "Summary of IPFix local prefix configuration"
  value = {
    site_name           = var.site_name
    prefix_id           = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.prefix_id
    ipv4_prefixes_count = length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes : [])
    has_ipv4_prefixes   = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null && length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes) > 0
    has_tags            = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags != null && length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags) > 0
    tags_count          = length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags != null ? prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags : [])
    resource_type       = "site_ipfix_local_prefix"
    api_version         = "v2.0"
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the IPFix local prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "site_ipfix_local_prefix"
    status         = "success"
    site_resolved  = prismasdwan_resource_locator.site.result != null
    api_version    = "v2.0"
    api_model      = "SiteIPFixPrefixAssociationScreen"
  }
}

# Schema and Etag (computed fields)
output "ipfix_schema" {
  description = "Schema version for the IPFix local prefix"
  value       = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.x_schema
}

output "ipfix_etag" {
  description = "Etag for the IPFix local prefix"
  value       = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_ipfix_local_prefix"
}

# Network Configuration Analysis
output "network_configuration_analysis" {
  description = "Analysis of the network configuration"
  value = {
    total_prefixes = length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes : [])
    prefix_summary = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null ? [
      for prefix in prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes : {
        network = split("/", prefix)[0]
        subnet_mask = split("/", prefix)[1]
        is_private = contains([
          "10.",
          "172.16.", "172.17.", "172.18.", "172.19.", "172.20.", "172.21.", "172.22.", "172.23.",
          "172.24.", "172.25.", "172.26.", "172.27.", "172.28.", "172.29.", "172.30.", "172.31.",
          "192.168."
        ], substr(prefix, 0, min(length(prefix), 8)))
      }
    ] : []
  }
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name     = var.site_name
    prefix_id     = var.prefix_id
    ipv4_prefixes = var.ipv4_prefixes
    tags          = var.tags
  }
}

# IPv4 Prefixes Information
output "ipv4_prefixes_info" {
  description = "Detailed information about configured IPv4 prefixes"
  value = {
    configured_prefixes = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes
    prefixes_count      = length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes : [])
    has_prefixes        = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null && length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes) > 0
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags
    tags_count      = length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags != null ? prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags : [])
    has_tags        = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags != null && length(prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags) > 0
  }
}

# Configuration Validation Status
output "configuration_status" {
  description = "Status of configuration validation"
  value = {
    prefix_id_configured    = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.prefix_id != null
    ipv4_prefixes_provided  = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.ipv4_prefixes != null
    tags_provided           = prismasdwan_site_ipfix_local_prefix.site_ipfix_local_prefix_full.tags != null
    site_association_valid  = prismasdwan_resource_locator.site.result != null
  }
}