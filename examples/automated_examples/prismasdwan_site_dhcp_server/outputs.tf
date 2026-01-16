# Basic DHCP Server Information
output "dhcp_server_id" {
  description = "The ID of the DHCP server"
  value       = prismasdwan_site_dhcp_server.dhcp_server_main.id
}

output "site_id" {
  description = "The site ID where the DHCP server is configured"
  value       = prismasdwan_resource_locator.site.result
}

# Detailed DHCP Server Information
output "dhcp_server_details" {
  description = "Detailed information about the DHCP server"
  value = {
    id                = prismasdwan_site_dhcp_server.dhcp_server_main.id
    site_id           = prismasdwan_resource_locator.site.result
    address_family    = prismasdwan_site_dhcp_server.dhcp_server_main.address_family
    subnet            = prismasdwan_site_dhcp_server.dhcp_server_main.subnet
    gateway           = prismasdwan_site_dhcp_server.dhcp_server_main.gateway
    broadcast_address = prismasdwan_site_dhcp_server.dhcp_server_main.broadcast_address
    disabled          = prismasdwan_site_dhcp_server.dhcp_server_main.disabled
    tags              = prismasdwan_site_dhcp_server.dhcp_server_main.tags
    description       = prismasdwan_site_dhcp_server.dhcp_server_main.description
    x_etag            = prismasdwan_site_dhcp_server.dhcp_server_main.x_etag
    x_schema          = prismasdwan_site_dhcp_server.dhcp_server_main.x_schema
    created_at        = timestamp()
  }
  sensitive = true
}

# Network Configuration
output "network_configuration" {
  description = "Network configuration details"
  value = {
    subnet            = prismasdwan_site_dhcp_server.dhcp_server_main.subnet
    gateway           = prismasdwan_site_dhcp_server.dhcp_server_main.gateway
    broadcast_address = prismasdwan_site_dhcp_server.dhcp_server_main.broadcast_address
    domain_name       = prismasdwan_site_dhcp_server.dhcp_server_main.domain_name
    dns_servers       = prismasdwan_site_dhcp_server.dhcp_server_main.dns_servers
    address_family    = prismasdwan_site_dhcp_server.dhcp_server_main.address_family
  }
}

# IP Range Configuration
output "ip_range_configuration" {
  description = "IP range configuration for DHCP allocation"
  value = {
    ip_ranges = prismasdwan_site_dhcp_server.dhcp_server_main.ip_ranges
    total_ranges = length(prismasdwan_site_dhcp_server.dhcp_server_main.ip_ranges)
    range_analysis = [
      for range in prismasdwan_site_dhcp_server.dhcp_server_main.ip_ranges : {
        start_ip = range.start_ip
        end_ip   = range.end_ip
      }
    ]
  }
}

# Lease Configuration
output "lease_configuration" {
  description = "DHCP lease time configuration"
  value = {
    default_lease_time = prismasdwan_site_dhcp_server.dhcp_server_main.default_lease_time
    max_lease_time     = prismasdwan_site_dhcp_server.dhcp_server_main.max_lease_time
    default_lease_hours = prismasdwan_site_dhcp_server.dhcp_server_main.default_lease_time / 3600
    max_lease_hours     = prismasdwan_site_dhcp_server.dhcp_server_main.max_lease_time / 3600
  }
}

# Context Configuration
output "context_configuration" {
  description = "VRF and network context configuration"
  value = {
    vrf_context_id     = prismasdwan_site_dhcp_server.dhcp_server_main.vrf_context_id
    network_context_id = prismasdwan_site_dhcp_server.dhcp_server_main.network_context_id
    vrf_from_locator   = var.vrf_context_name != null ? true : false
    network_from_locator = var.network_context_name != null ? true : false
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    vrf_context_resolved = var.vrf_context_name != null ? prismasdwan_resource_locator.vrf_context[0].result : null
    network_context_resolved = var.network_context_name != null ? prismasdwan_resource_locator.network_context[0].result : null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of DHCP server configuration"
  value = {
    site_name         = var.site_name
    site_id           = prismasdwan_resource_locator.site.result
    address_family    = prismasdwan_site_dhcp_server.dhcp_server_main.address_family
    subnet            = prismasdwan_site_dhcp_server.dhcp_server_main.subnet
    gateway           = prismasdwan_site_dhcp_server.dhcp_server_main.gateway
    ip_range_count    = length(prismasdwan_site_dhcp_server.dhcp_server_main.ip_ranges)
    dns_server_count  = length(prismasdwan_site_dhcp_server.dhcp_server_main.dns_servers)
    has_static_mappings = prismasdwan_site_dhcp_server.dhcp_server_main.static_mappings != null
    has_custom_options = prismasdwan_site_dhcp_server.dhcp_server_main.custom_options != null
    resource_type     = "site_dhcp_server"
    api_model         = "DHCPServer"
  }
}

# Static Mappings Configuration
output "static_mappings_configuration" {
  description = "Static IP mappings configuration"
  value = {
    static_mappings = prismasdwan_site_dhcp_server.dhcp_server_main.static_mappings
    static_mapping_count = prismasdwan_site_dhcp_server.dhcp_server_main.static_mappings != null ? length(prismasdwan_site_dhcp_server.dhcp_server_main.static_mappings) : 0
    has_static_mappings = prismasdwan_site_dhcp_server.dhcp_server_main.static_mappings != null
  }
}

# Custom Options Configuration
output "custom_options_configuration" {
  description = "Custom DHCP options configuration"
  value = {
    custom_options = prismasdwan_site_dhcp_server.dhcp_server_main.custom_options
    custom_option_count = prismasdwan_site_dhcp_server.dhcp_server_main.custom_options != null ? length(prismasdwan_site_dhcp_server.dhcp_server_main.custom_options) : 0
    has_custom_options = prismasdwan_site_dhcp_server.dhcp_server_main.custom_options != null
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the DHCP server configuration"
  value = {
    site_name_valid       = length(var.site_name) > 0
    subnet_valid          = can(cidrhost(var.subnet, 0))
    address_family_valid  = contains(["IPV4", "IPV6"], var.address_family)
    has_ip_ranges         = length(prismasdwan_site_dhcp_server.dhcp_server_main.ip_ranges) > 0
    lease_times_valid     = var.default_lease_time <= var.max_lease_time
    has_id                = prismasdwan_site_dhcp_server.dhcp_server_main.id != null
    has_schema            = prismasdwan_site_dhcp_server.dhcp_server_main.x_schema != null
    has_etag              = prismasdwan_site_dhcp_server.dhcp_server_main.x_etag != null
    site_resolved         = prismasdwan_resource_locator.site.result != null
    vrf_context_resolved  = var.vrf_context_name != null ? prismasdwan_resource_locator.vrf_context[0].result != null : true
    network_context_resolved = var.network_context_name != null ? prismasdwan_resource_locator.network_context[0].result != null : true
  }
}

# Security and Network Analysis
output "security_analysis" {
  description = "Security and network analysis for DHCP configuration"
  value = {
    subnet_size = tonumber(split("/", prismasdwan_site_dhcp_server.dhcp_server_main.subnet)[1])
    is_private_subnet = (
      startswith(prismasdwan_site_dhcp_server.dhcp_server_main.subnet, "192.168.") ||
      startswith(prismasdwan_site_dhcp_server.dhcp_server_main.subnet, "10.") ||
      startswith(prismasdwan_site_dhcp_server.dhcp_server_main.subnet, "172.")
    )
    has_secure_dns = length(prismasdwan_site_dhcp_server.dhcp_server_main.dns_servers) > 1
    lease_security = var.default_lease_time >= 3600 && var.max_lease_time >= 7200 ? "Secure" : "Review"
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the DHCP server deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "site_dhcp_server"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    server_enabled   = !prismasdwan_site_dhcp_server.dhcp_server_main.disabled
    api_version      = "v2.0"
    api_model        = "DHCPServer"
  }
}

# Schema and Etag (computed fields)
output "dhcp_server_schema" {
  description = "Schema version for the DHCP server"
  value       = prismasdwan_site_dhcp_server.dhcp_server_main.x_schema
}

output "dhcp_server_etag" {
  description = "Etag for the DHCP server"
  value       = prismasdwan_site_dhcp_server.dhcp_server_main.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_dhcp_server"
}
