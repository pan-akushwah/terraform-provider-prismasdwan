# NAT Global Prefix ID
output "nat_global_prefix_id" {
  description = "The ID of the created NAT global prefix"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.id
}

# NAT Global Prefix Name
output "nat_global_prefix_name" {
  description = "The name of the created NAT global prefix"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.name
}

# Complete NAT Global Prefix Details
output "nat_global_prefix_details" {
  description = "Complete details of the created NAT global prefix"
  value = {
    id            = prismasdwan_nat_global_prefix.nat_global_prefix_main.id
    name          = prismasdwan_nat_global_prefix.nat_global_prefix_main.name
    description   = prismasdwan_nat_global_prefix.nat_global_prefix_main.description
    tags          = prismasdwan_nat_global_prefix.nat_global_prefix_main.tags
    ipv4_prefixes = prismasdwan_nat_global_prefix.nat_global_prefix_main.ipv4_prefixes
    x_etag        = prismasdwan_nat_global_prefix.nat_global_prefix_main.x_etag
    x_schema      = prismasdwan_nat_global_prefix.nat_global_prefix_main.x_schema
  }
}

# Basic Information
output "prefix_description" {
  description = "Description of the NAT global prefix"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.description
}

output "prefix_tags" {
  description = "Tags of the NAT global prefix"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.tags
}

output "ipv4_prefixes" {
  description = "IPv4 prefixes configured"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.ipv4_prefixes
}

# Schema and Etag (computed fields)
output "nat_global_prefix_schema" {
  description = "Schema version for the NAT global prefix"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.x_schema
}

output "nat_global_prefix_etag" {
  description = "Etag for the NAT global prefix"
  value       = prismasdwan_nat_global_prefix.nat_global_prefix_main.x_etag
}

# IPv4 Prefixes Analysis
output "ipv4_prefixes_analysis" {
  description = "Analysis of IPv4 prefixes configuration"
  value = {
    total_prefixes     = length(var.ipv4_prefixes)
    prefix_list        = var.ipv4_prefixes
    first_prefix       = length(var.ipv4_prefixes) > 0 ? var.ipv4_prefixes[0] : null
    has_private_ranges = length([
      for prefix in var.ipv4_prefixes : prefix
      if can(regex("^(10\\.|172\\.(1[6-9]|2[0-9]|3[01])\\.|192\\.168\\.)", prefix))
    ]) > 0
    has_public_ranges = length([
      for prefix in var.ipv4_prefixes : prefix
      if !can(regex("^(10\\.|172\\.(1[6-9]|2[0-9]|3[01])\\.|192\\.168\\.)", prefix))
    ]) > 0
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of NAT global prefix configuration"
  value = {
    prefix_name         = prismasdwan_nat_global_prefix.nat_global_prefix_main.name
    prefix_id           = prismasdwan_nat_global_prefix.nat_global_prefix_main.id
    has_description     = prismasdwan_nat_global_prefix.nat_global_prefix_main.description != null
    has_tags            = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.tags) > 0
    has_ipv4_prefixes   = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.ipv4_prefixes) > 0
    tag_count           = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.tags)
    prefix_count        = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.ipv4_prefixes)
    resource_type       = "nat_global_prefix"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the NAT global prefix"
  value = {
    name_valid          = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.name) > 0 && length(prismasdwan_nat_global_prefix.nat_global_prefix_main.name) <= 128
    description_valid   = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.description) <= 256
    tags_count_valid    = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.tags) <= 10
    has_valid_prefixes  = length(prismasdwan_nat_global_prefix.nat_global_prefix_main.ipv4_prefixes) > 0
    has_id              = prismasdwan_nat_global_prefix.nat_global_prefix_main.id != null
    has_schema          = prismasdwan_nat_global_prefix.nat_global_prefix_main.x_schema != null
    has_etag            = prismasdwan_nat_global_prefix.nat_global_prefix_main.x_etag != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "nat_global_prefix"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the NAT global prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "nat_global_prefix"
    status         = "success"
  }
}

# Network Information
output "network_information" {
  description = "Network information about the configured prefixes"
  value = {
    configured_networks = [
      for prefix in var.ipv4_prefixes : {
        network = prefix
        network_address = cidrhost(prefix, 0)
        netmask_bits = split("/", prefix)[1]
        total_ips = pow(2, 32 - tonumber(split("/", prefix)[1]))
        usable_ips = pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      }
    ]
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags           = length(var.tags)
    tag_list             = var.tags
    has_terraform_tag    = contains(var.tags, "Terraform")
    max_tag_length       = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit    = length(var.tags) <= 10
  }
}

# Prefix Statistics
output "prefix_statistics" {
  description = "Statistics about the IPv4 prefixes"
  value = {
    total_prefixes = length(var.ipv4_prefixes)
    prefix_types = {
      class_a = length([for p in var.ipv4_prefixes : p if tonumber(split(".", split("/", p)[0])[0]) < 128])
      class_b = length([for p in var.ipv4_prefixes : p if tonumber(split(".", split("/", p)[0])[0]) >= 128 && tonumber(split(".", split("/", p)[0])[0]) < 192])
      class_c = length([for p in var.ipv4_prefixes : p if tonumber(split(".", split("/", p)[0])[0]) >= 192 && tonumber(split(".", split("/", p)[0])[0]) < 224])
    }
    subnet_sizes = [for p in var.ipv4_prefixes : "/${split("/", p)[1]}"]
  }
}