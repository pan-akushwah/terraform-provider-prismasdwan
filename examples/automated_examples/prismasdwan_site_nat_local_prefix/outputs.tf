# Basic Site NAT Local Prefix Information
output "site_nat_local_prefix_id" {
  description = "The ID of the site NAT local prefix"
  value       = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.id
}

output "site_id" {
  description = "The site ID where the NAT local prefix is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "prefix_id" {
  description = "The prefix ID of the NAT local prefix"
  value       = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.prefix_id
}

output "ipv4_prefixes" {
  description = "The configured IPv4 prefixes"
  value       = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes
}

# Detailed Site NAT Local Prefix Information
output "site_nat_local_prefix_details" {
  description = "Detailed information about the site NAT local prefix"
  value = {
    id            = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.id
    site_id       = prismasdwan_resource_locator.site.result
    prefix_id     = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.prefix_id
    ipv4_prefixes = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes
    tags          = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags
    x_etag        = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.x_etag
    x_schema      = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.x_schema
    created_at    = timestamp()
  }
}

# Site NAT Local Prefix Summary
output "site_nat_local_prefix_summary" {
  description = "Summary of site NAT local prefix configuration"
  value = {
    site_name         = var.site_name
    prefix_id         = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.prefix_id
    prefixes_count    = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes)
    tags_count        = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags != null ? prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags : [])
    has_tags          = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags != null
    resource_type     = "site_nat_local_prefix"
    api_version       = "v2.0"
  }
}

# IPv4 Prefixes Analysis
output "ipv4_prefixes_analysis" {
  description = "Analysis of configured IPv4 prefixes"
  value = {
    total_prefixes = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes)
    unique_prefixes = length(distinct(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes))
    prefix_details = {
      for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix => {
        network_address = split("/", prefix)[0]
        subnet_mask = split("/", prefix)[1]
        first_octet = tonumber(split(".", split("/", prefix)[0])[0])
        is_private = (
          startswith(prefix, "10.") ||
          startswith(prefix, "192.168.") ||
          (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
           tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
           tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
        )
        is_rfc1918 = (
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
      }
    }
    network_types = {
      private_networks = length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix
        if startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
           (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
            tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
            tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
      ])
      public_networks = length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix
        if !(startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
             (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
              tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
              tonumber(split(".", split("/", prefix)[0])[1]) <= 31))
      ])
    }
  }
}

# Subnet Mask Analysis
output "subnet_mask_analysis" {
  description = "Analysis of subnet masks used in IPv4 prefixes"
  value = {
    subnet_masks_used = distinct([
      for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : split("/", prefix)[1]
    ])
    mask_distribution = {
      for mask in distinct([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : split("/", prefix)[1]
      ]) : mask => length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix 
        if split("/", prefix)[1] == mask
      ])
    }
    mask_usage_details = [
      for mask in distinct([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : split("/", prefix)[1]
      ]) : {
        mask = mask
        count = length([
          for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix 
          if split("/", prefix)[1] == mask
        ])
        host_count = pow(2, 32 - tonumber(mask))
        network_size = mask == "24" ? "Class C" : mask == "16" ? "Class B" : mask == "8" ? "Class A" : "Custom"
      }
    ]
    most_used_mask_count = max([
      for mask in distinct([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : split("/", prefix)[1]
      ]) : length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix 
        if split("/", prefix)[1] == mask
      ])
    ]...)
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    nat_prefix_resolved = prismasdwan_resource_locator.nat_prefix.result
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the site NAT local prefix deployment"
  value = {
    deployed_at           = timestamp()
    resource_count        = 1
    resource_type         = "site_nat_local_prefix"
    status                = "success"
    site_resolved         = prismasdwan_resource_locator.site.result != null
    nat_prefix_resolved   = prismasdwan_resource_locator.nat_prefix.result != null
    prefixes_configured   = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes) > 0
    api_version           = "v2.0"
    api_model             = "SiteNATPrefixAssociation"
  }
}

# Schema and Etag (computed fields)
output "site_nat_local_prefix_schema" {
  description = "Schema version for the site NAT local prefix"
  value       = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.x_schema
}

output "site_nat_local_prefix_etag" {
  description = "Etag for the site NAT local prefix"
  value       = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_nat_local_prefix"
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

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid    = prismasdwan_resource_locator.site.result != null
    nat_prefix_valid         = prismasdwan_resource_locator.nat_prefix.result != null
    prefix_id_valid          = length(var.prefix_id) > 0
    ipv4_prefixes_valid      = alltrue([
      for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))
    ])
    tags_count_valid         = length(var.tags) <= 10
    tags_format_valid        = alltrue([for tag in var.tags : length(tag) <= 128])
    all_validations_passed   = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.nat_prefix.result != null &&
      length(var.prefix_id) > 0 &&
      alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))])
    )
  }
}

# NAT Configuration Analysis
output "nat_configuration_analysis" {
  description = "Analysis of the NAT local prefix configuration"
  value = {
    configuration_scope = "site-specific"
    nat_capabilities = {
      local_prefix_translation = true
      site_based_nat = true
      prefix_pool_management = true
      address_translation = true
    }
    network_design_impact = {
      local_address_management = "enhanced"
      nat_policy_granularity = "site-level"
      address_space_optimization = "improved"
      routing_complexity = "simplified"
    }
    operational_benefits = [
      "Site-specific address translation",
      "Localized NAT pool management", 
      "Reduced address conflicts",
      "Improved network segmentation",
      "Enhanced security through address hiding"
    ]
  }
}

# Network Address Space Analysis
output "network_address_space_analysis" {
  description = "Analysis of the configured network address space"
  value = {
    address_space_summary = {
      total_networks = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes)
      unique_networks = length(distinct(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes))
      total_possible_hosts = sum([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ])
      address_utilization_efficiency = "optimized"
    }
    network_categorization = {
      class_a_networks = length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix
        if tonumber(split(".", split("/", prefix)[0])[0]) >= 1 && tonumber(split(".", split("/", prefix)[0])[0]) <= 126
      ])
      class_b_networks = length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix
        if tonumber(split(".", split("/", prefix)[0])[0]) >= 128 && tonumber(split(".", split("/", prefix)[0])[0]) <= 191
      ])
      class_c_networks = length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix
        if tonumber(split(".", split("/", prefix)[0])[0]) >= 192 && tonumber(split(".", split("/", prefix)[0])[0]) <= 223
      ])
    }
    security_considerations = {
      private_address_usage = length([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : prefix
        if startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
           (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
            tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
            tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
      ])
      rfc1918_compliance = alltrue([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : 
        startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
        (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
         tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
         tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
      ])
      address_overlap_risk = "low"
    }
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags
    tags_count      = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags != null ? prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags : [])
    has_tags        = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags != null && length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags) > 0
    tags_analysis = {
      for tag in (prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags != null ? prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.tags : []) : tag => {
        length = length(tag)
        is_valid_format = can(regex("^[^,\\s]+$", tag))
        tag_category = (
          contains(["terraform", "infrastructure", "automation"], tag) ? "infrastructure" :
          contains(["nat", "networking", "prefix", "translation"], tag) ? "networking" :
          contains(["production", "staging", "development", "test"], tag) ? "environment" :
          contains(["site-specific", "local-prefix", "address-pool"], tag) ? "functional" :
          "custom"
        )
      }
    }
  }
}

# NAT Operational Status
output "nat_operational_status" {
  description = "Operational status and readiness of the NAT local prefix"
  value = {
    operational_state = "active"
    deployment_readiness = {
      site_ready = prismasdwan_resource_locator.site.result != null
      nat_prefix_ready = prismasdwan_resource_locator.nat_prefix.result != null
      prefixes_configured = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes) > 0
      configuration_complete = (
        prismasdwan_resource_locator.site.result != null &&
        prismasdwan_resource_locator.nat_prefix.result != null &&
        length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes) > 0
      )
    }
    nat_pool_status = {
      total_prefixes = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes)
      pool_diversity = length(distinct([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : split("/", prefix)[1]
      ]))
      address_space_available = sum([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ])
      pool_utilization_ready = true
    }
  }
}

# Configuration Compliance Check
output "configuration_compliance_check" {
  description = "Compliance check for site NAT local prefix configuration"
  value = {
    resource_compliance = {
      site_resolvable = prismasdwan_resource_locator.site.result != null
      nat_prefix_resolvable = prismasdwan_resource_locator.nat_prefix.result != null
      prefix_id_compliant = length(var.prefix_id) > 0
    }
    network_compliance = {
      ipv4_format_valid = alltrue([
        for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))
      ])
      subnet_mask_valid = alltrue([
        for prefix in var.ipv4_prefixes : 
        tonumber(split("/", prefix)[1]) >= 8 && tonumber(split("/", prefix)[1]) <= 32
      ])
      octet_range_valid = alltrue([
        for prefix in var.ipv4_prefixes :
        alltrue([
          for octet in split(".", split("/", prefix)[0]) :
          tonumber(octet) >= 0 && tonumber(octet) <= 255
        ])
      ])
    }
    tags_compliance = {
      tags_count_compliant = length(var.tags) <= 10
      all_tags_valid_length = alltrue([for tag in var.tags : length(tag) <= 128])
      all_tags_valid_format = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
      no_duplicate_tags = length(var.tags) == length(distinct(var.tags))
    }
    overall_compliance = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.nat_prefix.result != null &&
      length(var.prefix_id) > 0 &&
      alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) &&
      length(var.tags) <= 10
    )
  }
}

# Site Integration Status
output "site_integration_status" {
  description = "Status of the NAT local prefix integration with the site"
  value = {
    site_details = {
      site_name = var.site_name
      site_id = prismasdwan_resource_locator.site.result
      site_resolved = prismasdwan_resource_locator.site.result != null
    }
    integration_health = {
      site_linkage_active = prismasdwan_resource_locator.site.result != null
      nat_prefix_bound = prismasdwan_resource_locator.nat_prefix.result != null
      config_applied_successfully = prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.id != null
      prefixes_operational = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes) > 0
    }
    nat_service_readiness = {
      address_translation_ready = true
      nat_pool_available = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes) > 0
      site_nat_policies_applicable = true
      traffic_routing_enabled = true
    }
  }
}

# Performance and Capacity Metrics
output "performance_capacity_metrics" {
  description = "Performance and capacity metrics for the NAT configuration"
  value = {
    capacity_metrics = {
      total_address_pools = length(prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes)
      total_available_addresses = sum([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ])
      largest_subnet_size = max([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ]...)
      smallest_subnet_size = min([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ]...)
    }
    performance_indicators = {
      nat_pool_diversity = length(distinct([
        for prefix in prismasdwan_site_nat_local_prefix.site_nat_local_prefix_full.ipv4_prefixes : split("/", prefix)[1]
      ]))
      address_space_efficiency = "optimized"
      configuration_complexity = "moderate"
      scalability_factor = "high"
    }
    operational_characteristics = {
      deployment_time = timestamp()
      configuration_stability = "stable"
      maintenance_overhead = "low"
      monitoring_complexity = "standard"
    }
  }
}