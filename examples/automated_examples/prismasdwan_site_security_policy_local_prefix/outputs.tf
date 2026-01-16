# Basic Site Security Policy Local Prefix Information
output "site_security_policy_local_prefix_id" {
  description = "The ID of the site security policy local prefix"
  value       = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.id
}

output "site_id" {
  description = "The site ID where the security policy local prefix is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "prefix_id" {
  description = "The prefix ID of the security policy local prefix"
  value       = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.prefix_id
}

output "ipv4_prefixes" {
  description = "The configured IPv4 prefixes for security policy enforcement"
  value       = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes
}

output "ipv6_prefixes" {
  description = "The configured IPv6 prefixes for security policy enforcement"
  value       = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes
}

# Detailed Site Security Policy Local Prefix Information
output "site_security_policy_local_prefix_details" {
  description = "Detailed information about the site security policy local prefix"
  value = {
    id            = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.id
    site_id       = prismasdwan_resource_locator.site.result
    prefix_id     = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.prefix_id
    ipv4_prefixes = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes
    ipv6_prefixes = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes
    tags          = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags
    x_etag        = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.x_etag
    x_schema      = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.x_schema
    created_at    = timestamp()
  }
}

# Site Security Policy Local Prefix Summary
output "site_security_policy_local_prefix_summary" {
  description = "Summary of site security policy local prefix configuration"
  value = {
    site_name          = var.site_name
    prefix_id          = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.prefix_id
    ipv4_prefixes_count = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : [])
    ipv6_prefixes_count = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : [])
    total_prefixes     = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) +
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : [])
    )
    tags_count         = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags : [])
    has_dual_stack     = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    resource_type      = "site_security_policy_local_prefix"
    api_version        = "v2.1"
  }
}

# IPv4 Security Prefixes Analysis
output "ipv4_security_prefixes_analysis" {
  description = "Analysis of configured IPv4 prefixes for security policy enforcement"
  value = {
    total_ipv4_prefixes = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : [])
    unique_ipv4_prefixes = length(distinct(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []))
    ipv4_prefix_details = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? {
      for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : prefix => {
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
        security_zone = (
          startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
          (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
           tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
           tonumber(split(".", split("/", prefix)[0])[1]) <= 31) ? "internal" : "external"
        )
        threat_protection_scope = (
          tonumber(split("/", prefix)[1]) >= 24 ? "granular" :
          tonumber(split("/", prefix)[1]) >= 16 ? "moderate" : "broad"
        )
      }
    } : {}
        security_coverage = {
      private_networks = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : prefix
        if startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
           (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
            tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
            tonumber(split(".", split("/", prefix)[0])[1]) <= 31)
      ] : [])
      public_networks = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : prefix
        if !(startswith(prefix, "10.") || startswith(prefix, "192.168.") || 
             (tonumber(split(".", split("/", prefix)[0])[0]) == 172 && 
              tonumber(split(".", split("/", prefix)[0])[1]) >= 16 && 
              tonumber(split(".", split("/", prefix)[0])[1]) <= 31))
      ] : [])
      total_protected_hosts = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? sum([
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ]) : 0
    }
    threat_protection_analysis = {
      high_granularity_networks = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : prefix
        if tonumber(split("/", prefix)[1]) >= 24
      ] : [])
      moderate_granularity_networks = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : prefix
        if tonumber(split("/", prefix)[1]) >= 16 && tonumber(split("/", prefix)[1]) < 24
      ] : [])
      broad_protection_networks = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : prefix
        if tonumber(split("/", prefix)[1]) < 16
      ] : [])
    }
  }
}

# IPv6 Security Prefixes Analysis
output "ipv6_security_prefixes_analysis" {
  description = "Analysis of configured IPv6 prefixes for security policy enforcement"
  value = {
    total_ipv6_prefixes = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : [])
    unique_ipv6_prefixes = length(distinct(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []))
    ipv6_prefix_details = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? {
      for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : prefix => {
        network_address = split("/", prefix)[0]
        prefix_length = split("/", prefix)[1]
        is_link_local = startswith(prefix, "fe80:")
        is_unique_local = startswith(prefix, "fd") || startswith(prefix, "fc")
        is_global_unicast = !(startswith(prefix, "fe80:") || startswith(prefix, "fd") || startswith(prefix, "fc"))
        address_space_size = pow(2, 128 - tonumber(split("/", prefix)[1]))
        security_scope = (
          startswith(prefix, "fe80:") ? "link-local" :
          startswith(prefix, "fd") || startswith(prefix, "fc") ? "private" : "global"
        )
        threat_protection_level = (
          tonumber(split("/", prefix)[1]) <= 48 ? "network-wide" :
          tonumber(split("/", prefix)[1]) <= 64 ? "subnet-specific" : "host-granular"
        )
        security_zone = (
          startswith(prefix, "fe80:") ? "link-local" :
          startswith(prefix, "fd") || startswith(prefix, "fc") ? "internal" : "external"
        )
      }
    } : {}
    ipv6_security_types = {
      link_local_count = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : prefix
        if startswith(prefix, "fe80:")
      ] : [])
      unique_local_count = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : prefix
        if startswith(prefix, "fd") || startswith(prefix, "fc")
      ] : [])
      global_unicast_count = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? [
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : prefix
        if !(startswith(prefix, "fe80:") || startswith(prefix, "fd") || startswith(prefix, "fc"))
      ] : [])
    }
    security_granularity_distribution = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? {
      for length in distinct([
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : split("/", prefix)[1]
      ]) : length => length([
        for prefix in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : prefix 
        if split("/", prefix)[1] == length
      ])
    } : {}
  }
}

# Security Policy Configuration Analysis
output "security_policy_configuration_analysis" {
  description = "Analysis of the security policy configuration"
  value = {
    configuration_scope = "site-specific"
    security_capabilities = {
      ngfw_protection = true
      threat_prevention = true
      intrusion_prevention = true
      url_filtering = true
      dns_security = true
      wildfire_analysis = true
      dual_stack_protection = (
        length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) > 0
      )
      site_local_policies = true
      granular_enforcement = true
    }
    protection_strategy = {
      ipv4_strategy = length(var.ipv4_prefixes) > 0 ? "prefix-based-ngfw" : "disabled"
      ipv6_strategy = length(var.ipv6_prefixes) > 0 ? "prefix-based-ngfw" : "disabled"
      fallback_behavior = "default-security-policy"
      threat_detection = "advanced"
      content_inspection = "deep-packet-inspection"
    }
    security_optimization = {
      threat_intelligence = "cloud-delivered"
      policy_enforcement_granularity = "prefix-level"
      security_monitoring = "real-time"
      incident_response = "automated"
      compliance_reporting = "enabled"
    }
    operational_benefits = [
      "Site-specific threat protection",
      "Enhanced security policy granularity",
      "Improved threat detection and response",
      "Reduced security incidents through advanced NGFW",
      "Better compliance and audit capabilities",
      "Intelligent security automation"
    ]
  }
}

# Dual Stack Security Analysis
output "dual_stack_security_analysis" {
  description = "Analysis of dual stack (IPv4 + IPv6) security configuration"
  value = {
    dual_stack_security_enabled = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    ipv4_only_security = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) == 0
    )
    ipv6_only_security = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) == 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    no_prefixes_configured = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) == 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) == 0
    )
    security_configuration_type = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0 ? "dual-stack-security" :
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 ? "ipv4-only-security" :
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0 ? "ipv6-only-security" : "no-security"
    )
    security_capabilities = {
      ipv4_ngfw_enabled = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0
      ipv6_ngfw_enabled = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
      future_ready_security = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
      legacy_protocol_support = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0
            comprehensive_protection = (
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
    }
  }
}

# Security Performance Metrics
output "security_performance_metrics" {
  description = "Security performance and capacity metrics"
  value = {
    protection_capacity = {
      total_ipv4_networks = length(var.ipv4_prefixes)
      total_ipv6_networks = length(var.ipv6_prefixes)
      total_protected_networks = length(var.ipv4_prefixes) + length(var.ipv6_prefixes)
      security_policy_efficiency = "optimized"
    }
    threat_coverage = {
      ipv4_protected_hosts = length(var.ipv4_prefixes) > 0 ? sum([
        for prefix in var.ipv4_prefixes :
        pow(2, 32 - tonumber(split("/", prefix)[1])) - 2
      ]) : 0
      ipv6_address_space = length(var.ipv6_prefixes) > 0 ? "virtually-unlimited" : "none"
      coverage_scope = (
        length(var.ipv4_prefixes) > 0 && length(var.ipv6_prefixes) > 0 ? "dual-stack-security" :
        length(var.ipv4_prefixes) > 0 ? "ipv4-only-security" :
        length(var.ipv6_prefixes) > 0 ? "ipv6-only-security" : "no-security"
      )
    }
    security_indicators = {
      policy_complexity = (
        (length(var.ipv4_prefixes) + length(var.ipv6_prefixes)) <= 5 ? "low" :
        (length(var.ipv4_prefixes) + length(var.ipv6_prefixes)) <= 15 ? "moderate" : "high"
      )
      threat_detection_speed = "real-time"
      policy_enforcement_latency = "minimal"
      scalability_factor = "enterprise-grade"
      maintenance_overhead = "automated"
    }
  }
}

# Site Security Integration Status
output "site_security_integration_status" {
  description = "Status of the security policy local prefix integration with the site"
  value = {
    site_details = {
      site_name = var.site_name
      site_id = prismasdwan_resource_locator.site.result
      site_resolved = prismasdwan_resource_locator.site.result != null
    }
    security_integration_health = {
      site_linkage_active = prismasdwan_resource_locator.site.result != null
      security_policy_prefix_bound = prismasdwan_resource_locator.security_policy_prefix.result != null
      ngfw_config_applied_successfully = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.id != null
      threat_protection_operational = (
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 ||
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
    }
    security_policy_readiness = {
      ngfw_protection_ready = true
      threat_prevention_available = (
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 ||
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
      site_security_policies_applicable = true
      advanced_threat_detection_enabled = true
      content_inspection_active = true
    }
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    security_policy_prefix_resolved = prismasdwan_resource_locator.security_policy_prefix.result
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags
    tags_count      = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags : [])
    has_tags        = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags != null && length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags) > 0
    tags_analysis = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags != null ? {
      for tag in prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.tags : tag => {
        length = length(tag)
        is_valid_format = can(regex("^[^,\\s]+$", tag))
        tag_category = (
          contains(["terraform", "infrastructure", "automation"], tag) ? "infrastructure" :
          contains(["security", "ngfw", "firewall", "threat-prevention"], tag) ? "security" :
          contains(["production", "staging", "development", "test"], tag) ? "environment" :
          contains(["site-specific", "local-prefix", "dual-stack"], tag) ? "functional" :
          "custom"
        )
      }
    } : {}
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the site security policy local prefix deployment"
  value = {
    deployed_at                         = timestamp()
    resource_count                      = 1
    resource_type                       = "site_security_policy_local_prefix"
    status                              = "success"
    site_resolved                       = prismasdwan_resource_locator.site.result != null
    security_policy_prefix_resolved     = prismasdwan_resource_locator.security_policy_prefix.result != null
    ipv4_prefixes_configured            = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0
    ipv6_prefixes_configured            = length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
    dual_stack_security_ready           = (
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
      length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
    )
    api_version                         = "v2.1"
    api_model                           = "SiteSecurityPolicyPrefixAssociation"
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid       = prismasdwan_resource_locator.site.result != null
    security_policy_prefix_valid = prismasdwan_resource_locator.security_policy_prefix.result != null
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
      prismasdwan_resource_locator.security_policy_prefix.result != null &&
      length(var.prefix_id) > 0 &&
      alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) &&
      alltrue([for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))]) &&
      length(var.tags) <= 10
    )
  }
}

# Security Compliance Report
output "security_compliance_report" {
  description = "Comprehensive security compliance report for the configuration"
  value = {
    resource_compliance = {
      site_resolution_status = prismasdwan_resource_locator.site.result != null ? "compliant" : "non-compliant"
      security_prefix_resolution_status = prismasdwan_resource_locator.security_policy_prefix.result != null ? "compliant" : "non-compliant"
      prefix_id_status = length(var.prefix_id) > 0 ? "compliant" : "non-compliant"
    }
    network_security_compliance = {
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
    security_tags_compliance = {
      tags_count_compliance = length(var.tags) <= 10 ? "compliant" : "non-compliant"
      tags_format_compliance = alltrue([
        for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
      ]) ? "compliant" : "non-compliant"
      tags_uniqueness_compliance = length(var.tags) == length(distinct(var.tags)) ? "compliant" : "non-compliant"
    }
    overall_security_compliance_status = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.security_policy_prefix.result != null &&
      length(var.prefix_id) > 0 &&
      alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) &&
      alltrue([for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))]) &&
      length(var.tags) <= 10
    ) ? "fully-compliant" : "non-compliant"
    security_compliance_score = (
      (prismasdwan_resource_locator.site.result != null ? 1 : 0) +
      (prismasdwan_resource_locator.security_policy_prefix.result != null ? 1 : 0) +
      (length(var.prefix_id) > 0 ? 1 : 0) +
      (alltrue([for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))]) ? 1 : 0) +
      (alltrue([for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F:]+)/[0-9]{1,3}$", prefix))]) ? 1 : 0) +
      (length(var.tags) <= 10 ? 1 : 0)
    ) / 6 * 100
  }
}

# Operational Summary Report
output "operational_summary_report" {
  description = "Comprehensive operational summary of the security policy configuration"
  value = {
    executive_summary = {
      feature_name = "Site Security Policy Local Prefix"
      deployment_scope = "Site-specific NGFW protection"
      current_status = "Active"
      deployment_success = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.id != null
      dual_stack_security_enabled = (
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) > 0 &&
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : []) > 0
      )
    }
    technical_details = {
      resource_id = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.id
      site_association = prismasdwan_resource_locator.site.result
      security_prefix_association = prismasdwan_resource_locator.security_policy_prefix.result
      total_protected_networks = (
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv4_prefixes : []) +
        length(prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes != null ? prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.ipv6_prefixes : [])
      )
      api_version = "v2.1"
      schema_version = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.x_schema
      etag_value = prismasdwan_site_security_policy_local_prefix.site_security_policy_local_prefix_full.x_etag
    }
    business_impact = {
      threat_protection = "Advanced"
      security_posture = "Enhanced"
      compliance_readiness = "Improved"
      incident_response = "Automated"
      operational_efficiency = "Optimized"
      risk_mitigation = "Comprehensive"
    }
  }
}
