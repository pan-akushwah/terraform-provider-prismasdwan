# Basic SNMP Agent Information
output "snmp_agent_id" {
  description = "The ID of the SNMP agent configuration"
  value       = prismasdwan_element_snmp_agent.element_snmp_agent_full.id
}

output "site_id" {
  description = "The site ID where the SNMP agent is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "element_id" {
  description = "The element ID where the SNMP agent is configured"
  value       = prismasdwan_resource_locator.element.result
}

# Detailed SNMP Agent Information (marked as sensitive due to potential sensitive config)
output "snmp_agent_details" {
  description = "Detailed information about the SNMP agent configuration"
  value = {
    id               = prismasdwan_element_snmp_agent.element_snmp_agent_full.id
    site_id          = prismasdwan_resource_locator.site.result
    element_id       = prismasdwan_resource_locator.element.result
    system_location  = prismasdwan_element_snmp_agent.element_snmp_agent_full.system_location
    system_contact   = prismasdwan_element_snmp_agent.element_snmp_agent_full.system_contact
    description      = prismasdwan_element_snmp_agent.element_snmp_agent_full.description
    tags             = prismasdwan_element_snmp_agent.element_snmp_agent_full.tags
    v2_config        = prismasdwan_element_snmp_agent.element_snmp_agent_full.v2_config
    v3_config        = prismasdwan_element_snmp_agent.element_snmp_agent_full.v3_config
    x_etag           = prismasdwan_element_snmp_agent.element_snmp_agent_full.x_etag
    x_schema         = prismasdwan_element_snmp_agent.element_snmp_agent_full.x_schema
    created_at       = timestamp()
  }
  sensitive = true
}

# SNMP Configuration Summary (non-sensitive summary)
output "snmp_configuration_summary" {
  description = "Summary of SNMP configuration"
  value = {
    site_name           = var.site_name
    element_name        = var.element_name
    system_location     = prismasdwan_element_snmp_agent.element_snmp_agent_full.system_location
    system_contact      = prismasdwan_element_snmp_agent.element_snmp_agent_full.system_contact
    v2_enabled          = var.v2_enabled
    v3_enabled          = var.v3_enabled
    v3_users_count      = var.v3_enabled ? length(var.v3_users) : 0
    has_description     = prismasdwan_element_snmp_agent.element_snmp_agent_full.description != null
    has_tags            = prismasdwan_element_snmp_agent.element_snmp_agent_full.tags != null
    resource_type       = "element_snmp_agent"
    api_version         = "v2.1"
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
  description = "Status of the SNMP agent deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_snmp_agent"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    element_resolved = prismasdwan_resource_locator.element.result != null
    api_version      = "v2.1"
    api_model        = "SNMPAgentV2N1"
  }
}

# Schema and Etag (computed fields)
output "snmp_agent_schema" {
  description = "Schema version for the SNMP agent"
  value       = prismasdwan_element_snmp_agent.element_snmp_agent_full.x_schema
}

output "snmp_agent_etag" {
  description = "Etag for the SNMP agent"
  value       = prismasdwan_element_snmp_agent.element_snmp_agent_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_snmp_agent"
}

# SNMP Version Support (non-sensitive version info only)
output "snmp_version_support" {
  description = "SNMP version support information"
  value = {
    v2_enabled = var.v2_enabled
    v3_enabled = var.v3_enabled
    v2_community_configured = var.v2_enabled && var.v2_community != null && var.v2_community != ""
    v3_users_configured = var.v3_enabled && length(var.v3_users) > 0
  }
  sensitive = true
}

# Input Configuration Echo (non-sensitive parts only)
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name        = var.site_name
    element_name     = var.element_name
    system_location  = var.system_location
    system_contact   = var.system_contact
    description      = var.description
    tags             = var.tags
    v2_enabled       = var.v2_enabled
    v3_enabled       = var.v3_enabled
    v3_users_count   = length(var.v3_users)
  }
}

# System Information (public information)
output "system_information" {
  description = "SNMP system information"
  value = {
    system_location = prismasdwan_element_snmp_agent.element_snmp_agent_full.system_location
    system_contact  = prismasdwan_element_snmp_agent.element_snmp_agent_full.system_contact
  }
}

# Configuration Status (non-sensitive)
output "configuration_status" {
  description = "Status of SNMP configuration components"
  value = {
    snmp_agent_configured = prismasdwan_element_snmp_agent.element_snmp_agent_full.id != null
    v2_protocol_enabled   = var.v2_enabled
    v3_protocol_enabled   = var.v3_enabled
    authentication_methods = compact([
      var.v2_enabled ? "SNMPv2c" : "",
      var.v3_enabled ? "SNMPv3" : ""
    ])
  }
}