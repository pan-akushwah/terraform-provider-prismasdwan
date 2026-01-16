# Hub Cluster Details
output "hub_cluster_details" {
  description = "Details of the created hub cluster"
  value = {
    id                         = prismasdwan_site_hub_cluster.hub_cluster_full.id
    name                       = prismasdwan_site_hub_cluster.hub_cluster_full.name
    description                = prismasdwan_site_hub_cluster.hub_cluster_full.description
    tags                       = prismasdwan_site_hub_cluster.hub_cluster_full.tags
    default_cluster            = prismasdwan_site_hub_cluster.hub_cluster_full.default_cluster
    site_count_alarm_threshold = prismasdwan_site_hub_cluster.hub_cluster_full.site_count_alarm_threshold
    peer_sites                 = prismasdwan_site_hub_cluster.hub_cluster_full.peer_sites
    tfid                       = prismasdwan_site_hub_cluster.hub_cluster_full.tfid
    x_etag                     = prismasdwan_site_hub_cluster.hub_cluster_full.x_etag
    x_schema                   = prismasdwan_site_hub_cluster.hub_cluster_full.x_schema
  }
}

# Individual outputs for easy access
output "hub_cluster_id" {
  description = "ID of the created hub cluster"
  value       = prismasdwan_site_hub_cluster.hub_cluster_full.id
}

output "hub_cluster_name" {
  description = "Name of the created hub cluster"
  value       = prismasdwan_site_hub_cluster.hub_cluster_full.name
}

output "hub_cluster_tfid" {
  description = "Terraform ID of the hub cluster"
  value       = prismasdwan_site_hub_cluster.hub_cluster_full.tfid
}

output "hub_site_resolved" {
  description = "Resolved hub site ID from name"
  value       = prismasdwan_resource_locator.hub_site.result
}

output "peer_sites_resolved" {
  description = "Resolved peer site IDs from names"
  value       = [for locator in prismasdwan_resource_locator.peer_sites : locator.result]
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of hub cluster configuration"
  value = {
    cluster_properties = {
      name_length           = length(var.hub_cluster_name)
      description_length    = length(var.description)
      is_default           = var.default_cluster
      alarm_threshold      = var.site_count_alarm_threshold
    }
    
    connectivity_analysis = {
      hub_site_name    = var.hub_site_name
      peer_sites_count = length(var.peer_site_names)
      peer_site_names  = var.peer_site_names
      connectivity_scope = (
        length(var.peer_site_names) >= 10 ? "enterprise" :
        length(var.peer_site_names) >= 5 ? "regional" :
        length(var.peer_site_names) >= 2 ? "basic" : "minimal"
      )
    }
  }
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    hub_site_resolution = {
      site_name   = var.hub_site_name
      resolved_id = prismasdwan_resource_locator.hub_site.result
    }
    
    peer_sites_resolution = {
      requested_count = length(var.peer_site_names)
      resolved_count  = length(prismasdwan_resource_locator.peer_sites)
      site_mappings = {
        for i, name in var.peer_site_names : name => prismasdwan_resource_locator.peer_sites[i].result
      }
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Hub cluster deployment status and metadata"
  value = {
    status              = "success"
    deployed_at        = timestamp()
    resource_type      = "site_hub_cluster"
    resource_count     = 1
    peer_sites_count   = length(var.peer_site_names)
    cluster_ready      = true
    default_cluster    = var.default_cluster
    monitoring_enabled = var.site_count_alarm_threshold > 0
    
    resource_dependencies = {
      hub_site_resolved     = prismasdwan_resource_locator.hub_site.result != null
      peer_sites_resolved   = length(prismasdwan_resource_locator.peer_sites) == length(var.peer_site_names)
      all_dependencies_met  = (
        prismasdwan_resource_locator.hub_site.result != null &&
        length(prismasdwan_resource_locator.peer_sites) == length(var.peer_site_names)
      )
    }
    
    # Note about element assignment
    note = "Hub elements must be assigned to the cluster after creation via separate operations"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of tags configuration"
  value = {
    total_tags = length(var.tags)
    tags_list  = var.tags
    tags_compliance = {
      within_limit     = length(var.tags) <= 10
      valid_format     = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
      unique_tags      = length(var.tags) == length(distinct(var.tags))
      max_length_ok    = alltrue([for tag in var.tags : length(tag) <= 1024])
    }
    
    tag_categories = {
      infrastructure_tags = length([for tag in var.tags : tag if contains(["terraform", "infrastructure", "automation"], tag)])
      network_tags       = length([for tag in var.tags : tag if contains(["hub-cluster", "routing", "connectivity"], tag)])
      environment_tags   = length([for tag in var.tags : tag if contains(["production", "staging", "development"], tag)])
    }
  }
}