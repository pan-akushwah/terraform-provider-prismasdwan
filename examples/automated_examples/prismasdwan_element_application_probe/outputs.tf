# Basic Application Probe Information
output "application_probe_id" {
  description = "The ID of the element application probe"
  value       = prismasdwan_element_application_probe.element_application_probe_full.id
}

output "site_id" {
  description = "The site ID where the application probe is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "element_id" {
  description = "The element ID where the application probe is configured"
  value       = prismasdwan_resource_locator.element.result
}

output "probe_name" {
  description = "The name of the application probe"
  value       = prismasdwan_element_application_probe.element_application_probe_full.name
}

output "probe_enabled" {
  description = "Whether the application probe is enabled"
  value       = prismasdwan_element_application_probe.element_application_probe_full.enable_probe
}

# Detailed Application Probe Information
output "application_probe_details" {
  description = "Detailed information about the element application probe"
  value = {
    id                  = prismasdwan_element_application_probe.element_application_probe_full.id
    site_id             = prismasdwan_resource_locator.site.result
    element_id          = prismasdwan_resource_locator.element.result
    name                = prismasdwan_element_application_probe.element_application_probe_full.name
    description         = prismasdwan_element_application_probe.element_application_probe_full.description
    enable_probe        = prismasdwan_element_application_probe.element_application_probe_full.enable_probe
    tags                = prismasdwan_element_application_probe.element_application_probe_full.tags
    source_interface_id = prismasdwan_element_application_probe.element_application_probe_full.source_interface_id
    x_etag              = prismasdwan_element_application_probe.element_application_probe_full.x_etag
    x_schema            = prismasdwan_element_application_probe.element_application_probe_full.x_schema
    created_at          = timestamp()
  }
}

# Application Probe Configuration Summary
output "application_probe_summary" {
  description = "Summary of element application probe configuration"
  value = {
    site_name           = var.site_name
    element_name        = var.element_name
    probe_name          = prismasdwan_element_application_probe.element_application_probe_full.name
    probe_status        = prismasdwan_element_application_probe.element_application_probe_full.enable_probe ? "enabled" : "disabled"
    has_description     = prismasdwan_element_application_probe.element_application_probe_full.description != null
    has_tags           = prismasdwan_element_application_probe.element_application_probe_full.tags != null
    has_source_interface = prismasdwan_element_application_probe.element_application_probe_full.source_interface_id != null
    tags_count         = length(prismasdwan_element_application_probe.element_application_probe_full.tags != null ? prismasdwan_element_application_probe.element_application_probe_full.tags : [])
    resource_type      = "element_application_probe"
    api_version        = "v2.0"
  }
}

# Source Interface Information
output "source_interface_info" {
  description = "Information about the source interface configuration"
  value = {
    interface_configured = var.source_interface_name != null
    interface_name      = var.source_interface_name
    interface_id        = var.source_interface_name != null ? prismasdwan_resource_locator.source_interface[0].result : null
    interface_resolved  = var.source_interface_name != null ? (prismasdwan_resource_locator.source_interface[0].result != null) : false
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    element_resolved = prismasdwan_resource_locator.element.result
    source_interface_resolved = var.source_interface_name != null ? prismasdwan_resource_locator.source_interface[0].result : null
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the element application probe deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_application_probe"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    element_resolved = prismasdwan_resource_locator.element.result != null
    probe_enabled    = prismasdwan_element_application_probe.element_application_probe_full.enable_probe
    api_version      = "v2.0"
    api_model        = "ApplicationProbeScreen"
  }
}

# Schema and Etag (computed fields)
output "application_probe_schema" {
  description = "Schema version for the element application probe"
  value       = prismasdwan_element_application_probe.element_application_probe_full.x_schema
}

output "application_probe_etag" {
  description = "Etag for the element application probe"
  value       = prismasdwan_element_application_probe.element_application_probe_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_application_probe"
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name             = var.site_name
    element_name          = var.element_name
    probe_name            = var.probe_name
    description           = var.description
    enable_probe          = var.enable_probe
    tags                  = var.tags
    source_interface_name = var.source_interface_name
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid      = prismasdwan_resource_locator.site.result != null
    element_association_valid   = prismasdwan_resource_locator.element.result != null
    probe_name_valid           = length(var.probe_name) > 0 && length(var.probe_name) <= 128
    description_valid          = length(var.description) <= 256
    tags_count_valid           = length(var.tags) <= 10
    tags_format_valid          = alltrue([for tag in var.tags : length(tag) <= 128])
    source_interface_valid     = var.source_interface_name == null || (var.source_interface_name != null && prismasdwan_resource_locator.source_interface[0].result != null)
    all_validations_passed = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.element.result != null &&
      length(var.probe_name) > 0 && 
      length(var.probe_name) <= 128
    )
  }
}

# Probe Configuration Analysis
output "probe_configuration_analysis" {
  description = "Analysis of the probe configuration"
  value = {
    probe_status = prismasdwan_element_application_probe.element_application_probe_full.enable_probe ? "active" : "inactive"
    configuration_completeness = {
      has_name = prismasdwan_element_application_probe.element_application_probe_full.name != null
      has_description = prismasdwan_element_application_probe.element_application_probe_full.description != null && length(prismasdwan_element_application_probe.element_application_probe_full.description) > 0
      has_tags = prismasdwan_element_application_probe.element_application_probe_full.tags != null && length(prismasdwan_element_application_probe.element_application_probe_full.tags) > 0
      has_source_interface = prismasdwan_element_application_probe.element_application_probe_full.source_interface_id != null
      is_enabled = prismasdwan_element_application_probe.element_application_probe_full.enable_probe
    }
    probe_characteristics = {
      name_length = length(prismasdwan_element_application_probe.element_application_probe_full.name)
      description_length = length(prismasdwan_element_application_probe.element_application_probe_full.description != null ? prismasdwan_element_application_probe.element_application_probe_full.description : "")
      tags_count = length(prismasdwan_element_application_probe.element_application_probe_full.tags != null ? prismasdwan_element_application_probe.element_application_probe_full.tags : [])
      is_interface_specific = prismasdwan_element_application_probe.element_application_probe_full.source_interface_id != null
    }
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_element_application_probe.element_application_probe_full.tags
    tags_count      = length(prismasdwan_element_application_probe.element_application_probe_full.tags != null ? prismasdwan_element_application_probe.element_application_probe_full.tags : [])
    has_tags        = prismasdwan_element_application_probe.element_application_probe_full.tags != null && length(prismasdwan_element_application_probe.element_application_probe_full.tags) > 0
    tags_analysis = {
      for tag in (prismasdwan_element_application_probe.element_application_probe_full.tags != null ? prismasdwan_element_application_probe.element_application_probe_full.tags : []) : tag => {
        length = length(tag)
        is_valid_format = can(regex("^[^,\\s]+$", tag))
        tag_type = (
          contains(["terraform", "infrastructure", "automation"], tag) ? "infrastructure" :
          contains(["monitoring", "probe", "application", "performance"], tag) ? "monitoring" :
          contains(["production", "staging", "development", "test"], tag) ? "environment" :
          "custom"
        )
      }
    }
  }
}

# Probe Operational Status
output "probe_operational_status" {
  description = "Operational status and characteristics of the probe"
  value = {
    operational_state = prismasdwan_element_application_probe.element_application_probe_full.enable_probe ? "operational" : "disabled"
    deployment_readiness = {
      site_ready = prismasdwan_resource_locator.site.result != null
      element_ready = prismasdwan_resource_locator.element.result != null
      probe_configured = prismasdwan_element_application_probe.element_application_probe_full.name != null
      interface_ready = var.source_interface_name == null || (var.source_interface_name != null && prismasdwan_resource_locator.source_interface[0].result != null)
      fully_ready = (
        prismasdwan_resource_locator.site.result != null &&
        prismasdwan_resource_locator.element.result != null &&
        prismasdwan_element_application_probe.element_application_probe_full.name != null &&
        (var.source_interface_name == null || prismasdwan_resource_locator.source_interface[0].result != null)
      )
    }
    probe_metadata = {
      creation_timestamp = timestamp()
      probe_id = prismasdwan_element_application_probe.element_application_probe_full.id
      schema_version = prismasdwan_element_application_probe.element_application_probe_full.x_schema
      etag_value = prismasdwan_element_application_probe.element_application_probe_full.x_etag
    }
  }
}

# Interface Configuration Details
output "interface_configuration_details" {
  description = "Detailed information about interface configuration"
  value = {
    source_interface_configured = var.source_interface_name != null
    source_interface_details = var.source_interface_name != null ? {
      interface_name = var.source_interface_name
      interface_id = prismasdwan_resource_locator.source_interface[0].result
      resolution_successful = prismasdwan_resource_locator.source_interface[0].result != null
    } : null
    interface_binding_status = var.source_interface_name != null ? (
      prismasdwan_resource_locator.source_interface[0].result != null ? "bound" : "unresolved"
    ) : "not_configured"
  }
}

# Configuration Compliance Check
output "configuration_compliance_check" {
  description = "Compliance check for probe configuration"
  value = {
    naming_compliance = {
      name_within_limits = length(var.probe_name) > 0 && length(var.probe_name) <= 128
      description_within_limits = length(var.description) <= 256
      name_format_valid = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]*$", var.probe_name))
    }
    tags_compliance = {
      tags_count_compliant = length(var.tags) <= 10
      all_tags_valid_length = alltrue([for tag in var.tags : length(tag) <= 128])
      all_tags_valid_format = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
      no_duplicate_tags = length(var.tags) == length(distinct(var.tags))
    }
    resource_compliance = {
      site_resolvable = prismasdwan_resource_locator.site.result != null
      element_resolvable = prismasdwan_resource_locator.element.result != null
      interface_resolvable = var.source_interface_name == null || prismasdwan_resource_locator.source_interface[0].result != null
    }
    overall_compliance = (
      length(var.probe_name) > 0 && length(var.probe_name) <= 128 &&
      length(var.description) <= 256 &&
      length(var.tags) <= 10 &&
      alltrue([for tag in var.tags : length(tag) <= 128]) &&
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.element.result != null &&
      (var.source_interface_name == null || prismasdwan_resource_locator.source_interface[0].result != null)
    )
  }
}

# Probe Statistics
output "probe_statistics" {
  description = "Statistical information about the probe configuration"
  value = {
    configuration_metrics = {
      name_character_count = length(var.probe_name)
      description_character_count = length(var.description)
      tags_count = length(var.tags)
      total_tag_characters = sum([for tag in var.tags : length(tag)])
      average_tag_length = length(var.tags) > 0 ? sum([for tag in var.tags : length(tag)]) / length(var.tags) : 0
    }
    resource_utilization = {
      uses_custom_interface = var.source_interface_name != null
      has_descriptive_info = length(var.description) > 0
      is_tagged = length(var.tags) > 0
      configuration_density = (
        (length(var.description) > 0 ? 1 : 0) +
        (length(var.tags) > 0 ? 1 : 0) +
        (var.source_interface_name != null ? 1 : 0)
      ) / 3.0
    }
  }
}
