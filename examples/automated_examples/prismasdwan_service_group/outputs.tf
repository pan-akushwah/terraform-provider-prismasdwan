# Service Group ID
output "service_group_id" {
  description = "The ID of the created service group"
  value       = prismasdwan_service_group.service_group_main.id
}

# Service Group Name
output "service_group_name" {
  description = "The name of the created service group"
  value       = prismasdwan_service_group.service_group_main.name
}

# Service Group Type
output "service_group_type" {
  description = "The type of the created service group"
  value       = prismasdwan_service_group.service_group_main.type
}

# Complete Service Group Details
output "service_group_details" {
  description = "Complete details of the created service group"
  value = {
    id              = prismasdwan_service_group.service_group_main.id
    name            = prismasdwan_service_group.service_group_main.name
    type            = prismasdwan_service_group.service_group_main.type
    description     = prismasdwan_service_group.service_group_main.description
    tags            = prismasdwan_service_group.service_group_main.tags
    sase_properties = prismasdwan_service_group.service_group_main.sase_properties
    x_etag          = prismasdwan_service_group.service_group_main.x_etag
    x_schema        = prismasdwan_service_group.service_group_main.x_schema
  }
}

# Basic Information
output "service_group_description" {
  description = "Description of the service group"
  value       = prismasdwan_service_group.service_group_main.description
}

output "service_group_tags" {
  description = "Tags of the service group"
  value       = prismasdwan_service_group.service_group_main.tags
}

# SASE Properties
output "sase_properties" {
  description = "SASE properties of the service group"
  value       = prismasdwan_service_group.service_group_main.sase_properties
}

# Schema and Etag (computed fields)
output "service_group_schema" {
  description = "Schema version for the service group"
  value       = prismasdwan_service_group.service_group_main.x_schema
}

output "service_group_etag" {
  description = "Etag for the service group"
  value       = prismasdwan_service_group.service_group_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of service group configuration"
  value = {
    service_name      = prismasdwan_service_group.service_group_main.name
    service_id        = prismasdwan_service_group.service_group_main.id
    service_type      = prismasdwan_service_group.service_group_main.type
    has_description   = prismasdwan_service_group.service_group_main.description != null
    has_tags          = prismasdwan_service_group.service_group_main.tags != null
    tag_count         = prismasdwan_service_group.service_group_main.tags != null ? length(prismasdwan_service_group.service_group_main.tags) : 0
    is_sase_type      = prismasdwan_service_group.service_group_main.type == "SASE"
    has_sase_props    = prismasdwan_service_group.service_group_main.sase_properties != null
    resource_type     = "service_group"
    api_model         = "ServiceLabelV2N1"
  }
}

# Type Analysis
output "type_analysis" {
  description = "Analysis of the service group type"
  value = {
    type_category         = prismasdwan_service_group.service_group_main.type
    is_cg_transit        = prismasdwan_service_group.service_group_main.type == "cg-transit"
    is_non_cg_transit    = prismasdwan_service_group.service_group_main.type == "non-cg-transit"
    is_sase              = prismasdwan_service_group.service_group_main.type == "SASE"
    transit_capable      = contains(["cg-transit", "non-cg-transit"], prismasdwan_service_group.service_group_main.type)
    cloud_capable        = prismasdwan_service_group.service_group_main.type == "SASE"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the service group"
  value = {
    name_valid        = length(prismasdwan_service_group.service_group_main.name) > 0 && length(prismasdwan_service_group.service_group_main.name) <= 128
    type_valid        = contains(["cg-transit", "non-cg-transit", "SASE"], prismasdwan_service_group.service_group_main.type)
    description_valid = prismasdwan_service_group.service_group_main.description == null ? true : length(prismasdwan_service_group.service_group_main.description) <= 256
    tags_count_valid  = prismasdwan_service_group.service_group_main.tags == null ? true : length(prismasdwan_service_group.service_group_main.tags) <= 10
    has_id            = prismasdwan_service_group.service_group_main.id != null
    has_schema        = prismasdwan_service_group.service_group_main.x_schema != null
    has_etag          = prismasdwan_service_group.service_group_main.x_etag != null
    id_is_transient   = true
    proper_sase_config = prismasdwan_service_group.service_group_main.type == "SASE" ? (prismasdwan_service_group.service_group_main.sase_properties != null) : true
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "service_group"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the service group deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "service_group"
    status         = "success"
    api_version    = "v2.1"
    api_model      = "ServiceLabelV2N1"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags            = length(var.tags)
    tag_list              = var.tags
    has_terraform_tag     = contains(var.tags, "terraform")
    has_service_group_tag = contains(var.tags, "service-group")
    has_enterprise_tag    = contains(var.tags, "enterprise")
    max_tag_length        = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit     = length(var.tags) <= 10
    all_tags_valid        = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
    tags_compliance       = {
      length_compliant = alltrue([for tag in var.tags : length(tag) <= 128])
      format_compliant = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
      count_compliant  = length(var.tags) <= 10
    }
  }
}

# Service Classification
output "service_classification" {
  description = "Service classification and capabilities"
  value = {
    service_category = {
      name = prismasdwan_service_group.service_group_main.type
      description = prismasdwan_service_group.service_group_main.type == "cg-transit" ? "CloudGenix Transit Service" : prismasdwan_service_group.service_group_main.type == "non-cg-transit" ? "Non-CloudGenix Transit Service" : prismasdwan_service_group.service_group_main.type == "SASE" ? "Secure Access Service Edge" : "Unknown"
    }
    capabilities = {
      transit_support         = contains(["cg-transit", "non-cg-transit"], prismasdwan_service_group.service_group_main.type)
      cloud_native           = prismasdwan_service_group.service_group_main.type == "SASE"
      edge_optimization      = prismasdwan_service_group.service_group_main.type == "cg-transit"
      third_party_integration = prismasdwan_service_group.service_group_main.type == "non-cg-transit"
    }
    use_cases = prismasdwan_service_group.service_group_main.type == "cg-transit" ? ["SD-WAN optimization", "Branch connectivity", "Traffic steering"] : prismasdwan_service_group.service_group_main.type == "non-cg-transit" ? ["Third-party integration", "Legacy service support", "Hybrid connectivity"] : prismasdwan_service_group.service_group_main.type == "SASE" ? ["Cloud security", "Zero trust access", "Remote worker connectivity"] : []
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_service_group.service_group_main ${prismasdwan_service_group.service_group_main.id}"
    import_block = {
      to = "prismasdwan_service_group.service_group_main"
      id = prismasdwan_service_group.service_group_main.id
    }
  }
}

# API Information
output "api_information" {
  description = "API endpoint information for this resource"
  value = {
    get_api    = "/sdwan/v2.1/api/servicelabels/${prismasdwan_service_group.service_group_main.id}"
    post_api   = "/sdwan/v2.1/api/servicelabels"
    put_api    = "/sdwan/v2.1/api/servicelabels/${prismasdwan_service_group.service_group_main.id}"
    delete_api = "/sdwan/v2.1/api/servicelabels/${prismasdwan_service_group.service_group_main.id}"
    api_model  = "ServiceLabelV2N1"
    api_version = "v2.1"
  }
}

# Schema Information
output "schema_information" {
  description = "Schema and structure information"
  value = {
    required_fields = ["type", "name"]
    optional_fields = ["description", "tags", "sase_properties"]
    computed_fields = ["id", "_etag", "_schema"]
    nested_objects  = ["sase_properties"]
    id_type         = "transient"
    etag_minimum    = 1
    schema_minimum  = 1
    max_tags        = 10
    max_tag_length  = 128
    tag_regex       = "^[^,\\\\s]+$"
    enum_values     = {
      type = ["cg-transit", "non-cg-transit", "SASE"]
    }
  }
}

# Usage Examples
output "usage_examples" {
  description = "Usage examples and best practices"
  value = {
    use_cases = [
      "Network service classification",
      "Service label management",
      "Traffic routing policies",
      "SASE service integration",
      "Multi-tenant service organization"
    ]
    best_practices = [
      "Use descriptive names for easy identification",
      "Tag resources for better organization",
      "Keep descriptions under 256 characters",
      "Avoid commas and whitespace in tags",
      "Choose appropriate service group type",
      "Configure SASE properties only for SASE type",
      "Use consistent naming conventions"
    ]
    related_resources = [
      "prismasdwan_service_endpoint",
      "prismasdwan_policy_set",
      "prismasdwan_network_policy",
      "prismasdwan_routing_policy"
    ]
    type_selection_guide = {
      cg_transit = {
        description = "Use for CloudGenix native transit services"
        scenarios = ["SD-WAN optimization", "Branch connectivity", "Native edge services"]
      }
      non_cg_transit = {
        description = "Use for third-party or legacy transit services"
        scenarios = ["Third-party integration", "Legacy system support", "Hybrid deployments"]
      }
      SASE = {
        description = "Use for Secure Access Service Edge services"
        scenarios = ["Cloud security", "Zero trust access", "Remote worker connectivity"]
        requires = ["active_sase_label configuration"]
      }
    }
  }
}

# SASE Analysis
output "sase_analysis" {
  description = "SASE-specific analysis and configuration"
  value = {
    is_sase_type = var.service_group_type == "SASE"
    sase_config = {
      active_label_configured = var.active_sase_label != null
      active_label_value = var.active_sase_label
      sase_properties_required = var.service_group_type == "SASE"
    }
    sase_capabilities = var.service_group_type == "SASE" ? {
      cloud_security = true
      zero_trust = true
      remote_access = true
      policy_enforcement = true
    } : null
  }
}

# Service Architecture
output "service_architecture" {
  description = "Service architecture and design patterns"
  value = {
    architecture_type = prismasdwan_service_group.service_group_main.type
    design_pattern = prismasdwan_service_group.service_group_main.type == "cg-transit" ? "Native SD-WAN" : prismasdwan_service_group.service_group_main.type == "non-cg-transit" ? "Hybrid Integration" : prismasdwan_service_group.service_group_main.type == "SASE" ? "Cloud-Native Security" : "Unknown"
    deployment_model = {
      cloud_first = prismasdwan_service_group.service_group_main.type == "SASE"
      edge_optimized = prismasdwan_service_group.service_group_main.type == "cg-transit"
      hybrid_ready = prismasdwan_service_group.service_group_main.type == "non-cg-transit"
    }
    integration_points = prismasdwan_service_group.service_group_main.type == "cg-transit" ? ["SD-WAN fabric", "Branch sites", "Data centers"] : prismasdwan_service_group.service_group_main.type == "non-cg-transit" ? ["Third-party systems", "Legacy infrastructure", "External services"] : prismasdwan_service_group.service_group_main.type == "SASE" ? ["Cloud platforms", "Remote workers", "Mobile devices"] : []
  }
}
