# Basic Probe Profile Information
output "probe_profile_id" {
  description = "The ID of the created probe profile"
  value       = prismasdwan_probe_profile.probe_profile_main.id
}

output "probe_profile_name" {
  description = "The name of the probe profile"
  value       = prismasdwan_probe_profile.probe_profile_main.name
}

output "probe_profile_tfid" {
  description = "The Terraform ID of the probe profile"
  value       = prismasdwan_probe_profile.probe_profile_main.tfid
}

# Detailed Probe Profile Information
output "probe_profile_details" {
  description = "Detailed information about the probe profile"
  value = {
    id               = prismasdwan_probe_profile.probe_profile_main.id
    name             = prismasdwan_probe_profile.probe_profile_main.name
    description      = prismasdwan_probe_profile.probe_profile_main.description
    tags             = prismasdwan_probe_profile.probe_profile_main.tags
    probe_config_ids = prismasdwan_probe_profile.probe_profile_main.probe_config_ids
    tfid             = prismasdwan_probe_profile.probe_profile_main.tfid
    x_etag           = prismasdwan_probe_profile.probe_profile_main.x_etag
    x_schema         = prismasdwan_probe_profile.probe_profile_main.x_schema
    created_at       = timestamp()
  }
  sensitive = true
}

# Probe Configuration Analysis
output "probe_config_analysis" {
  description = "Analysis of probe configurations in the profile"
  value = {
    total_probe_configs = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids)
    probe_config_names  = var.probe_config_ids
    resolved_ids        = prismasdwan_probe_profile.probe_profile_main.probe_config_ids
    has_redundancy      = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) > 1
    config_count        = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids)
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    locator_count = length(prismasdwan_resource_locator.probe_configs)
    locator_mappings = {
      for idx, locator in prismasdwan_resource_locator.probe_configs :
      var.probe_config_ids[idx] => locator.result
    }
    resolved_successfully = length(prismasdwan_resource_locator.probe_configs) == length(var.probe_config_ids)
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of probe profile configuration"
  value = {
    profile_name        = prismasdwan_probe_profile.probe_profile_main.name
    profile_id          = prismasdwan_probe_profile.probe_profile_main.id
    probe_config_count  = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids)
    has_description     = prismasdwan_probe_profile.probe_profile_main.description != null
    has_tags            = prismasdwan_probe_profile.probe_profile_main.tags != null
    tag_count           = prismasdwan_probe_profile.probe_profile_main.tags != null ? length(prismasdwan_probe_profile.probe_profile_main.tags) : 0
    resource_type       = "probe_profile"
    api_model           = "ProbeProfileScreen"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the probe profile"
  value = {
    name_valid               = length(prismasdwan_probe_profile.probe_profile_main.name) > 0 && length(prismasdwan_probe_profile.probe_profile_main.name) <= 128
    description_valid        = prismasdwan_probe_profile.probe_profile_main.description == null ? true : length(prismasdwan_probe_profile.probe_profile_main.description) <= 256
    tags_count_valid         = prismasdwan_probe_profile.probe_profile_main.tags == null ? true : length(prismasdwan_probe_profile.probe_profile_main.tags) <= 10
    probe_configs_valid      = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) > 0 && length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) <= 8
    probe_configs_unique     = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) == length(distinct(prismasdwan_probe_profile.probe_profile_main.probe_config_ids))
    has_id                   = prismasdwan_probe_profile.probe_profile_main.id != null
    has_schema               = prismasdwan_probe_profile.probe_profile_main.x_schema != null
    has_etag                 = prismasdwan_probe_profile.probe_profile_main.x_etag != null
    locators_resolved        = length(prismasdwan_resource_locator.probe_configs) == length(var.probe_config_ids)
  }
}

# Schema and Etag (computed fields)
output "probe_profile_schema" {
  description = "Schema version for the probe profile"
  value       = prismasdwan_probe_profile.probe_profile_main.x_schema
}

output "probe_profile_etag" {
  description = "Etag for the probe profile"
  value       = prismasdwan_probe_profile.probe_profile_main.x_etag
}

# Deployment Status
output "deployment_status" {
  description = "Status of the probe profile deployment"
  value = {
    deployed_at           = timestamp()
    resource_count        = 1
    resource_type         = "probe_profile"
    status                = "success"
    probe_configs_linked  = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids)
    api_version           = "v2.0"
    api_model             = "ProbeProfileScreen"
  }
}

# Probe Configuration Mapping
output "probe_config_mapping" {
  description = "Mapping of probe configuration names to resolved IDs"
  value = {
    for idx, name in var.probe_config_ids :
    name => prismasdwan_resource_locator.probe_configs[idx].result
  }
}

# Coverage Analysis
output "coverage_analysis" {
  description = "Analysis of monitoring coverage provided by the probe profile"
  value = {
    probe_config_names    = var.probe_config_ids
    total_coverage_points = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids)
    redundancy_level      = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) > 4 ? "High" : length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) > 2 ? "Medium" : "Basic"
    monitoring_scope      = length(prismasdwan_probe_profile.probe_profile_main.probe_config_ids) > 1 ? "Comprehensive" : "Single-Point"
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "probe_profile"
}

# API Model Information
output "api_model_info" {
  description = "API model information for the probe profile"
  value = {
    model_name    = "ProbeProfileScreen"
    resource_type = "probe_profile"
    api_version   = "v2.0"
    supports_crud = true
    supports_tags = true
  }
}