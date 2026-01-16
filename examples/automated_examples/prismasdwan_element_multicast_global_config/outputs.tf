# Basic Multicast Global Config Information
output "multicast_config_id" {
  description = "The ID of the multicast global configuration"
  value       = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.id
}

output "site_id" {
  description = "The site ID where the multicast config is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "element_id" {
  description = "The element ID where the multicast config is configured"
  value       = prismasdwan_resource_locator.element.result
}

# Detailed Multicast Configuration Information
output "multicast_config_details" {
  description = "Detailed information about the multicast global configuration"
  value = {
    id                        = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.id
    site_id                   = prismasdwan_resource_locator.site.result
    element_id                = prismasdwan_resource_locator.element.result
    igmp_protocol_parameters  = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.igmp_protocol_parameters
    pim_protocol_parameters   = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.pim_protocol_parameters
    dr_priority               = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.dr_priority
    bsm_enabled              = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.bsm_enabled
    spt_switchover_enabled   = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.spt_switchover_enabled
    x_etag                   = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.x_etag
    x_schema                 = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.x_schema
    created_at               = timestamp()
  }
}

# Multicast Configuration Summary
output "multicast_config_summary" {
  description = "Summary of multicast global configuration"
  value = {
    site_name              = var.site_name
    element_name           = var.element_name
    igmp_enabled           = var.enable_igmp
    pim_enabled            = var.enable_pim
    dr_priority            = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.dr_priority
    bsm_enabled           = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.bsm_enabled
    spt_switchover_enabled = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.spt_switchover_enabled
    resource_type          = "element_multicast_global_config"
    api_version            = "v2.1"
  }
}

# Protocol Configuration Status
output "protocol_configuration_status" {
  description = "Status of protocol configurations"
  value = {
    igmp_configured = var.enable_igmp
    pim_configured  = var.enable_pim
    protocols_enabled = compact([
      var.enable_igmp ? "IGMP" : "",
      var.enable_pim ? "PIM" : ""
    ])
    protocol_count = length(compact([
      var.enable_igmp ? "IGMP" : "",
      var.enable_pim ? "PIM" : ""
    ]))
  }
}

# IGMP Configuration Details
output "igmp_configuration" {
  description = "IGMP protocol configuration details"
  value = var.enable_igmp ? {
    enabled                    = var.enable_igmp
    query_max_response_time    = var.igmp_query_max_response_time
    last_member_query_interval = var.igmp_last_member_query_interval
    last_member_query_count    = var.igmp_last_member_query_count
    query_interval             = var.igmp_query_interval
  } : {
    enabled = false
    message = "IGMP protocol is disabled"
  }
}

# PIM Configuration Details
output "pim_configuration" {
  description = "PIM protocol configuration details"
  value = var.enable_pim ? {
    enabled             = var.enable_pim
    join_prune_interval = var.pim_join_prune_interval
    hello_hold_time     = var.pim_hello_hold_time
    hello_interval      = var.pim_hello_interval
  } : {
    enabled = false
    message = "PIM protocol is disabled"
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved    = prismasdwan_resource_locator.site.result
    element_resolved = prismasdwan_resource_locator.element.result
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the multicast global configuration deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_multicast_global_config"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    element_resolved = prismasdwan_resource_locator.element.result != null
    api_version      = "v2.1"
    api_model        = "MulticastGlobalConfigScreenV2N1"
  }
}

# Schema and Etag (computed fields)
output "multicast_config_schema" {
  description = "Schema version for the multicast global configuration"
  value       = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.x_schema
}

output "multicast_config_etag" {
  description = "Etag for the multicast global configuration"
  value       = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_multicast_global_config"
}

# Multicast Features Status
output "multicast_features_status" {
  description = "Status of multicast features"
  value = {
    dr_priority_configured    = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.dr_priority != null
    bsm_enabled              = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.bsm_enabled
    spt_switchover_enabled   = prismasdwan_element_multicast_global_config.element_multicast_global_config_full.spt_switchover_enabled
    advanced_features_count  = length(compact([
      prismasdwan_element_multicast_global_config.element_multicast_global_config_full.bsm_enabled ? "BSM" : "",
      prismasdwan_element_multicast_global_config.element_multicast_global_config_full.spt_switchover_enabled ? "SPT_SWITCHOVER" : ""
    ]))
  }
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name                      = var.site_name
    element_name                   = var.element_name
    enable_igmp                    = var.enable_igmp
    enable_pim                     = var.enable_pim
    igmp_query_max_response_time   = var.igmp_query_max_response_time
    igmp_last_member_query_interval = var.igmp_last_member_query_interval
    igmp_last_member_query_count   = var.igmp_last_member_query_count
    igmp_query_interval            = var.igmp_query_interval
    pim_join_prune_interval        = var.pim_join_prune_interval
    pim_hello_hold_time            = var.pim_hello_hold_time
    pim_hello_interval             = var.pim_hello_interval
    dr_priority                    = var.dr_priority
    bsm_enabled                   = var.bsm_enabled
    spt_switchover_enabled        = var.spt_switchover_enabled
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid     = prismasdwan_resource_locator.site.result != null
    element_association_valid  = prismasdwan_resource_locator.element.result != null
    igmp_parameters_valid     = var.enable_igmp
    pim_parameters_valid      = var.enable_pim
    dr_priority_in_range      = var.dr_priority >= 1 && var.dr_priority <= 4294967295
    all_validations_passed    = prismasdwan_resource_locator.site.result != null && prismasdwan_resource_locator.element.result != null
  }
}

# Timer Configuration Summary
output "timer_configuration_summary" {
  description = "Summary of all timer configurations"
  value = {
    igmp_timers = var.enable_igmp ? {
      query_max_response_time    = var.igmp_query_max_response_time
      last_member_query_interval = var.igmp_last_member_query_interval
      query_interval             = var.igmp_query_interval
    } : null
    pim_timers = var.enable_pim ? {
      join_prune_interval = var.pim_join_prune_interval
      hello_hold_time     = var.pim_hello_hold_time
      hello_interval      = var.pim_hello_interval
    } : null
  }
}