# Deployment Status Output
output "deployment_status" {
  description = "Status of the IPFIX local prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "ipfix_local_prefix"
    status         = "success"
  }
}

# IPFIX Local Prefix ID
output "ipfix_local_prefix_id" {
  description = "The ID of the created IPFIX local prefix"
  value       = prismasdwan_ipfix_local_prefix.prefix_main.id
}

# IPFIX Local Prefix Name
output "ipfix_local_prefix_name" {
  description = "The name of the created IPFIX local prefix"
  value       = prismasdwan_ipfix_local_prefix.prefix_main.name
}

# IPFIX Local Prefix Description
output "ipfix_local_prefix_description" {
  description = "The description of the IPFIX local prefix"
  value       = prismasdwan_ipfix_local_prefix.prefix_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the IPFIX local prefix"
  value       = prismasdwan_ipfix_local_prefix.prefix_main.tags
}

# Schema and Etag (computed fields)
output "ipfix_local_prefix_schema" {
  description = "Schema version for the IPFIX local prefix"
  value       = prismasdwan_ipfix_local_prefix.prefix_main.x_schema
}

output "ipfix_local_prefix_etag" {
  description = "Etag for the IPFIX local prefix"
  value       = prismasdwan_ipfix_local_prefix.prefix_main.x_etag
}

# Complete IPFIX Local Prefix Details
output "ipfix_local_prefix_details" {
  description = "Complete details of the created IPFIX local prefix"
  value = {
    id          = prismasdwan_ipfix_local_prefix.prefix_main.id
    name        = prismasdwan_ipfix_local_prefix.prefix_main.name
    description = prismasdwan_ipfix_local_prefix.prefix_main.description
    tags        = prismasdwan_ipfix_local_prefix.prefix_main.tags
    x_etag      = prismasdwan_ipfix_local_prefix.prefix_main.x_etag
    x_schema    = prismasdwan_ipfix_local_prefix.prefix_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "ipfix_local_prefix"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_ipfix_local_prefix.prefix_main.tags)
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description = length(prismasdwan_ipfix_local_prefix.prefix_main.description) > 0
    has_tags       = length(prismasdwan_ipfix_local_prefix.prefix_main.tags) > 0
    name_length    = length(prismasdwan_ipfix_local_prefix.prefix_main.name)
  }
}