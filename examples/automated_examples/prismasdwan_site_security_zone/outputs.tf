# Basic Site Security Zone Information
output "site_security_zone_id" {
  description = "The ID of the site security zone association"
  value       = prismasdwan_site_security_zone.site_security_zone_main.id
}

output "site_id" {
  description = "The site ID where the security zone is associated"
  value       = prismasdwan_resource_locator.site.result
}

output "zone_id" {
  description = "The security zone ID"
  value       = prismasdwan_site_security_zone.site_security_zone_main.zone_id
}

# Detailed Site Security Zone Information
output "site_security_zone_details" {
  description = "Detailed information about the site security zone association"
  value = {
    id        = prismasdwan_site_security_zone.site_security_zone_main.id
    site_id   = prismasdwan_resource_locator.site.result
    zone_id   = prismasdwan_site_security_zone.site_security_zone_main.zone_id
    networks  = prismasdwan_site_security_zone.site_security_zone_main.networks
    x_etag    = prismasdwan_site_security_zone.site_security_zone_main.x_etag
    x_schema  = prismasdwan_site_security_zone.site_security_zone_main.x_schema
    created_at = timestamp()
  }
  sensitive = true
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    security_zone_resolved = prismasdwan_resource_locator.security_zone.result
    wan_network_mappings = {
      for idx, locator in prismasdwan_resource_locator.wan_networks :
      var.wan_network_names[idx] => locator.result
    }
    lan_network_mappings = {
      for idx, locator in prismasdwan_resource_locator.lan_networks :
      var.lan_network_names[idx] => locator.result
    }
    wan_overlay_mappings = {
      for idx, locator in prismasdwan_resource_locator.wan_overlay_networks :
      var.wan_overlay_network_names[idx] => locator.result
    }
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of site security zone configuration"
  value = {
    site_name            = var.site_name
    site_id              = prismasdwan_resource_locator.site.result
    zone_name            = var.zone_name
    zone_id              = prismasdwan_site_security_zone.site_security_zone_main.zone_id
    total_networks       = length(prismasdwan_site_security_zone.site_security_zone_main.networks)
    wan_network_count    = length(var.wan_network_names)
    lan_network_count    = length(var.lan_network_names)
    wan_overlay_count    = length(var.wan_overlay_network_names)
    resource_type        = "site_security_zone"
    api_model            = "SecurityZoneNetworkAssociation"
  }
}

# Network Analysis
output "network_analysis" {
  description = "Analysis of networks associated with the security zone"
  value = {
    total_networks = length(prismasdwan_site_security_zone.site_security_zone_main.networks)
    network_types = {
      for network_type in distinct([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net.network_type]) :
      network_type => length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net.network_type if net.network_type == network_type])
    }
    wan_networks = [
      for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net
      if net.network_type == "wan_network"
    ]
    lan_networks = [
      for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net
      if net.network_type == "lan_network"
    ]
    wan_overlay_networks = [
      for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net
      if net.network_type == "wan_overlay"
    ]
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the site security zone association"
  value = {
    site_name_valid      = length(var.site_name) > 0
    zone_name_valid      = length(var.zone_name) > 0
    site_id_valid        = length(prismasdwan_resource_locator.site.result) > 0
    zone_id_valid        = length(prismasdwan_site_security_zone.site_security_zone_main.zone_id) > 0
    networks_valid       = length(prismasdwan_site_security_zone.site_security_zone_main.networks) > 0
    has_id               = prismasdwan_site_security_zone.site_security_zone_main.id != null
    has_schema           = prismasdwan_site_security_zone.site_security_zone_main.x_schema != null
    has_etag             = prismasdwan_site_security_zone.site_security_zone_main.x_etag != null
    site_resolved        = prismasdwan_resource_locator.site.result != null
    security_zone_resolved = prismasdwan_resource_locator.security_zone.result != null
    all_networks_resolved = length([
      for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net.network_id
      if net.network_id != null
    ]) == length(prismasdwan_site_security_zone.site_security_zone_main.networks)
  }
}

# Security Configuration Analysis
output "security_configuration" {
  description = "Security configuration analysis"
  value = {
    zone_coverage = {
      has_wan_networks     = length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == "wan_network"]) > 0
      has_lan_networks     = length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == "lan_network"]) > 0
      has_overlay_networks = length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == "wan_overlay"]) > 0
    }
    network_distribution = {
      for network_type in ["wan_network", "lan_network", "wan_overlay"] :
      network_type => length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == network_type])
    }
    security_posture = length(prismasdwan_site_security_zone.site_security_zone_main.networks) > 3 ? "Comprehensive" : length(prismasdwan_site_security_zone.site_security_zone_main.networks) > 1 ? "Standard" : "Basic"
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the site security zone deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "site_security_zone"
    status           = "success"
    networks_linked  = length(prismasdwan_site_security_zone.site_security_zone_main.networks)
    site_resolved    = prismasdwan_resource_locator.site.result != null
    zone_resolved    = prismasdwan_resource_locator.security_zone.result != null
    api_version      = "v2.0"
    api_model        = "SecurityZoneNetworkAssociation"
  }
}

# Network Type Distribution
output "network_type_distribution" {
  description = "Distribution of network types in the security zone"
  value = {
    wan_network_percentage = length(prismasdwan_site_security_zone.site_security_zone_main.networks) > 0 ? (
      (length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == "wan_network"]) * 100) / length(prismasdwan_site_security_zone.site_security_zone_main.networks)
    ) : 0
    lan_network_percentage = length(prismasdwan_site_security_zone.site_security_zone_main.networks) > 0 ? (
      (length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == "lan_network"]) * 100) / length(prismasdwan_site_security_zone.site_security_zone_main.networks)
    ) : 0
    wan_overlay_percentage = length(prismasdwan_site_security_zone.site_security_zone_main.networks) > 0 ? (
      (length([for net in prismasdwan_site_security_zone.site_security_zone_main.networks : net if net.network_type == "wan_overlay"]) * 100) / length(prismasdwan_site_security_zone.site_security_zone_main.networks)
    ) : 0
  }
}

# Schema and Etag (computed fields)
output "site_security_zone_schema" {
  description = "Schema version for the site security zone"
  value       = prismasdwan_site_security_zone.site_security_zone_main.x_schema
}

output "site_security_zone_etag" {
  description = "Etag for the site security zone"
  value       = prismasdwan_site_security_zone.site_security_zone_main.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "site_security_zone"
}
