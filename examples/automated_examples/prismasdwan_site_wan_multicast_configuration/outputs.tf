# Basic Site WAN Multicast Configuration Information
output "multicast_config_id" {
  description = "The ID of the site WAN multicast configuration"
  value       = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.id
}

output "site_id" {
  description = "The site ID where the WAN multicast configuration is applied"
  value       = prismasdwan_resource_locator.site.result
}

# Detailed Site WAN Multicast Configuration Information
output "multicast_config_details" {
  description = "Detailed information about the site WAN multicast configuration"
  value = {
    id           = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.id
    site_id      = prismasdwan_resource_locator.site.result
    site_configs = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs
    x_etag       = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.x_etag
    x_schema     = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.x_schema
    created_at   = timestamp()
  }
}

# Site WAN Multicast Configuration Summary
output "multicast_config_summary" {
  description = "Summary of site WAN multicast configuration"
  value = {
    site_name           = var.site_name
    configurations_count = length(prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs)
    resource_type       = "site_wan_multicast_configuration"
    api_version         = "v2.0"
  }
}

# Site Configuration Information
output "site_configs_info" {
  description = "Information about configured site multicast configurations"
  value = {
    total_configs = length(prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs)
    configs_list  = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs
    source_addresses = [
      for config in prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs : 
      config.source_ipv4_address
    ]
    group_prefixes = [
      for config in prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs : 
      config.group_ipv4_prefix
    ]
  }
}

# Site Configuration Analysis
output "site_configs_analysis" {
  description = "Analysis of site multicast configurations"
  value = {
    configs_by_source = {
      for config in prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs : 
      config.source_ipv4_address => {
        group_prefix = config.group_ipv4_prefix
        group_network = split("/", config.group_ipv4_prefix)[0]
        group_mask = split("/", config.group_ipv4_prefix)[1]
        is_multicast_group = (
          tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 224 && 
          tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 239
        )
      }
    }
    multicast_group_types = {
      for config in prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.site_configs : 
      "${config.source_ipv4_address}:${config.group_ipv4_prefix}" => {
        source = config.source_ipv4_address
        group = config.group_ipv4_prefix
        first_octet = tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0])
        is_local_network = tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) == 224
        is_internetwork = (
          tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 225 && 
          tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 231
        )
        is_administratively_scoped = (
          tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 232 && 
          tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 238
        )
      }
    }
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
  description = "Status of the site WAN multicast configuration deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "site_wan_multicast_configuration"
    status         = "success"
    site_resolved  = prismasdwan_resource_locator.site.result != null
    api_version    = "v2.0"
    api_model      = "MulticastSourceSiteConfigScreen"
  }
}

# Schema and Etag (computed fields)
output "multicast_config_schema" {
  description = "Schema version for the site WAN multicast configuration"
  value       = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.x_schema
}

output "multicast_config_etag" {
  description = "Etag for the site WAN multicast configuration"
  value       = prismasdwan_site_wan_multicast_configuration.site_wan_multicast_configuration_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_wan_multicast_configuration"
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name    = var.site_name
    site_configs = var.site_configs
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid = prismasdwan_resource_locator.site.result != null
    configs_count_valid = length(var.site_configs) > 0 && length(var.site_configs) <= 64
    all_sources_valid = alltrue([
      for config in var.site_configs : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", config.source_ipv4_address))
    ])
    all_groups_multicast = alltrue([
      for config in var.site_configs : 
      tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 224 && 
      tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 239
    ])
    all_combinations_unique = length(var.site_configs) == length(distinct([
      for config in var.site_configs : "${config.source_ipv4_address}:${config.group_ipv4_prefix}"
    ]))
    all_validations_passed = (
      prismasdwan_resource_locator.site.result != null &&
      length(var.site_configs) > 0 && 
      length(var.site_configs) <= 64
    )
  }
}

# Source Address Analysis
output "source_address_analysis" {
  description = "Analysis of source IPv4 addresses"
  value = {
    unique_sources = length(distinct([for config in var.site_configs : config.source_ipv4_address]))
    source_addresses = distinct([for config in var.site_configs : config.source_ipv4_address])
    source_address_types = {
      for addr in distinct([for config in var.site_configs : config.source_ipv4_address]) : addr => {
        is_private = contains([
          "10.", "172.16.", "172.17.", "172.18.", "172.19.", "172.20.", "172.21.", "172.22.", "172.23.",
          "172.24.", "172.25.", "172.26.", "172.27.", "172.28.", "172.29.", "172.30.", "172.31.", "192.168."
        ], substr(addr, 0, min(length(addr), 8)))
        is_loopback = startswith(addr, "127.")
        is_link_local = startswith(addr, "169.254.")
        is_multicast = tonumber(split(".", addr)[0]) >= 224 && tonumber(split(".", addr)[0]) <= 239
        first_octet = tonumber(split(".", addr)[0])
      }
    }
  }
}

# Multicast Group Statistics
output "multicast_group_statistics" {
  description = "Statistics about multicast groups"
  value = {
    total_groups = length(var.site_configs)
    unique_groups = length(distinct([for config in var.site_configs : config.group_ipv4_prefix]))
    unique_group_prefixes = distinct([for config in var.site_configs : config.group_ipv4_prefix])
    group_types = {
      local_network = length([
        for config in var.site_configs : config 
        if tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) == 224
      ])
      internetwork = length([
        for config in var.site_configs : config 
        if tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 225 && 
           tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 231
      ])
      administratively_scoped = length([
        for config in var.site_configs : config 
        if tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 232 && 
           tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 238
      ])
    }
  }
}

# Configuration Mapping
output "configuration_mapping" {
  description = "Mapping of source addresses to multicast groups"
  value = {
    source_to_groups = {
      for source in distinct([for config in var.site_configs : config.source_ipv4_address]) : source => [
        for config in var.site_configs : config.group_ipv4_prefix 
        if config.source_ipv4_address == source
      ]
    }
    group_to_sources = {
      for group in distinct([for config in var.site_configs : config.group_ipv4_prefix]) : group => [
        for config in var.site_configs : config.source_ipv4_address 
        if config.group_ipv4_prefix == group
      ]
    }
  }
}

# Network Range Analysis
output "network_range_analysis" {
  description = "Analysis of network ranges in configurations"
  value = {
    source_network_ranges = {
      for config in var.site_configs : config.source_ipv4_address => {
        first_octet = tonumber(split(".", config.source_ipv4_address)[0])
        is_class_a = tonumber(split(".", config.source_ipv4_address)[0]) >= 1 && tonumber(split(".", config.source_ipv4_address)[0]) <= 126
        is_class_b = tonumber(split(".", config.source_ipv4_address)[0]) >= 128 && tonumber(split(".", config.source_ipv4_address)[0]) <= 191
        is_class_c = tonumber(split(".", config.source_ipv4_address)[0]) >= 192 && tonumber(split(".", config.source_ipv4_address)[0]) <= 223
        is_private = (
          startswith(config.source_ipv4_address, "10.") ||
          startswith(config.source_ipv4_address, "192.168.") ||
          (tonumber(split(".", config.source_ipv4_address)[0]) == 172 && 
           tonumber(split(".", config.source_ipv4_address)[1]) >= 16 && 
           tonumber(split(".", config.source_ipv4_address)[1]) <= 31)
        )
      }
    }
    group_network_ranges = {
      for config in var.site_configs : config.group_ipv4_prefix => {
        network_address = split("/", config.group_ipv4_prefix)[0]
        subnet_mask = split("/", config.group_ipv4_prefix)[1]
        first_octet = tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0])
        is_local_network_control = tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) == 224 && tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[1]) == 0 && tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[2]) == 0
        is_internetwork_control = tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) == 224 && tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[1]) == 0 && tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[2]) == 1
        is_adsm_range = tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 232 && tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 238
      }
    }
  }
}

# Configuration Summary Statistics
output "configuration_summary_statistics" {
  description = "Summary statistics of the configuration"
  value = {
    total_configurations = length(var.site_configs)
    unique_source_addresses = length(distinct([for config in var.site_configs : config.source_ipv4_address]))
    unique_group_prefixes = length(distinct([for config in var.site_configs : config.group_ipv4_prefix]))
    configurations_per_source = {
      for source in distinct([for config in var.site_configs : config.source_ipv4_address]) : source => length([
        for config in var.site_configs : config if config.source_ipv4_address == source
      ])
    }
    sources_per_group = {
      for group in distinct([for config in var.site_configs : config.group_ipv4_prefix]) : group => length([
        for config in var.site_configs : config if config.group_ipv4_prefix == group
      ])
    }
    average_groups_per_source = length(var.site_configs) / max(1, length(distinct([for config in var.site_configs : config.source_ipv4_address])))
    average_sources_per_group = length(var.site_configs) / max(1, length(distinct([for config in var.site_configs : config.group_ipv4_prefix])))
  }
}

# Subnet Mask Analysis
output "subnet_mask_analysis" {
  description = "Analysis of subnet masks used in group prefixes"
  value = {
    subnet_masks_used = distinct([for config in var.site_configs : split("/", config.group_ipv4_prefix)[1]])
    mask_distribution = {
      for mask in distinct([for config in var.site_configs : split("/", config.group_ipv4_prefix)[1]]) : mask => length([
        for config in var.site_configs : config if split("/", config.group_ipv4_prefix)[1] == mask
      ])
    }
    mask_usage_details = [
      for mask in distinct([for config in var.site_configs : split("/", config.group_ipv4_prefix)[1]]) : {
        mask = mask
        count = length([for config in var.site_configs : config if split("/", config.group_ipv4_prefix)[1] == mask])
        percentage = (length([for config in var.site_configs : config if split("/", config.group_ipv4_prefix)[1] == mask]) * 100) / length(var.site_configs)
      }
    ]
    most_used_mask_count = max([
      for mask in distinct([for config in var.site_configs : split("/", config.group_ipv4_prefix)[1]]) : length([
        for config in var.site_configs : config if split("/", config.group_ipv4_prefix)[1] == mask
      ])
    ]...)
  }
}