# Element Toolkit Details
output "element_toolkit_details" {
  description = "Details of the configured Element Toolkit"
  value = {
    id                      = prismasdwan_element_toolkit.element_toolkit_full.id
    ssh_outbound_enabled    = prismasdwan_element_toolkit.element_toolkit_full.ssh_outbound_enabled
    ssh_enabled             = prismasdwan_element_toolkit.element_toolkit_full.ssh_enabled
    otpkey_version          = prismasdwan_element_toolkit.element_toolkit_full.otpkey_version
    account_disable_interval = prismasdwan_element_toolkit.element_toolkit_full.account_disable_interval
    retry_login_count       = prismasdwan_element_toolkit.element_toolkit_full.retry_login_count
    inactive_interval       = prismasdwan_element_toolkit.element_toolkit_full.inactive_interval
    x_etag                  = prismasdwan_element_toolkit.element_toolkit_full.x_etag
    x_schema                = prismasdwan_element_toolkit.element_toolkit_full.x_schema
  }
}

# Individual outputs for easy access
output "element_toolkit_id" {
  description = "ID of the Element Toolkit configuration"
  value       = prismasdwan_element_toolkit.element_toolkit_full.id
}

output "ssh_configuration" {
  description = "SSH configuration status"
  value = {
    ssh_enabled = prismasdwan_element_toolkit.element_toolkit_full.ssh_enabled
    ssh_outbound_enabled = prismasdwan_element_toolkit.element_toolkit_full.ssh_outbound_enabled
  }
}

output "security_settings" {
  description = "Security and authentication settings"
  value = {
    otpkey_version = prismasdwan_element_toolkit.element_toolkit_full.otpkey_version
    account_disable_interval = prismasdwan_element_toolkit.element_toolkit_full.account_disable_interval
    retry_login_count = prismasdwan_element_toolkit.element_toolkit_full.retry_login_count
    inactive_interval = prismasdwan_element_toolkit.element_toolkit_full.inactive_interval
  }
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    site_resolution = {
      site_name     = var.site_name
      resolved_id   = prismasdwan_resource_locator.site.result
      resolution_ok = prismasdwan_resource_locator.site.result != null
    }
    
    element_resolution = {
      element_name  = var.element_name
      resolved_id   = prismasdwan_resource_locator.element.result
      resolution_ok = prismasdwan_resource_locator.element.result != null
    }
    
    overall_resolution_status = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.element.result != null
    ) ? "success" : "failed"
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of Element Toolkit configuration"
  value = {
    element_info = {
      site_name = var.site_name
      element_name = var.element_name
      element_id = prismasdwan_resource_locator.element.result
    }
    
    access_configuration = {
      ssh_enabled = var.ssh_enabled
      ssh_outbound_enabled = var.ssh_outbound_enabled
      both_ssh_enabled = var.ssh_enabled && var.ssh_outbound_enabled
    }
    
    security_configuration = {
      otpkey_version = var.otpkey_version
      account_disable_interval = var.account_disable_interval
      retry_login_count = var.retry_login_count
      inactive_interval = var.inactive_interval
      has_secure_timeouts = var.account_disable_interval <= 30 && var.inactive_interval <= 30
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Element Toolkit deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "element_toolkit"
    resource_count = 1
    
    configuration_summary = {
      site_name = var.site_name
      element_name = var.element_name
      ssh_enabled = var.ssh_enabled
      ssh_outbound_enabled = var.ssh_outbound_enabled
      security_configured = true
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of all created resources"
  value = {
    primary_resource = {
      type = "prismasdwan_element_toolkit"
      id = prismasdwan_element_toolkit.element_toolkit_full.id
      element_name = var.element_name
    }
    
    dependencies = {
      site = {
        name = var.site_name
        id = prismasdwan_resource_locator.site.result
      }
      element = {
        name = var.element_name
        id = prismasdwan_resource_locator.element.result
      }
    }
    
    configuration_health = {
      ssh_configured = var.ssh_enabled || var.ssh_outbound_enabled
      security_timeouts_configured = true
      authentication_configured = var.otpkey_version > 0
      login_controls_configured = var.retry_login_count > 0
    }
  }
}

# Security Analysis
output "security_analysis" {
  description = "Analysis of security configuration"
  value = {
    access_control = {
      ssh_inbound_enabled = var.ssh_enabled
      ssh_outbound_enabled = var.ssh_outbound_enabled
      ssh_access_level = var.ssh_enabled && var.ssh_outbound_enabled ? "full" : (
        var.ssh_enabled ? "inbound_only" : (
          var.ssh_outbound_enabled ? "outbound_only" : "disabled"
        )
      )
    }
    
    session_security = {
      inactive_session_timeout = var.inactive_interval
      account_lockout_time = var.account_disable_interval
      max_login_attempts = var.retry_login_count
      otp_authentication = var.otpkey_version > 0
    }
    
    security_posture = {
      has_session_timeouts = var.inactive_interval <= 30
      has_account_lockout = var.account_disable_interval <= 45
      has_login_limits = var.retry_login_count <= 10
      secure_configuration = (
        var.inactive_interval <= 30 &&
        var.account_disable_interval <= 45 &&
        var.retry_login_count <= 10
      )
    }
  }
}