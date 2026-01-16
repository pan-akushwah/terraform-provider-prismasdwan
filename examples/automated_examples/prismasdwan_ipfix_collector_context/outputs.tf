# Deployment Status Output
output "deployment_status" {
  description = "Status of the IPFIX collector context deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "ipfix_collector_context"
    status         = "success"
  }
}

# IPFIX Collector Context ID
output "ipfix_collector_context_id" {
  description = "The ID of the created IPFIX collector context"
  value       = prismasdwan_ipfix_collector_context.context_main.id
}

# IPFIX Collector Context Name
output "ipfix_collector_context_name" {
  description = "The name of the created IPFIX collector context"
  value       = prismasdwan_ipfix_collector_context.context_main.name
}

# IPFIX Collector Context Description
output "ipfix_collector_context_description" {
  description = "The description of the IPFIX collector context"
  value       = prismasdwan_ipfix_collector_context.context_main.description
}

# Schema and Etag (computed fields)
output "ipfix_collector_context_schema" {
  description = "Schema version for the IPFIX collector context"
  value       = prismasdwan_ipfix_collector_context.context_main.x_schema
}

output "ipfix_collector_context_etag" {
  description = "Etag for the IPFIX collector context"
  value       = prismasdwan_ipfix_collector_context.context_main.x_etag
}

# TFID (computed field)
output "ipfix_collector_context_tfid" {
  description = "Terraform ID for the IPFIX collector context"
  value       = prismasdwan_ipfix_collector_context.context_main.tfid
}

# Complete IPFIX Collector Context Details
output "ipfix_collector_context_details" {
  description = "Complete details of the created IPFIX collector context"
  value = {
    id          = prismasdwan_ipfix_collector_context.context_main.id
    name        = prismasdwan_ipfix_collector_context.context_main.name
    description = prismasdwan_ipfix_collector_context.context_main.description
    tfid        = prismasdwan_ipfix_collector_context.context_main.tfid
    x_etag      = prismasdwan_ipfix_collector_context.context_main.x_etag
    x_schema    = prismasdwan_ipfix_collector_context.context_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "ipfix_collector_context"
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description = length(prismasdwan_ipfix_collector_context.context_main.description) > 0
    name_length     = length(prismasdwan_ipfix_collector_context.context_main.name)
    desc_length     = length(prismasdwan_ipfix_collector_context.context_main.description)
  }
}

# Context Summary
output "context_summary" {
  description = "Summary of the IPFIX collector context"
  value = {
    context_name        = prismasdwan_ipfix_collector_context.context_main.name
    has_custom_desc     = prismasdwan_ipfix_collector_context.context_main.description != ""
    resource_created_at = timestamp()
  }
}