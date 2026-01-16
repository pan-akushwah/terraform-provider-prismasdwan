# Deployment Status Output
output "deployment_status" {
  description = "Status of the WAN network deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "wan_network"
    status         = "success"
  }
}

# WAN Network ID
output "wan_network_id" {
  description = "The ID of the created WAN network"
  value       = prismasdwan_wan_network.network_main.id
}

# WAN Network Name
output "wan_network_name" {
  description = "The name of the created WAN network"
  value       = prismasdwan_wan_network.network_main.name
}

# WAN Network Type
output "wan_network_type" {
  description = "The type of the WAN network"
  value       = prismasdwan_wan_network.network_main.type
}

# WAN Network Description
output "wan_network_description" {
  description = "The description of the WAN network"
  value       = prismasdwan_wan_network.network_main.description
}

# Tags
output "tags" {
  description = "Tags assigned to the WAN network"
  value       = prismasdwan_wan_network.network_main.tags
}

# Schema and Etag (computed fields)
output "wan_network_schema" {
  description = "Schema version for the WAN network"
  value       = prismasdwan_wan_network.network_main.x_schema
}

output "wan_network_etag" {
  description = "Etag for the WAN network"
  value       = prismasdwan_wan_network.network_main.x_etag
}

# Complete WAN Network Details
output "wan_network_details" {
  description = "Complete details of the created WAN network"
  value = {
    id          = prismasdwan_wan_network.network_main.id
    name        = prismasdwan_wan_network.network_main.name
    type        = prismasdwan_wan_network.network_main.type
    description = prismasdwan_wan_network.network_main.description
    tags        = prismasdwan_wan_network.network_main.tags
    x_etag      = prismasdwan_wan_network.network_main.x_etag
    x_schema    = prismasdwan_wan_network.network_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "wan_network"
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_wan_network.network_main.tags)
}

# Network Analysis
output "network_analysis" {
  description = "Analysis of the WAN network configuration"
  value = {
    is_public_wan  = prismasdwan_wan_network.network_main.type == "publicwan"
    is_private_wan = prismasdwan_wan_network.network_main.type == "privatevan"
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description = prismasdwan_wan_network.network_main.description != null ? length(prismasdwan_wan_network.network_main.description) > 0 : false
    has_tags        = length(prismasdwan_wan_network.network_main.tags) > 0
    name_length     = length(prismasdwan_wan_network.network_main.name)
    desc_length     = prismasdwan_wan_network.network_main.description != null ? length(prismasdwan_wan_network.network_main.description) : 0
  }
}

# WAN Network Validation
output "network_validation" {
  description = "Validation checks for the WAN network"
  value = {
    name_valid        = length(prismasdwan_wan_network.network_main.name) > 0 && length(prismasdwan_wan_network.network_main.name) <= 128
    type_valid        = contains(["publicwan", "privatevan"], prismasdwan_wan_network.network_main.type)
    description_valid = prismasdwan_wan_network.network_main.description != null ? length(prismasdwan_wan_network.network_main.description) <= 256 : true
    tags_count_valid  = length(prismasdwan_wan_network.network_main.tags) <= 10
    has_id           = prismasdwan_wan_network.network_main.id != null
    has_schema       = prismasdwan_wan_network.network_main.x_schema != null
    has_etag         = prismasdwan_wan_network.network_main.x_etag != null
  }
}