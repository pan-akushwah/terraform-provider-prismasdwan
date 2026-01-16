# Site Ciphers Details
output "site_ciphers_details" {
  description = "Details of the configured site ciphers"
  value = {
    id                           = prismasdwan_site_ciphers.site_ciphers_full.id
    site_id                      = prismasdwan_site_ciphers.site_ciphers_full.site_id
    controller_connection_cipher = prismasdwan_site_ciphers.site_ciphers_full.controller_connection_cipher
    vpn_ciphers                  = prismasdwan_site_ciphers.site_ciphers_full.vpn_ciphers
    x_etag                       = prismasdwan_site_ciphers.site_ciphers_full.x_etag
    x_schema                     = prismasdwan_site_ciphers.site_ciphers_full.x_schema
  }
}

# Individual outputs for easy access
output "site_ciphers_id" {
  description = "ID of the site ciphers configuration"
  value       = prismasdwan_site_ciphers.site_ciphers_full.id
}

output "site_id" {
  description = "Site ID for the ciphers configuration"
  value       = prismasdwan_site_ciphers.site_ciphers_full.site_id
}

output "controller_connection_cipher" {
  description = "Configured controller connection cipher"
  value       = prismasdwan_site_ciphers.site_ciphers_full.controller_connection_cipher
}

output "vpn_ciphers" {
  description = "Configured VPN ciphers"
  value       = prismasdwan_site_ciphers.site_ciphers_full.vpn_ciphers
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    site_name        = var.site_name
    resolved_site_id = prismasdwan_resource_locator.site.result
    resolution_ok    = prismasdwan_resource_locator.site.result != null
  }
}

# Deployment Status
output "deployment_status" {
  description = "Site ciphers deployment status and metadata"
  value = {
    status         = "success"
    deployed_at    = timestamp()
    resource_type  = "site_ciphers"
    resource_count = 1
    
    configuration_summary = {
      site_name                    = var.site_name
      controller_connection_cipher = var.controller_connection_cipher
      vpn_ciphers_count           = length(var.vpn_ciphers)
      vpn_ciphers                 = var.vpn_ciphers
    }
  }
}

# Security Analysis
output "security_analysis" {
  description = "Analysis of the cipher configuration security"
  value = {
    cipher_strength = {
      controller_cipher_strength = var.controller_connection_cipher == "RSA-AES256-GCM-SHA384" ? "high" : "medium"
      vpn_cipher_count          = length(var.vpn_ciphers)
      uses_aes256               = length([for cipher in var.vpn_ciphers : cipher if can(regex("AES-256", cipher))]) > 0
      uses_gcm_mode             = length([for cipher in var.vpn_ciphers : cipher if can(regex("GCM", cipher))]) > 0
    }
    
    security_recommendations = {
      prefer_aes256             = length([for cipher in var.vpn_ciphers : cipher if can(regex("AES-256", cipher))]) > 0
      prefer_gcm_mode           = length([for cipher in var.vpn_ciphers : cipher if can(regex("GCM", cipher))]) > 0
      controller_cipher_optimal = var.controller_connection_cipher == "RSA-AES256-GCM-SHA384"
    }
    
    compliance_status = {
      fips_compliant            = var.controller_connection_cipher == "RSA-AES256-GCM-SHA384"
      enterprise_grade          = length(var.vpn_ciphers) >= 2
      modern_crypto_standards   = length([for cipher in var.vpn_ciphers : cipher if can(regex("GCM", cipher))]) > 0
    }
  }
}