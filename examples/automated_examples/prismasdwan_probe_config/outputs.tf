# Basic Probe Config Information
output "probe_config_id" {
  description = "The ID of the created probe configuration"
  value       = prismasdwan_probe_config.probe_config_main.id
}

output "probe_config_name" {
  description = "The name of the probe configuration"
  value       = prismasdwan_probe_config.probe_config_main.name
}

output "probe_config_tfid" {
  description = "The Terraform ID of the probe configuration"
  value       = prismasdwan_probe_config.probe_config_main.tfid
}

# Detailed Probe Config Information
output "probe_config_details" {
  description = "Detailed information about the probe configuration"
  value = {
    id          = prismasdwan_probe_config.probe_config_main.id
    name        = prismasdwan_probe_config.probe_config_main.name
    description = prismasdwan_probe_config.probe_config_main.description
    tags        = prismasdwan_probe_config.probe_config_main.tags
    enabled     = prismasdwan_probe_config.probe_config_main.enabled
    endpoints   = prismasdwan_probe_config.probe_config_main.endpoints
    tfid        = prismasdwan_probe_config.probe_config_main.tfid
    x_etag      = prismasdwan_probe_config.probe_config_main.x_etag
    x_schema    = prismasdwan_probe_config.probe_config_main.x_schema
    created_at  = timestamp()
  }
  sensitive = true
}

# Endpoints Analysis
output "endpoints_analysis" {
  description = "Analysis of probe endpoints configuration"
  value = {
    total_endpoints = length(prismasdwan_probe_config.probe_config_main.endpoints)
    protocol_summary = {
      for protocol in distinct([for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.protocol]) :
      protocol => length([for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.protocol if ep.protocol == protocol])
    }
    path_types_coverage = flatten([
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : 
      ep.path_types != null ? ep.path_types : []
    ])
    has_redundancy = length(prismasdwan_probe_config.probe_config_main.endpoints) > 1
    total_probe_count = length([for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.probe_count != null ? ep.probe_count : 1])
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of probe configuration"
  value = {
    config_name      = prismasdwan_probe_config.probe_config_main.name
    config_id        = prismasdwan_probe_config.probe_config_main.id
    enabled_status   = prismasdwan_probe_config.probe_config_main.enabled
    endpoint_count   = length(prismasdwan_probe_config.probe_config_main.endpoints)
    has_description  = prismasdwan_probe_config.probe_config_main.description != null
    has_tags         = prismasdwan_probe_config.probe_config_main.tags != null
    tag_count        = prismasdwan_probe_config.probe_config_main.tags != null ? length(prismasdwan_probe_config.probe_config_main.tags) : 0
    resource_type    = "probe_config"
    api_model        = "ProbeConfigScreen"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the probe configuration"
  value = {
    name_valid          = length(prismasdwan_probe_config.probe_config_main.name) > 0 && length(prismasdwan_probe_config.probe_config_main.name) <= 128
    description_valid   = prismasdwan_probe_config.probe_config_main.description == null ? true : length(prismasdwan_probe_config.probe_config_main.description) <= 256
    tags_count_valid    = prismasdwan_probe_config.probe_config_main.tags == null ? true : length(prismasdwan_probe_config.probe_config_main.tags) <= 10
    endpoints_valid     = length(prismasdwan_probe_config.probe_config_main.endpoints) > 0
    has_id              = prismasdwan_probe_config.probe_config_main.id != null
    has_schema          = prismasdwan_probe_config.probe_config_main.x_schema != null
    has_etag            = prismasdwan_probe_config.probe_config_main.x_etag != null
    enabled_status      = prismasdwan_probe_config.probe_config_main.enabled
  }
}

# Protocol Analysis
output "protocol_analysis" {
  description = "Analysis by protocol type"
  value = {
    icmp_endpoints = [
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep
      if ep.protocol == "icmp"
    ]
    http_endpoints = [
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep
      if ep.protocol == "http" || ep.protocol == "https"
    ]
    dns_endpoints = [
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep
      if ep.protocol == "dns"
    ]
    protocol_distribution = {
      for protocol in distinct([for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.protocol]) :
      protocol => length([for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.protocol if ep.protocol == protocol])
    }
  }
}

# Performance Analysis
output "performance_analysis" {
  description = "Performance configuration analysis"
  value = {
    endpoint_count = length(prismasdwan_probe_config.probe_config_main.endpoints)
    probe_cycles = [for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.probe_cycle_duration != null ? ep.probe_cycle_duration : 60]
    probe_counts = [for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep.probe_count != null ? ep.probe_count : 1]
    network_impact = length(prismasdwan_probe_config.probe_config_main.endpoints) > 1 ? "Medium" : "Low"
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the probe configuration deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "probe_config"
    status         = "success"
    enabled        = prismasdwan_probe_config.probe_config_main.enabled
    api_version    = "v2.0"
    api_model      = "ProbeConfigScreen"
  }
}

# Security Analysis
output "security_analysis" {
  description = "Security configuration analysis"
  value = {
    https_endpoints = [
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep
      if ep.protocol == "https"
    ]
    insecure_connections = [
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep
      if ep.protocol == "https" && ep.allow_insecure_https_connection == true
    ]
    has_secure_endpoints = length([
      for ep in prismasdwan_probe_config.probe_config_main.endpoints : ep
      if ep.protocol == "https"
    ]) > 0
  }
}

# Schema and Etag (computed fields)
output "probe_config_schema" {
  description = "Schema version for the probe configuration"
  value       = prismasdwan_probe_config.probe_config_main.x_schema
}

output "probe_config_etag" {
  description = "Etag for the probe configuration"
  value       = prismasdwan_probe_config.probe_config_main.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "probe_config"
}
