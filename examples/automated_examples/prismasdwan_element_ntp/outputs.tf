# Basic NTP Configuration Information
output "ntp_id" {
  description = "The ID of the NTP configuration"
  value       = prismasdwan_element_ntp.element_ntp_full.id
}

output "element_id" {
  description = "The element ID where the NTP configuration is applied"
  value       = prismasdwan_resource_locator.element.result
}

# Detailed NTP Configuration Information
output "ntp_details" {
  description = "Detailed information about the NTP configuration"
  value = {
    id                   = prismasdwan_element_ntp.element_ntp_full.id
    element_id           = prismasdwan_resource_locator.element.result
    name                 = prismasdwan_element_ntp.element_ntp_full.name
    description          = prismasdwan_element_ntp.element_ntp_full.description
    tags                 = prismasdwan_element_ntp.element_ntp_full.tags
    source_interface_ids = prismasdwan_element_ntp.element_ntp_full.source_interface_ids
    ntp_servers          = prismasdwan_element_ntp.element_ntp_full.ntp_servers
    x_etag               = prismasdwan_element_ntp.element_ntp_full.x_etag
    x_schema             = prismasdwan_element_ntp.element_ntp_full.x_schema
    created_at           = timestamp()
  }
}

# NTP Servers Configuration
output "ntp_servers_configuration" {
  description = "NTP servers configuration details"
  value = {
    ntp_servers  = prismasdwan_element_ntp.element_ntp_full.ntp_servers
    server_count = length(prismasdwan_element_ntp.element_ntp_full.ntp_servers)
    server_hosts = [for server in prismasdwan_element_ntp.element_ntp_full.ntp_servers : server.host]
  }
}

# Source Interface Configuration
output "source_interface_configuration" {
  description = "Source interface configuration for NTP"
  value = {
    source_interface_ids = prismasdwan_element_ntp.element_ntp_full.source_interface_ids
    interface_count = prismasdwan_element_ntp.element_ntp_full.source_interface_ids != null ? length(prismasdwan_element_ntp.element_ntp_full.source_interface_ids) : 0
    interfaces_from_names = var.source_interface_names != null ? true : false
    interface_names_used = var.source_interface_names
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    element_resolved = prismasdwan_resource_locator.element.result
    source_interfaces_resolved = var.source_interface_names != null ? [for locator in prismasdwan_resource_locator.source_interfaces : locator.result] : null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of NTP configuration"
  value = {
    element_name      = var.element_name
    element_id        = prismasdwan_resource_locator.element.result
    ntp_name          = prismasdwan_element_ntp.element_ntp_full.name
    server_count      = length(prismasdwan_element_ntp.element_ntp_full.ntp_servers)
    interface_count   = prismasdwan_element_ntp.element_ntp_full.source_interface_ids != null ? length(prismasdwan_element_ntp.element_ntp_full.source_interface_ids) : 0
    has_description   = prismasdwan_element_ntp.element_ntp_full.description != null
    has_tags          = prismasdwan_element_ntp.element_ntp_full.tags != null
    resource_type     = "element_ntp"
    api_version       = "v2.1"
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the NTP configuration deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_ntp"
    status           = "success"
    element_resolved = prismasdwan_resource_locator.element.result != null
    api_version      = "v2.1"
    api_model        = "ElementNTPV2N1"
  }
}

# Schema and Etag (computed fields)
output "ntp_schema" {
  description = "Schema version for the NTP configuration"
  value       = prismasdwan_element_ntp.element_ntp_full.x_schema
}

output "ntp_etag" {
  description = "Etag for the NTP configuration"
  value       = prismasdwan_element_ntp.element_ntp_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_ntp"
}

# Basic NTP Server Information (simplified)
output "ntp_server_hosts" {
  description = "List of NTP server hostnames"
  value       = [for server in prismasdwan_element_ntp.element_ntp_full.ntp_servers : server.host]
}

output "ntp_server_versions" {
  description = "List of NTP server versions"
  value       = [for server in prismasdwan_element_ntp.element_ntp_full.ntp_servers : server.version]
}

# Input Variables Echo (for verification)
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    element_name             = var.element_name
    ntp_name                 = var.ntp_name
    description              = var.description
    tags                     = var.tags
    source_interface_names   = var.source_interface_names
    source_interface_ids     = var.source_interface_ids
    ntp_servers_count        = length(var.ntp_servers)
  }
}