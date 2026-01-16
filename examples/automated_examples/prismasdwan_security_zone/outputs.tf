# Deployment Status Output
output "deployment_status" {
  description = "Status of the security zone deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "security_zone"
    status         = "success"
  }
}

# Security Zone ID
output "security_zone_id" {
  description = "The ID of the created security zone"
  value       = prismasdwan_security_zone.security_zone_main.id
}

# Security Zone Name
output "security_zone_name" {
  description = "The name of the created security zone"
  value       = prismasdwan_security_zone.security_zone_main.name
}

# Description
output "security_zone_description" {
  description = "The description of the security zone"
  value       = prismasdwan_security_zone.security_zone_main.description
}

# TCP Allow Non-SYN Setting
output "tcp_allow_non_syn" {
  description = "TCP allow non-SYN setting for the security zone"
  value       = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn
}

# Schema and Etag (computed fields)
output "security_zone_schema" {
  description = "Schema version for the security zone"
  value       = prismasdwan_security_zone.security_zone_main.x_schema
}

output "security_zone_etag" {
  description = "Etag for the security zone"
  value       = prismasdwan_security_zone.security_zone_main.x_etag
}

# Complete Security Zone Details
output "security_zone_details" {
  description = "Complete details of the created security zone"
  value = {
    id                = prismasdwan_security_zone.security_zone_main.id
    name              = prismasdwan_security_zone.security_zone_main.name
    description       = prismasdwan_security_zone.security_zone_main.description
    tcp_allow_non_syn = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn
    x_etag            = prismasdwan_security_zone.security_zone_main.x_etag
    x_schema          = prismasdwan_security_zone.security_zone_main.x_schema
  }
}

# Security Zone Analysis
output "zone_analysis" {
  description = "Analysis of the security zone configuration"
  value = {
    has_description       = prismasdwan_security_zone.security_zone_main.description != null
    has_tcp_non_syn_rule  = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn != null
    tcp_security_enabled  = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn == false
  }
}

# Validation Results
output "zone_validation" {
  description = "Validation checks for the security zone"
  value = {
    name_valid        = length(prismasdwan_security_zone.security_zone_main.name) > 0 && length(prismasdwan_security_zone.security_zone_main.name) <= 128
    description_valid = prismasdwan_security_zone.security_zone_main.description == null ? true : length(prismasdwan_security_zone.security_zone_main.description) <= 256
    has_id            = prismasdwan_security_zone.security_zone_main.id != null
    has_schema        = prismasdwan_security_zone.security_zone_main.x_schema != null
    has_etag          = prismasdwan_security_zone.security_zone_main.x_etag != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "security_zone"
}

# Security Configuration Summary
output "security_configuration_summary" {
  description = "Summary of security zone configuration"
  value = {
    zone_name             = prismasdwan_security_zone.security_zone_main.name
    zone_id               = prismasdwan_security_zone.security_zone_main.id
    has_custom_description = prismasdwan_security_zone.security_zone_main.description != null
    tcp_non_syn_allowed   = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn
    security_level        = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn == false ? "strict" : "permissive"
  }
}

# Configuration Counts
output "configuration_counts" {
  description = "Counts of various configuration elements"
  value = {
    total_zones           = 1
    has_description       = prismasdwan_security_zone.security_zone_main.description != null ? 1 : 0
    has_tcp_rules         = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn != null ? 1 : 0
  }
}

# Zone Type Classification
output "zone_type" {
  description = "Classification of the security zone type"
  value = {
    zone_scope            = "security"
    is_basic_zone         = prismasdwan_security_zone.security_zone_main.description == null && prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn == null
    is_configured_zone    = prismasdwan_security_zone.security_zone_main.description != null || prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn != null
    has_tcp_restrictions  = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn == false
  }
}

# Security Features Summary
output "security_features" {
  description = "Summary of security features enabled"
  value = {
    tcp_syn_only_enforcement = prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn == false
    has_descriptive_info     = prismasdwan_security_zone.security_zone_main.description != null
    zone_fully_configured    = prismasdwan_security_zone.security_zone_main.description != null && prismasdwan_security_zone.security_zone_main.tcp_allow_non_syn != null
  }
}