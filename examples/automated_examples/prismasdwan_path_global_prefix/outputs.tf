# Path Global Prefix ID
output "path_global_prefix_id" {
  description = "The ID of the created path global prefix"
  value       = prismasdwan_path_global_prefix.path_global_prefix_main.id
}

# Path Global Prefix Name
output "path_global_prefix_name" {
  description = "The name of the created path global prefix"
  value       = prismasdwan_path_global_prefix.path_global_prefix_main.name
}

# Complete Path Global Prefix Details
output "path_global_prefix_details" {
  description = "Complete details of the created path global prefix"
  value = {
    id            = prismasdwan_path_global_prefix.path_global_prefix_main.id
    name          = prismasdwan_path_global_prefix.path_global_prefix_main.name
    description   = prismasdwan_path_global_prefix.path_global_prefix_main.description
    tags          = prismasdwan_path_global_prefix.path_global_prefix_main.tags
    ipv4_prefixes = prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes
    ipv6_prefixes = prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes
    x_etag        = prismasdwan_path_global_prefix.path_global_prefix_main.x_etag
    x_schema      = prismasdwan_path_global_prefix.path_global_prefix_main.x_schema
  }
}

# Basic Information
output "global_prefix_description" {
  description = "Description of the path global prefix"
  value       = prismasdwan_path_global_prefix.path_global_prefix_main.description
}

output "global_prefix_tags" {
  description = "Tags of the path global prefix"
  value       = prismasdwan_path_global_prefix.path_global_prefix_main.tags
}

# IP Prefix Information
output "ipv4_prefix_information" {
  description = "IPv4 prefix information"
  value = {
    ipv4_prefixes = prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes
    ipv4_count    = prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes) : 0
    has_ipv4      = prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes != null && length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes) > 0
  }
}

output "ipv6_prefix_information" {
  description = "IPv6 prefix information"
  value = {
    ipv6_prefixes = prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes
    ipv6_count    = prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes) : 0
    has_ipv6      = prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes != null && length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes) > 0
  }
}

# Schema and Etag (computed fields)
output "path_global_prefix_schema" {
  description = "Schema version for the path global prefix"
  value       = prismasdwan_path_global_prefix.path_global_prefix_main.x_schema
}

output "path_global_prefix_etag" {
  description = "Etag for the path global prefix"
  value       = prismasdwan_path_global_prefix.path_global_prefix_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of path global prefix configuration"
  value = {
    prefix_name       = prismasdwan_path_global_prefix.path_global_prefix_main.name
    prefix_id         = prismasdwan_path_global_prefix.path_global_prefix_main.id
    has_description   = prismasdwan_path_global_prefix.path_global_prefix_main.description != null
    has_tags          = prismasdwan_path_global_prefix.path_global_prefix_main.tags != null
    tag_count         = prismasdwan_path_global_prefix.path_global_prefix_main.tags != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.tags) : 0
    ipv4_count        = prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes) : 0
    ipv6_count        = prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes) : 0
    total_prefixes    = (prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes) : 0) + (prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes != null ? length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes) : 0)
    resource_type     = "path_global_prefix"
    api_category      = "networkpolicyglobalprefixes"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the path global prefix"
  value = {
    name_valid        = length(prismasdwan_path_global_prefix.path_global_prefix_main.name) > 0 && length(prismasdwan_path_global_prefix.path_global_prefix_main.name) <= 128
    description_valid = prismasdwan_path_global_prefix.path_global_prefix_main.description == null ? true : length(prismasdwan_path_global_prefix.path_global_prefix_main.description) <= 256
    tags_count_valid  = prismasdwan_path_global_prefix.path_global_prefix_main.tags == null ? true : length(prismasdwan_path_global_prefix.path_global_prefix_main.tags) <= 10
    has_id            = prismasdwan_path_global_prefix.path_global_prefix_main.id != null
    has_schema        = prismasdwan_path_global_prefix.path_global_prefix_main.x_schema != null
    has_etag          = prismasdwan_path_global_prefix.path_global_prefix_main.x_etag != null
    has_ip_prefixes   = (prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes != null && length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv4_prefixes) > 0) || (prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes != null && length(prismasdwan_path_global_prefix.path_global_prefix_main.ipv6_prefixes) > 0)
    id_is_transient   = true
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "path_global_prefix"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the path global prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "path_global_prefix"
    status         = "success"
    api_version    = "v2.1"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags         = length(var.tags)
    tag_list           = var.tags
    has_terraform_tag  = contains(var.tags, "terraform")
    has_path_tag       = contains(var.tags, "path")
    has_global_tag     = contains(var.tags, "global-prefix")
    has_routing_tag    = contains(var.tags, "routing")
    max_tag_length     = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit  = length(var.tags) <= 10
    all_tags_valid     = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
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
      has_public    = length([for prefix in var.ipv4_prefixes : prefix if !can(regex("^(10\\.|172\\.(1[6-9]|2[0-9]|3[01])\\.|192\\.168\\.)", prefix))]) > 0
    }
    ipv6_analysis = {
      count             = length(var.ipv6_prefixes)
      prefixes          = var.ipv6_prefixes
      has_link_local    = length([for prefix in var.ipv6_prefixes : prefix if can(regex("^fe80:", prefix))]) > 0
      has_unique_local  = length([for prefix in var.ipv6_prefixes : prefix if can(regex("^fd", prefix))]) > 0
      has_global_unicast = length([for prefix in var.ipv6_prefixes : prefix if can(regex("^2001:", prefix))]) > 0
    }
    total_prefixes = length(var.ipv4_prefixes) + length(var.ipv6_prefixes)
    prefix_types = {
      ipv4_only = length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) == 0
      ipv6_only = length(var.ipv6_prefixes) > 0 && length(var.ipv4_prefixes) == 0
      dual_stack = length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) > 0
      no_prefixes = length(var.ipv4_prefixes) == 0 && length(var.ipv6_prefixes) == 0
    }
  }
}

# Network Policy Information
output "network_policy_information" {
  description = "Network policy related information"
  value = {
    policy_type       = "global_prefix"
    scope             = "global"
    applies_to        = "network_policy"
    routing_context   = "global_prefix_based"
    classification    = "traffic_classification"
    prefix_type       = "networkpolicyglobalprefixes"
    supports_ipv4     = var.ipv4_prefixes != null && length(var.ipv4_prefixes) > 0
    supports_ipv6     = var.ipv6_prefixes != null && length(var.ipv6_prefixes) > 0
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_path_global_prefix.path_global_prefix_main ${prismasdwan_path_global_prefix.path_global_prefix_main.id}"
    import_block = {
      to = "prismasdwan_path_global_prefix.path_global_prefix_main"
      id = prismasdwan_path_global_prefix.path_global_prefix_main.id
    }
  }
}

# API Information
output "api_information" {
  description = "API endpoint information for this resource"
  value = {
    get_api    = "/sdwan/v2.1/api/networkpolicyglobalprefixes/{prefix_id}"
    post_api   = "/sdwan/v2.1/api/networkpolicyglobalprefixes"
    put_api    = "/sdwan/v2.1/api/networkpolicyglobalprefixes/{prefix_id}"
    delete_api = "/sdwan/v2.1/api/networkpolicyglobalprefixes/{prefix_id}"
    api_model  = "NetworkPolicyGlobalPrefix"
    api_version = "v2.1"
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
    global_scope      = true
    prefix_category   = "network_policy"
  }
}

# Schema Information
output "schema_information" {
  description = "Schema and structure information"
  value = {
    required_fields = ["name"]
    optional_fields = ["description", "tags", "ipv4_prefixes", "ipv6_prefixes"]
    computed_fields = ["id", "_etag", "_schema"]
    id_type         = "transient"
    etag_minimum    = 1
    schema_minimum  = 1
    max_tags        = 10
    max_tag_length  = 128
    tag_regex       = "^[^,\\\\s]+$"
    supports_arrays = ["ipv4_prefixes", "ipv6_prefixes", "tags"]
  }
}

# Usage Examples
output "usage_examples" {
  description = "Usage examples and best practices"
  value = {
    use_cases = [
      "Global network policy routing",
      "Enterprise-wide traffic classification",
      "Multi-site prefix management",
      "Global policy-based routing",
      "Cross-regional traffic engineering"
    ]
    best_practices = [
      "Use descriptive names for easy identification",
      "Tag resources for better organization and filtering",
      "Keep descriptions under 256 characters",
      "Avoid commas and whitespace in tags",
      "Use standard CIDR notation for prefixes",
      "Consider IPv4 and IPv6 dual-stack deployment",
      "Group related prefixes logically"
    ]
    related_resources = [
      "prismasdwan_network_policy",
      "prismasdwan_path_local_prefix",
      "prismasdwan_routing_policy",
      "prismasdwan_policy_set"
    ]
    cidr_examples = {
      ipv4_private = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
      ipv4_public  = ["203.0.113.0/24", "198.51.100.0/24"]
      ipv6_unique_local = ["fd00::/8", "fc00::/7"]
      ipv6_global = ["2001:db8::/32", "2001::/16"]
    }
  }
}

# Routing Analysis
output "routing_analysis" {
  description = "Routing-specific analysis and recommendations"
  value = {
    prefix_summary = {
      total_prefixes    = length(var.ipv4_prefixes) + length(var.ipv6_prefixes)
      ipv4_prefixes     = length(var.ipv4_prefixes)
      ipv6_prefixes     = length(var.ipv6_prefixes)
      has_prefixes      = length(var.ipv4_prefixes) > 0 || length(var.ipv6_prefixes) > 0
    }
    routing_capabilities = {
      global_routing    = true
      traffic_steering  = true
      path_selection    = true
      policy_enforcement = true
      multi_protocol    = length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) > 0
    }
    deployment_scope = {
      enterprise_wide   = true
      multi_site        = true
      global_policies   = true
      centralized_mgmt  = true
    }
  }
}
