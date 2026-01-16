# Deployment Status Output
output "deployment_status" {
  description = "Status of the global prefix filter deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "global_prefix_filter"
    status         = "success"
  }
}

# Global Prefix Filter ID
output "global_prefix_filter_id" {
  description = "The ID of the created global prefix filter"
  value       = prismasdwan_global_prefix_filter.filter_main.id
}

# Global Prefix Filter TFID
output "global_prefix_filter_tfid" {
  description = "The Terraform ID of the created global prefix filter"
  value       = prismasdwan_global_prefix_filter.filter_main.tfid
}

# Global Prefix Filter Name
output "global_prefix_filter_name" {
  description = "The name of the created global prefix filter"
  value       = prismasdwan_global_prefix_filter.filter_main.name
}

# Global Prefix Filter Filters
output "global_prefix_filter_filters" {
  description = "The filters configuration of the global prefix filter"
  value       = prismasdwan_global_prefix_filter.filter_main.filters
}

# Complete Global Prefix Filter Details
output "global_prefix_filter_details" {
  description = "Complete details of the created global prefix filter"
  value = {
    id          = prismasdwan_global_prefix_filter.filter_main.id
    tfid        = prismasdwan_global_prefix_filter.filter_main.tfid
    name        = prismasdwan_global_prefix_filter.filter_main.name
    description = prismasdwan_global_prefix_filter.filter_main.description
    filters     = prismasdwan_global_prefix_filter.filter_main.filters
    x_etag      = prismasdwan_global_prefix_filter.filter_main.x_etag
    x_schema    = prismasdwan_global_prefix_filter.filter_main.x_schema
  }
}

# Filter Type Output
output "filter_type" {
  description = "The type of global prefix filter"
  value       = "global_prefix_filter"
}

# IP Prefixes Count
output "ip_prefixes_count" {
  description = "Total number of IP prefixes across all filters"
  value       = length(flatten([for filter in prismasdwan_global_prefix_filter.filter_main.filters : filter.ip_prefixes]))
}