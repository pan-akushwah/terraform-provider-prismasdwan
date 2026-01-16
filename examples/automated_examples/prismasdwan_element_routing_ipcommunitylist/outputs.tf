# IP Community List Details
output "communitylist_details" {
  description = "Details of the created IP Community List"
  value = {
    id             = prismasdwan_element_routing_ipcommunitylist.communitylist_full.id
    name           = prismasdwan_element_routing_ipcommunitylist.communitylist_full.name
    description    = prismasdwan_element_routing_ipcommunitylist.communitylist_full.description
    tags           = prismasdwan_element_routing_ipcommunitylist.communitylist_full.tags
    auto_generated = prismasdwan_element_routing_ipcommunitylist.communitylist_full.auto_generated
    community_list = prismasdwan_element_routing_ipcommunitylist.communitylist_full.community_list
    tfid           = prismasdwan_element_routing_ipcommunitylist.communitylist_full.tfid
    x_etag         = prismasdwan_element_routing_ipcommunitylist.communitylist_full.x_etag
    x_schema       = prismasdwan_element_routing_ipcommunitylist.communitylist_full.x_schema
  }
}

# Individual outputs for easy access
output "communitylist_id" {
  description = "ID of the created IP Community List"
  value       = prismasdwan_element_routing_ipcommunitylist.communitylist_full.id
}

output "communitylist_name" {
  description = "Name of the created IP Community List"
  value       = prismasdwan_element_routing_ipcommunitylist.communitylist_full.name
}

output "communitylist_tfid" {
  description = "Terraform ID of the IP Community List"
  value       = prismasdwan_element_routing_ipcommunitylist.communitylist_full.tfid
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

# Community Analysis
output "community_analysis" {
  description = "Analysis of community list configuration"
  value = {
    total_communities = length(var.community_list)
    permit_communities = length([
      for community in var.community_list : community if community.permit == true
    ])
    deny_communities = length([
      for community in var.community_list : community if community.permit == false
    ])
    
    well_known_communities = length([
      for community in var.community_list : community 
      if contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
    ])
    
    custom_communities = length([
      for community in var.community_list : community 
      if !contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
    ])
    
    has_communities = length(var.community_list) > 0
    
    configuration_type = length(var.community_list) == 0 ? "empty" : (
      length([for community in var.community_list : community if community.permit == false]) > 0 ? "filtering" : "allowing"
    )
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of IP Community List configuration"
  value = {
    communitylist_info = {
      name = var.communitylist_name
      description = var.description
      auto_generated = var.auto_generated
      tag_count = length(var.tags)
    }
    
    community_summary = {
      total_communities = length(var.community_list)
      permit_communities = length([for community in var.community_list : community if community.permit == true])
      deny_communities = length([for community in var.community_list : community if community.permit == false])
      has_communities = length(var.community_list) > 0
    }
    
    community_types = {
      well_known = [
        for community in var.community_list : community.community_str 
        if contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
      ]
      custom_asn_format = [
        for community in var.community_list : community.community_str 
        if can(regex("^[0-9]+:[0-9]+$", community.community_str))
      ]
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "IP Community List deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "element_routing_ipcommunitylist"
    resource_count = 1
    
    configuration_summary = {
      site_name = var.site_name
      element_name = var.element_name
      communitylist_name = var.communitylist_name
      total_communities = length(var.community_list)
      permit_communities = length([for community in var.community_list : community if community.permit == true])
      deny_communities = length([for community in var.community_list : community if community.permit == false])
      auto_generated = var.auto_generated
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of all created resources"
  value = {
    primary_resource = {
      type = "prismasdwan_element_routing_ipcommunitylist"
      id = prismasdwan_element_routing_ipcommunitylist.communitylist_full.id
      name = var.communitylist_name
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
      communities_configured = length(var.community_list) > 0
      has_documentation = var.description != ""
      is_tagged = length(var.tags) > 0
      has_well_known_communities = length([
        for community in var.community_list : community 
        if contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
      ]) > 0
      has_custom_communities = length([
        for community in var.community_list : community 
        if !contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
      ]) > 0
    }
  }
}

# Community Details
output "community_details" {
  description = "Detailed information about each community entry"
  value = {
    communities = [
      for i, community in var.community_list : {
        index = i
        community_string = community.community_str
        action = community.permit ? "permit" : "deny"
        community_type = (
          contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str) ? "well-known" :
          can(regex("^[0-9]+:[0-9]+$", community.community_str)) ? "asn:value" :
          "custom"
        )
        is_well_known = contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
      }
    ]
    
    community_statistics = {
      total_count = length(var.community_list)
      permit_count = length([for community in var.community_list : community if community.permit])
      deny_count = length([for community in var.community_list : community if !community.permit])
      well_known_count = length([
        for community in var.community_list : community 
        if contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
      ])
      custom_count = length([
        for community in var.community_list : community 
        if !contains(["internet", "no-export", "no-advertise", "local-AS"], community.community_str)
      ])
    }
  }
}