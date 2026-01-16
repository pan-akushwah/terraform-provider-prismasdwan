# Basic SNMP Trap Information
output "snmp_trap_id" {
  description = "The ID of the SNMP trap configuration"
  value       = prismasdwan_element_snmp_trap.element_snmp_trap_full.id
}

output "site_id" {
  description = "The site ID where the SNMP trap is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "element_id" {
  description = "The element ID where the SNMP trap is configured"
  value       = prismasdwan_resource_locator.element.result
}

# Detailed SNMP Trap Information (marked as sensitive due to potential sensitive config)
output "snmp_trap_details" {
  description = "Detailed information about the SNMP trap configuration"
  value = {
    id               = prismasdwan_element_snmp_trap.element_snmp_trap_full.id
    site_id          = prismasdwan_resource_locator.site.result
    element_id       = prismasdwan_resource_locator.element.result
    version          = prismasdwan_element_snmp_trap.element_snmp_trap_full.version
    server_ip        = prismasdwan_element_snmp_trap.element_snmp_trap_full.server_ip
    enabled          = prismasdwan_element_snmp_trap.element_snmp_trap_full.enabled
    source_interface = prismasdwan_element_snmp_trap.element_snmp_trap_full.source_interface
    description      = prismasdwan_element_snmp_trap.element_snmp_trap_full.description
    tags             = prismasdwan_element_snmp_trap.element_snmp_trap_full.tags
    v2_config        = prismasdwan_element_snmp_trap.element_snmp_trap_full.v2_config
    v3_config        = prismasdwan_element_snmp_trap.element_snmp_trap_full.v3_config
    x_etag           = prismasdwan_element_snmp_trap.element_snmp_trap_full.x_etag
    x_schema         = prismasdwan_element_snmp_trap.element_snmp_trap_full.x_schema
    created_at       = timestamp()
  }
  sensitive = true
}

# SNMP Trap Configuration Summary (non-sensitive summary)
output "snmp_trap_summary" {
  description = "Summary of SNMP trap configuration"
  value = {
    site_name        = var.site_name
    element_name     = var.element_name
    version          = prismasdwan_element_snmp_trap.element_snmp_trap_full.version
    server_ip        = prismasdwan_element_snmp_trap.element_snmp_trap_full.server_ip
    enabled          = prismasdwan_element_snmp_trap.element_snmp_trap_full.enabled
    source_interface = prismasdwan_element_snmp_trap.element_snmp_trap_full.source_interface
    has_description  = prismasdwan_element_snmp_trap.element_snmp_trap_full.description != null
    has_tags         = prismasdwan_element_snmp_trap.element_snmp_trap_full.tags != null
    resource_type    = "element_snmp_trap"
    api_version      = "v2.0"
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
  description = "Status of the SNMP trap deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_snmp_trap"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    element_resolved = prismasdwan_resource_locator.element.result != null
    api_version      = "v2.0"
    api_model        = "SNMPTrap"
  }
}

# Schema and Etag (computed fields)
output "snmp_trap_schema" {
  description = "Schema version for the SNMP trap"
  value       = prismasdwan_element_snmp_trap.element_snmp_trap_full.x_schema
}

output "snmp_trap_etag" {
  description = "Etag for the SNMP trap"
  value       = prismasdwan_element_snmp_trap.element_snmp_trap_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_snmp_trap"
}

# SNMP Version and Configuration Info (non-sensitive)
output "snmp_configuration_info" {
  description = "SNMP configuration information"
  value = {
    version                    = var.snmp_version
    snmp_v2_configured        = var.snmp_version == "v2"
    snmp_v3_configured        = var.snmp_version == "v3"
    v2_community_configured   = var.snmp_version == "v2" && var.v2_community != null && var.v2_community != ""
    v3_user_configured        = var.snmp_version == "v3" && var.v3_user_name != null && var.v3_user_name != ""
    v3_security_level         = var.snmp_version == "v3" ? var.v3_security_level : null
    v3_auth_enabled           = var.snmp_version == "v3" && var.v3_auth_type != "NONE"
    v3_encryption_enabled     = var.snmp_version == "v3" && var.v3_enc_type != "NONE"
  }
  sensitive = true
}

# Server Configuration (non-sensitive)
output "server_configuration" {
  description = "SNMP trap server configuration"
  value = {
    server_ip        = prismasdwan_element_snmp_trap.element_snmp_trap_full.server_ip
    enabled          = prismasdwan_element_snmp_trap.element_snmp_trap_full.enabled
    source_interface = prismasdwan_element_snmp_trap.element_snmp_trap_full.source_interface
    has_source_interface = prismasdwan_element_snmp_trap.element_snmp_trap_full.source_interface != null
  }
}

# Input Configuration Echo (non-sensitive parts only)
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name         = var.site_name
    element_name      = var.element_name
    version           = var.snmp_version
    server_ip         = var.server_ip
    enabled           = var.enabled
    source_interface  = var.source_interface
    description       = var.description
    tags              = var.tags
    v3_security_level = var.snmp_version == "v3" ? var.v3_security_level : null
    v3_auth_type      = var.snmp_version == "v3" ? var.v3_auth_type : null
    v3_enc_type       = var.snmp_version == "v3" ? var.v3_enc_type : null
  }
}

# Security Configuration Summary (non-sensitive)
output "security_summary" {
  description = "Summary of security configuration"
  value = {
    version = var.snmp_version
    authentication_configured = var.snmp_version == "v2" ? (var.v2_community != null && var.v2_community != "") : (var.snmp_version == "v3" && var.v3_auth_type != "NONE")
    encryption_configured = var.snmp_version == "v3" && var.v3_enc_type != "NONE"
    security_level = var.snmp_version == "v3" ? var.v3_security_level : "community-based"
  }
  sensitive = true
}

# Trap Status Information
output "trap_status" {
  description = "Status information about the SNMP trap"
  value = {
    enabled = prismasdwan_element_snmp_trap.element_snmp_trap_full.enabled
    configured_for_element = prismasdwan_resource_locator.element.result != null
    configured_for_site = prismasdwan_resource_locator.site.result != null
    trap_destination = prismasdwan_element_snmp_trap.element_snmp_trap_full.server_ip
  }
}