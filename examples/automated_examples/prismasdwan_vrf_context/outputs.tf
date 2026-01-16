# Deployment Status Output
output "deployment_status" {
  description = "Status of the VRF context deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "vrf_context"
    status         = "success"
  }
}

# VRF Context ID
output "vrf_context_id" {
  description = "The ID of the created VRF context"
  value       = prismasdwan_vrf_context.context_main.id
}

# VRF Context Name
output "vrf_context_name" {
  description = "The name of the created VRF context"
  value       = prismasdwan_vrf_context.context_main.name
}

# VRF Context Description
output "vrf_context_description" {
  description = "The description of the VRF context"
  value       = prismasdwan_vrf_context.context_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the VRF context"
  value       = prismasdwan_vrf_context.context_main.tags
}

# Schema and Etag (computed fields)
output "vrf_context_schema" {
  description = "Schema version for the VRF context"
  value       = prismasdwan_vrf_context.context_main.x_schema
}

output "vrf_context_etag" {
  description = "Etag for the VRF context"
  value       = prismasdwan_vrf_context.context_main.x_etag
}

# Complete VRF Context Details
output "vrf_context_details" {
  description = "Complete details of the created VRF context"
  value = {
    id          = prismasdwan_vrf_context.context_main.id
    name        = prismasdwan_vrf_context.context_main.name
    description = prismasdwan_vrf_context.context_main.description
    tags        = prismasdwan_vrf_context.context_main.tags
    x_etag      = prismasdwan_vrf_context.context_main.x_etag
    x_schema    = prismasdwan_vrf_context.context_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "vrf_context"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_vrf_context.context_main.tags)
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description = length(prismasdwan_vrf_context.context_main.description) > 0
    has_tags       = length(prismasdwan_vrf_context.context_main.tags) > 0
    name_length    = length(prismasdwan_vrf_context.context_main.name)
    desc_length    = length(prismasdwan_vrf_context.context_main.description)
  }
}

# Context Summary
output "context_summary" {
  description = "Summary of the VRF context"
  value = {
    context_name        = prismasdwan_vrf_context.context_main.name
    has_custom_desc     = prismasdwan_vrf_context.context_main.description != ""
    has_tags           = length(prismasdwan_vrf_context.context_main.tags) > 0
    resource_created_at = timestamp()
  }
}

# VRF Context Validation
output "context_validation" {
  description = "Validation checks for the VRF context"
  value = {
    name_valid        = can(regex("^[A-Za-z][A-Za-z0-9_\\s-]*$", prismasdwan_vrf_context.context_main.name))
    name_length_valid = length(prismasdwan_vrf_context.context_main.name) > 0 && length(prismasdwan_vrf_context.context_main.name) <= 128
    description_valid = length(prismasdwan_vrf_context.context_main.description) <= 256
    tags_count_valid  = length(prismasdwan_vrf_context.context_main.tags) <= 10
    has_id           = prismasdwan_vrf_context.context_main.id != null
    has_schema       = prismasdwan_vrf_context.context_main.x_schema != null
    has_etag         = prismasdwan_vrf_context.context_main.x_etag != null
  }
}