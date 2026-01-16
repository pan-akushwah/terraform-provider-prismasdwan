# QoS Policy Global Prefix ID
output "qos_policy_global_prefix_id" {
  description = "The ID of the created QoS policy global prefix"
  value       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.id
}

# QoS Policy Global Prefix Name
output "qos_policy_global_prefix_name" {
  description = "The name of the created QoS policy global prefix"
  value       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.name
}

# Complete QoS Policy Global Prefix Details
output "qos_policy_global_prefix_details" {
  description = "Complete details of the created QoS policy global prefix"
  value = {
    id            = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.id
    name          = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.name
    description   = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.description
    tags          = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags
    ipv4_prefixes = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes
    ipv6_prefixes = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes
    x_etag        = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.x_etag
    x_schema      = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.x_schema
  }
}

# Basic Information
output "global_prefix_description" {
  description = "Description of the QoS policy global prefix"
  value       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.description
}

output "global_prefix_tags" {
  description = "Tags of the QoS policy global prefix"
  value       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags
}

# IP Prefix Information
output "ipv4_prefix_information" {
  description = "IPv4 prefix information"
  value = {
    ipv4_prefixes = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes
    ipv4_count    = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes) : 0
    has_ipv4      = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes != null && length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes) > 0
  }
}

output "ipv6_prefix_information" {
  description = "IPv6 prefix information"
  value = {
    ipv6_prefixes = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes
    ipv6_count    = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes) : 0
    has_ipv6      = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes != null && length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes) > 0
  }
}

# Schema and Etag (computed fields)
output "qos_policy_global_prefix_schema" {
  description = "Schema version for the QoS policy global prefix"
  value       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.x_schema
}

output "qos_policy_global_prefix_etag" {
  description = "Etag for the QoS policy global prefix"
  value       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of QoS policy global prefix configuration"
  value = {
    prefix_name       = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.name
    prefix_id         = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.id
    has_description   = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.description != null
    has_tags          = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags != null
    tag_count         = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags) : 0
    ipv4_count        = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes) : 0
    ipv6_count        = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes) : 0
    total_prefixes    = (prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes) : 0) + (prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes != null ? length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes) : 0)
    resource_type     = "qos_policy_global_prefix"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the QoS policy global prefix"
  value = {
    name_valid        = length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.name) > 0 && length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.name) <= 128
    description_valid = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.description == null ? true : length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.description) <= 256
    tags_count_valid  = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags == null ? true : length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.tags) <= 10
    has_id            = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.id != null
    has_schema        = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.x_schema != null
    has_etag          = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.x_etag != null
    has_ip_prefixes   = (prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes != null && length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv4_prefixes) > 0) || (prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes != null && length(prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.ipv6_prefixes) > 0)
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "qos_policy_global_prefix"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the QoS policy global prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "qos_policy_global_prefix"
    status         = "success"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags        = length(var.tags)
    tag_list          = var.tags
    has_terraform_tag = contains(var.tags, "terraform")
    has_qos_tag       = contains(var.tags, "qos")
    has_global_tag    = contains(var.tags, "global-prefix")
    max_tag_length    = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit = length(var.tags) <= 10
  }
}

# IP Prefix Analysis
output "ip_prefix_analysis" {
  description = "Analysis of IP prefix configuration"
  value = {
    ipv4_analysis = {
      count         = length(var.ipv4_prefixes)
      prefixes      = var.ipv4_prefixes
      has_private   = length([for prefix in var.ipv4_prefixes : prefix if can(regex("^(10\\.|172\\.(1[6-9]|2[0-9]|3[01])\\.|192\\.168\\.)", prefix))]) > 0
      rfc1918_count = length([for prefix in var.ipv4_prefixes : prefix if can(regex("^(10\\.|172\\.(1[6-9]|2[0-9]|3[01])\\.|192\\.168\\.)", prefix))])
    }
    ipv6_analysis = {
      count           = length(var.ipv6_prefixes)
      prefixes        = var.ipv6_prefixes
      has_link_local  = length([for prefix in var.ipv6_prefixes : prefix if can(regex("^fe80:", prefix))]) > 0
      has_unique_local = length([for prefix in var.ipv6_prefixes : prefix if can(regex("^fd", prefix))]) > 0
    }
    total_prefixes = length(var.ipv4_prefixes) + length(var.ipv6_prefixes)
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main ${prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.id}"
    import_block = {
      to = "prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main"
      id = prismasdwan_qos_policy_global_prefix.qos_policy_global_prefix_main.id
    }
  }
}

# API Information
output "api_information" {
  description = "API endpoint information for this resource"
  value = {
    get_api    = "/sdwan/v2.0/api/prioritypolicyglobalprefixes/{priority_policy_id}"
    post_api   = "/sdwan/v2.0/api/prioritypolicyglobalprefixes"
    put_api    = "/sdwan/v2.0/api/prioritypolicyglobalprefixes/{priority_policy_id}"
    delete_api = "/sdwan/v2.0/api/prioritypolicyglobalprefixes/{priority_policy_id}"
    api_model  = "PriorityPolicyGlobalPrefix"
  }
}

# Network Information
output "network_information" {
  description = "Network configuration details"
  value = {
    supports_ipv4     = var.ipv4_prefixes != null && length(var.ipv4_prefixes) > 0
    supports_ipv6     = var.ipv6_prefixes != null && length(var.ipv6_prefixes) > 0
    dual_stack        = (var.ipv4_prefixes != null && length(var.ipv4_prefixes) > 0) && (var.ipv6_prefixes != null && length(var.ipv6_prefixes) > 0)
    ipv4_only         = (var.ipv4_prefixes != null && length(var.ipv4_prefixes) > 0) && (var.ipv6_prefixes == null || length(var.ipv6_prefixes) == 0)
    ipv6_only         = (var.ipv6_prefixes != null && length(var.ipv6_prefixes) > 0) && (var.ipv4_prefixes == null || length(var.ipv4_prefixes) == 0)
    no_prefixes       = (var.ipv4_prefixes == null || length(var.ipv4_prefixes) == 0) && (var.ipv6_prefixes == null || length(var.ipv6_prefixes) == 0)
  }
}
    