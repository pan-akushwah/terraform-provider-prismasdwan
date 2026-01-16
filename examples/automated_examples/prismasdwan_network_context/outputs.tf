# Deployment Status Output
output "deployment_status" {
  description = "Status of the network context deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "network_context"
    status         = "success"
  }
}

# Network Context ID
output "network_context_id" {
  description = "The ID of the created network context"
  value       = prismasdwan_network_context.context_main.id
}

# Network Context Name
output "network_context_name" {
  description = "The name of the created network context"
  value       = prismasdwan_network_context.context_main.name
}

# Network Context Description
output "network_context_description" {
  description = "The description of the network context"
  value       = prismasdwan_network_context.context_main.description
}

# Schema and Etag (computed fields)
output "network_context_schema" {
  description = "Schema version for the network context"
  value       = prismasdwan_network_context.context_main.x_schema
}

output "network_context_etag" {
  description = "Etag for the network context"
  value       = prismasdwan_network_context.context_main.x_etag
}

# Complete Network Context Details
output "network_context_details" {
  description = "Complete details of the created network context"
  value = {
    id          = prismasdwan_network_context.context_main.id
    name        = prismasdwan_network_context.context_main.name
    description = prismasdwan_network_context.context_main.description
    x_etag      = prismasdwan_network_context.context_main.x_etag
    x_schema    = prismasdwan_network_context.context_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "network_context"
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description = length(prismasdwan_network_context.context_main.description) > 0
    name_length     = length(prismasdwan_network_context.context_main.name)
    desc_length     = length(prismasdwan_network_context.context_main.description)
  }
}
