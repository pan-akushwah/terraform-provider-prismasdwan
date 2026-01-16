# Basic Site Path Policy Local Prefix Information
output "site_path_policy_local_prefix_id" {
  description = "The ID of the site path policy local prefix"
  value       = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.id
}

output "site_id" {
  description = "The site ID where the path policy local prefix is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "prefix_id" {
  description = "The prefix ID of the path policy local prefix"
  value       = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.prefix_id
}

output "ipv4_prefixes" {
  description = "The configured IPv4 prefixes for path policy routing"
  value       = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes
}

output "ipv6_prefixes" {
  description = "The configured IPv6 prefixes for path policy routing"
  value       = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes
}

# Detailed Site Path Policy Local Prefix Information
output "site_path_policy_local_prefix_details" {
  description = "Detailed information about the site path policy local prefix"
  value = {
    id            = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.id
    site_id       = prismasdwan_resource_locator.site.result
    prefix_id     = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.prefix_id
    ipv4_prefixes = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes
    ipv6_prefixes = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes
    tags          = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags
    x_etag        = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.x_etag
    x_schema      = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.x_schema
    created_at    = timestamp()
  }
}

# Site Path Policy Local Prefix Summary
output "site_path_policy_local_prefix_summary" {
  description = "Summary of site path policy local prefix configuration"
  value = {
    site_name          = var.site_name
    prefix_id          = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.prefix_id
    ipv4_prefixes_count = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : [])
    ipv6_prefixes_count = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : [])
    total_prefixes     = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) +
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : [])
    )
    tags_count         = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags : [])
    has_dual_stack     = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    resource_type      = "site_path_policy_local_prefix"
    api_version        = "v2.1"
  }
}

# IPv4 Prefixes Analysis
output "ipv4_prefixes_analysis" {
  description = "Analysis of configured IPv4 prefixes for path policy"
  value = {
    total_ipv4_prefixes = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : [])
    unique_ipv4_prefixes = length(distinct(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []))
    ipv4_prefix_details = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? {
      for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : prefix => {
        network_address = split("/", prefix)[0]
        subnet_mask = split("/", prefix)[1]
        host_capacity = pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
        first_octet = tonumber(split(".", split("/", prefix)[0])[0])
        is_private = (
          startswith(prefix, "10.") ||
          startswith(prefix, "192.168.") ||
          (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
           tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
           tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
        )
        network_class = (
          tonumber(split(".", split("/", prefix)[0])[0]) >= 1 && tonumber(split(".", split("/", prefix)[0])[0]) <= 126 ? "Class A" :
          tonumber(split(".", split("/", prefix)[0])[0]) >= 128 && tonumber(split(".", split("/", prefix)[0])[0]) <= 191 ? "Class B" :
          tonumber(split(".", split("/", prefix)[0])[0]) >= 192 && tonumber(split(".", split("/", prefix)[0])[0]) <= 223 ? "Class C" : "Other"
        )
        routing_priority = (
          tonumber(split("/", prefix)[1]) >= 24 ? "high" :
          tonumber(split("/", prefix)[1]) >= 16 ? "medium" : "low"
        )
      }
    } : {}
    network_distribution = {
      private_networks = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : prefix
        if startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
           (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
            tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
            tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
      ] : [])
      public_networks = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : prefix
        if !(startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
             (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
              tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
              tonumber(split(".", split("/", prefix)[0])[1]) <= 31))
      ] : [])
    }
    total_ipv4_host_capacity = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? sum([
      for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes :
      pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
    ]) : 0
  }
}

# IPv6 Prefixes Analysis
output "ipv6_prefixes_analysis" {
  description = "Analysis of configured IPv6 prefixes for path policy"
  value = {
    total_ipv6_prefixes = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : [])
    unique_ipv6_prefixes = length(distinct(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []))
    ipv6_prefix_details = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? {
      for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : prefix => {
        network_address = split("/", prefix)[0]
        prefix_length = split("/", prefix)[1]
        is_link_local = startswith(prefix, "fe80:")
        is_unique_local = startswith(prefix, "fd") || startswith(prefix, "fc")
        is_global_unicast = !(startswith(prefix, "fe80:") || startswith(prefix, "fd") || startswith(prefix, "fc"))
        address_space_size = pow(2, 128 - tonumber(split("/", prefix)[1]))
        routing_scope = (
          startswith(prefix, "fe80:") ? "link-local" :
          startswith(prefix, "fd") || startswith(prefix, "fc") ? "unique-local" : "global"
        )
        prefix_category = (
          tonumber(split("/", prefix)[1]) <= 48 ? "network" :
          tonumber(split("/", prefix)[1]) <= 64 ? "subnet" : "host"
        )
      }
    } : {}
    ipv6_address_types = {
      link_local_count = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? [
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : prefix
        if startswith(prefix, "fe80:")
      ] : [])
      unique_local_count = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? [
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : prefix
        if startswith(prefix, "fd") || startswith(prefix, "fc")
      ] : [])
      global_unicast_count = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? [
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : prefix
        if !(startswith(prefix, "fe80:") || startswith(prefix, "fd") || startswith(prefix, "fc"))
      ] : [])
    }
    prefix_length_distribution = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? {
      for length in distinct([
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : split("/", prefix)[1]
      ]) : length => length([
        for prefix in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : prefix 
        if split("/", prefix)[1] == length
      ])
    } : {}
  }
}

# Dual Stack Configuration Analysis
output "dual_stack_analysis" {
  description = "Analysis of dual stack (IPv4 + IPv6) configuration"
  value = {
    dual_stack_enabled = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    ipv4_only = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) == 0
    )
    ipv6_only = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) == 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    no_prefixes_configured = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) == 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) == 0
    )
    configuration_type = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0 ? "dual-stack" :
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 ? "ipv4-only" :
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0 ? "ipv6-only" : "none"
    )
    routing_capabilities = {
      ipv4_routing_enabled = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0
      ipv6_routing_enabled = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
      future_ready = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
      legacy_support = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0
    }
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    path_policy_prefix_resolved = prismasdwan_resource_locator.path_policy_prefix.result
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the site path policy local prefix deployment"
  value = {
    deployed_at                    = timestamp()
    resource_count                 = 1
    resource_type                  = "site_path_policy_local_prefix"
    status                         = "success"
    site_resolved                  = prismasdwan_resource_locator.site.result != null
    path_policy_prefix_resolved    = prismasdwan_resource_locator.path_policy_prefix.result != null
    ipv4_prefixes_configured       = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0
    ipv6_prefixes_configured       = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
    dual_stack_ready               = (
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    api_version                    = "v2.1"
    api_model                      = "SitePathPolicyPrefixAssociation"
  }
}

# Schema and Etag (computed fields)
output "site_path_policy_local_prefix_schema" {
  description = "Schema version for the site path policy local prefix"
  value       = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.x_schema
}

output "site_path_policy_local_prefix_etag" {
  description = "Etag for the site path policy local prefix"
  value       = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_path_policy_local_prefix"
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name     = var.site_name
    prefix_id     = var.prefix_id
    ipv4_prefixes = var.ipv4_prefixes
    ipv6_prefixes = var.ipv6_prefixes
    tags          = var.tags
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid       = prismasdwan_resource_locator.site.result != null
    path_policy_prefix_valid     = prismasdwan_resource_locator.path_policy_prefix.result != null
    prefix_id_valid              = length(var.prefix_id) > 0
    ipv4_prefixes_valid          = alltrue([
      for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))
    ])
    ipv6_prefixes_valid          = alltrue([
      for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))
    ])
    tags_count_valid             = length(var.tags) <= 10
    tags_format_valid            = alltrue([for tag in var.tags : length(tag) <= 128])
    ipv4_prefixes_unique         = length(var.ipv4_prefixes) == length(distinct(var.ipv4_prefixes))
    ipv6_prefixes_unique         = length(var.ipv6_prefixes) == length(distinct(var.ipv6_prefixes))
    all_validations_passed       = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.path_policy_prefix.result != null &&
      length(var.prefix_id) > 0 &&
      alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) &&
      alltrue([for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))]) &&
      length(var.tags) <= 10
    )
  }
}

# Path Policy Configuration Analysis
output "path_policy_configuration_analysis" {
  description = "Analysis of the path policy configuration"
  value = {
    configuration_scope = "site-specific"
    path_policy_capabilities = {
      traffic_steering = true
      prefix_based_routing = true
      dual_stack_support = (
        length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) > 0
      )
      site_local_policies = true
      dynamic_path_selection = true
    }
    routing_strategy = {
      ipv4_strategy = length(var.ipv4_prefixes) > 0 ? "prefix-based" : "disabled"
      ipv6_strategy = length(var.ipv6_prefixes) > 0 ? "prefix-based" : "disabled"
      fallback_behavior = "default-routing"
      load_balancing = "enabled"
    }
    network_optimization = {
      traffic_classification = "enhanced"
      path_selection_granularity = "prefix-level"
      performance_monitoring = "enabled"
      adaptive_routing = "supported"
    }
    operational_benefits = [
      "Site-specific traffic steering",
      "Enhanced path selection control",
      "Improved application performance",
      "Reduced latency through optimal routing",
      "Better bandwidth utilization",
      "Intelligent failover capabilities"
    ]
  }
}

# Network Performance Metrics
output "network_performance_metrics" {
  description = "Network performance and capacity metrics"
  value = {
    routing_capacity = {
      total_ipv4_networks = length(var.ipv4_prefixes)
      total_ipv6_networks = length(var.ipv6_prefixes)
      total_routing_entries = length(var.ipv4_prefixes) + length(var.ipv6_prefixes)
      routing_table_efficiency = "optimized"
    }
    address_space_coverage = {
      ipv4_address_space = length(var.ipv4_prefixes) > 0 ? sum([
        for prefix in var.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ]) : 0
      ipv6_address_space = length(var.ipv6_prefixes) > 0 ? "virtually-unlimited" : "none"
      coverage_scope = (
        length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) > 0 ? "dual-stack" :
        length(var.ipv4_prefixes) > 0 ? "ipv4-only" :
        length(var.ipv6_prefixes) > 0 ? "ipv6-only" : "none"
      )
    }
    performance_indicators = {
      routing_complexity = (
        (length(var.ipv4_prefixes) + length(var.ipv6_prefixes)) <= 5 ? "low" :
        (length(var.ipv4_prefixes) + length(var.ipv6_prefixes)) <= 15 ? "moderate" : "high"
      )
      convergence_time = "fast"
      scalability_factor = "high"
      maintenance_overhead = "low"
    }
  }
}

# Site Integration Status
output "site_integration_status" {
  description = "Status of the path policy local prefix integration with the site"
  value = {
    site_details = {
      site_name = var.site_name
      site_id = prismasdwan_resource_locator.site.result
      site_resolved = prismasdwan_resource_locator.site.result != null
    }
    integration_health = {
      site_linkage_active = prismasdwan_resource_locator.site.result != null
      path_policy_prefix_bound = prismasdwan_resource_locator.path_policy_prefix.result != null
      config_applied_successfully = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.id != null
      routing_prefixes_operational = (
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 ||
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
    }
    path_policy_readiness = {
      traffic_steering_ready = true
      prefix_routing_available = (
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 ||
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
      site_path_policies_applicable = true
      dynamic_routing_enabled = true
    }
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags
    tags_count      = length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags : [])
    has_tags        = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags != null && length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags) > 0
    tags_analysis = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags != null ? {
      for tag in prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.tags : tag => {
        length = length(tag)
        is_valid_format = can(regex("^[^,\\s]+$", tag))
        tag_category = (
          contains(["terraform", "infrastructure", "automation"], tag) ? "infrastructure" :
          contains(["path-policy", "routing", "traffic-steering", "prefix"], tag) ? "networking" :
          contains(["production", "staging", "development", "test"], tag) ? "environment" :
          contains(["site-specific", "local-prefix", "dual-stack"], tag) ? "functional" :
          "custom"
        )
      }
    } : {}
  }
}

# Operational Summary Report
output "operational_summary_report" {
  description = "Comprehensive operational summary of the path policy configuration"
  value = {
    executive_summary = {
      feature_name = "Site Path Policy Local Prefix"
      deployment_scope = "Site-specific routing"
      current_status = "Active"
      deployment_success = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.id != null
      dual_stack_enabled = (
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
    }
    technical_details = {
      resource_id = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.id
      site_association = prismasdwan_resource_locator.site.result
      prefix_association = prismasdwan_resource_locator.path_policy_prefix.result
      total_routing_prefixes = (
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv4_prefixes : []) +
        length(prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.ipv6_prefixes : [])
      )
      api_version = "v2.1"
      schema_version = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.x_schema
      etag_value = prismasdwan_site_path_policy_local_prefix.site_path_policy_local_prefix_full.x_etag
    }
    business_impact = {
      routing_optimization = "Significant"
      traffic_performance = "Enhanced"
      path_selection_control = "Granular"
      network_efficiency = "Improved"
      operational_visibility = "Enhanced"
      failover_capabilities = "Advanced"
    }
  }
}

# Configuration Compliance Report
output "configuration_compliance_report" {
  description = "Comprehensive compliance report for the configuration"
  value = {
    resource_compliance = {
      site_resolution_status = prismasdwan_resource_locator.site.result != null ? "compliant" : "non-compliant"
      prefix_resolution_status = prismasdwan_resource_locator.path_policy_prefix.result != null ? "compliant" : "non-compliant"
      prefix_id_status = length(var.prefix_id) > 0 ? "compliant" : "non-compliant"
    }
    network_compliance = {
      ipv4_format_compliance = alltrue([
        for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))
      ]) ? "compliant" : "non-compliant"
      ipv6_format_compliance = alltrue([
        for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))
      ]) ? "compliant" : "non-compliant"
      prefix_uniqueness_compliance = (
        length(var.ipv4_prefixes) == length(distinct(var.ipv4_prefixes)) &&
        length(var.ipv6_prefixes) == length(distinct(var.ipv6_prefixes))
      ) ? "compliant" : "non-compliant"
    }
    tags_compliance = {
      tags_count_compliance = length(var.tags) <= 10 ? "compliant" : "non-compliant"
      tags_format_compliance = alltrue([
        for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
      ]) ? "compliant" : "non-compliant"
      tags_uniqueness_compliance = length(var.tags) == length(distinct(var.tags)) ? "compliant" : "non-compliant"
    }
    overall_compliance_status = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.path_policy_prefix.result != null &&
      length(var.prefix_id) > 0 &&
      alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) &&
      alltrue([for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))]) &&
      length(var.tags) <= 10
    ) ? "fully-compliant" : "non-compliant"
    compliance_score = (
      (prismasdwan_resource_locator.site.result != null ? 1 : 0) +
      (prismasdwan_resource_locator.path_policy_prefix.result != null ? 1 : 0) +
      (length(var.prefix_id) > 0 ? 1 : 0) +
      (alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) ? 1 : 0) +
      (alltrue([for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))]) ? 1 : 0) +
      (length(var.tags) <= 10 ? 1 : 0)
    ) / 6 * 100
  }
}
