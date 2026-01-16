# Route Map Details
output "routemap_details" {
  description = "Details of the created Routing Route Map"
  value = {
    id                = prismasdwan_element_routing_routemap.routemap_full.id
    name              = prismasdwan_element_routing_routemap.routemap_full.name
    description       = prismasdwan_element_routing_routemap.routemap_full.description
    tags              = prismasdwan_element_routing_routemap.routemap_full.tags
    used_for          = prismasdwan_element_routing_routemap.routemap_full.used_for
    auto_generated    = prismasdwan_element_routing_routemap.routemap_full.auto_generated
    route_map_entries = prismasdwan_element_routing_routemap.routemap_full.route_map_entries
    tfid              = prismasdwan_element_routing_routemap.routemap_full.tfid
    x_etag            = prismasdwan_element_routing_routemap.routemap_full.x_etag
    x_schema          = prismasdwan_element_routing_routemap.routemap_full.x_schema
  }
}

# Individual outputs for easy access
output "routemap_id" {
  description = "ID of the created Routing Route Map"
  value       = prismasdwan_element_routing_routemap.routemap_full.id
}

output "routemap_name" {
  description = "Name of the created Routing Route Map"
  value       = prismasdwan_element_routing_routemap.routemap_full.name
}

output "routemap_tfid" {
  description = "Terraform ID of the Routing Route Map"
  value       = prismasdwan_element_routing_routemap.routemap_full.tfid
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

# Route Map Analysis
output "routemap_analysis" {
  description = "Analysis of route map configuration"
  value = {
    total_entries = length(var.route_map_entries)
    permit_entries = length([
      for entry in var.route_map_entries : entry if entry.permit == true
    ])
    deny_entries = length([
      for entry in var.route_map_entries : entry if entry.permit == false
    ])
    
    entries_with_match = length([
      for entry in var.route_map_entries : entry if entry.match != null
    ])
    
    entries_with_set = length([
      for entry in var.route_map_entries : entry if entry.set != null
    ])
    
    entries_with_continue = length([
      for entry in var.route_map_entries : entry if entry.continue_entry != null
    ])
    
    has_entries = length(var.route_map_entries) > 0
    
    configuration_type = length(var.route_map_entries) == 0 ? "empty" : (
      length([for entry in var.route_map_entries : entry if entry.permit == false]) > 0 ? "filtering" : "allowing"
    )
    
    protocol_usage = var.used_for
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of Routing Route Map configuration"
  value = {
    routemap_info = {
      name = var.routemap_name
      description = var.description
      used_for = var.used_for
      auto_generated = var.auto_generated
      tag_count = length(var.tags)
    }
    
    entry_summary = {
      total_entries = length(var.route_map_entries)
      permit_entries = length([for entry in var.route_map_entries : entry if entry.permit == true])
      deny_entries = length([for entry in var.route_map_entries : entry if entry.permit == false])
      has_entries = length(var.route_map_entries) > 0
    }
    
    functionality_summary = {
      has_match_conditions = length([for entry in var.route_map_entries : entry if entry.match != null]) > 0
      has_set_actions = length([for entry in var.route_map_entries : entry if entry.set != null]) > 0
      has_continue_entries = length([for entry in var.route_map_entries : entry if entry.continue_entry != null]) > 0
      protocol = var.used_for
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Route Map deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "element_routing_routemap"
    resource_count = 1
    
    configuration_summary = {
      site_name = var.site_name
      element_name = var.element_name
      routemap_name = var.routemap_name
      used_for = var.used_for
      total_entries = length(var.route_map_entries)
      permit_entries = length([for entry in var.route_map_entries : entry if entry.permit == true])
      deny_entries = length([for entry in var.route_map_entries : entry if entry.permit == false])
      auto_generated = var.auto_generated
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of all created resources"
  value = {
    primary_resource = {
      type = "prismasdwan_element_routing_routemap"
      id = prismasdwan_element_routing_routemap.routemap_full.id
      name = var.routemap_name
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
      entries_configured = length(var.route_map_entries) > 0
      has_documentation = var.description != ""
      is_tagged = length(var.tags) > 0
      has_match_conditions = length([for entry in var.route_map_entries : entry if entry.match != null]) > 0
      has_set_actions = length([for entry in var.route_map_entries : entry if entry.set != null]) > 0
      protocol_specified = var.used_for != ""
    }
  }
}

# Route Map Entry Details
output "routemap_entry_details" {
  description = "Detailed information about each route map entry"
  value = {
    entries = [
      for i, entry in var.route_map_entries : {
        index = i
        order = entry.order
        action = entry.permit ? "permit" : "deny"
        has_match = entry.match != null
        has_set = entry.set != null
        has_continue = entry.continue_entry != null
        continue_entry = entry.continue_entry
        
        match_conditions = entry.match != null ? {
          metric = entry.match.metric
          tag = entry.match.tag
          community_list_id = entry.match.community_list_id
          ip_next_hop_id = entry.match.ip_next_hop_id
          ip_prefix_list_id = entry.match.ip_prefix_list_id
          as_path_id = entry.match.as_path_id
        } : null
        
        set_actions = entry.set != null ? {
          metric = entry.set.metric
          type = entry.set.type
          additive_community = entry.set.additive_community
          tag = entry.set.tag
          ip_v6_next_hop = entry.set.ip_v6_next_hop
          ip_next_hop = entry.set.ip_next_hop
          community = entry.set.community
          weight = entry.set.weight
          local_preference = entry.set.local_preference
          as_path_prepend = entry.set.as_path_prepend
        } : null
      }
    ]
    
    entry_statistics = {
      total_count = length(var.route_map_entries)
      permit_count = length([for entry in var.route_map_entries : entry if entry.permit])
      deny_count = length([for entry in var.route_map_entries : entry if !entry.permit])
      match_conditions_count = length([for entry in var.route_map_entries : entry if entry.match != null])
      set_actions_count = length([for entry in var.route_map_entries : entry if entry.set != null])
      continue_entries_count = length([for entry in var.route_map_entries : entry if entry.continue_entry != null])
    }
  }
}
# Match Conditions Analysis - Fixed null handling
output "match_conditions_analysis" {
  description = "Analysis of match conditions used in route map entries"
  value = {
    total_entries_with_match = length([for entry in var.route_map_entries : entry if entry.match != null])
    
    match_types_used = {
      metric_matches = length([
        for entry in var.route_map_entries : entry 
        if entry.match != null ? (entry.match.metric != null ? true : false) : false
      ])
      tag_matches = length([
        for entry in var.route_map_entries : entry 
        if entry.match != null ? (entry.match.tag != null ? true : false) : false
      ])
      community_list_matches = length([
        for entry in var.route_map_entries : entry 
        if entry.match != null ? (entry.match.community_list_id != null ? true : false) : false
      ])
      next_hop_matches = length([
        for entry in var.route_map_entries : entry 
        if entry.match != null ? (entry.match.ip_next_hop_id != null ? true : false) : false
      ])
      prefix_list_matches = length([
        for entry in var.route_map_entries : entry 
        if entry.match != null ? (entry.match.ip_prefix_list_id != null ? true : false) : false
      ])
      as_path_matches = length([
        for entry in var.route_map_entries : entry 
        if entry.match != null ? (entry.match.as_path_id != null ? true : false) : false
      ])
    }
    
    has_complex_matching = length([
      for entry in var.route_map_entries : entry 
      if entry.match != null ? (
        (entry.match.metric != null ? 1 : 0) +
        (entry.match.tag != null ? 1 : 0) +
        (entry.match.community_list_id != null ? 1 : 0) +
        (entry.match.ip_next_hop_id != null ? 1 : 0) +
        (entry.match.ip_prefix_list_id != null ? 1 : 0) +
        (entry.match.as_path_id != null ? 1 : 0)
      ) > 1 : false
    ]) > 0
  }
}

# Set Actions Analysis - Fixed null handling
output "set_actions_analysis" {
  description = "Analysis of set actions used in route map entries"
  value = {
    total_entries_with_set = length([for entry in var.route_map_entries : entry if entry.set != null])
    
    set_types_used = {
      metric_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.metric != null ? true : false) : false
      ])
      type_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.type != null ? true : false) : false
      ])
      community_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.community != null || entry.set.additive_community != null ? true : false) : false
      ])
      tag_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.tag != null ? true : false) : false
      ])
      next_hop_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.ip_next_hop != null || entry.set.ip_v6_next_hop != null ? true : false) : false
      ])
      weight_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.weight != null ? true : false) : false
      ])
      local_preference_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.local_preference != null ? true : false) : false
      ])
      as_path_prepend_sets = length([
        for entry in var.route_map_entries : entry 
        if entry.set != null ? (entry.set.as_path_prepend != null ? true : false) : false
      ])
    }
    
    has_complex_setting = length([
      for entry in var.route_map_entries : entry 
      if entry.set != null ? (
        (entry.set.metric != null ? 1 : 0) +
        (entry.set.type != null ? 1 : 0) +
        (entry.set.community != null ? 1 : 0) +
        (entry.set.additive_community != null ? 1 : 0) +
        (entry.set.tag != null ? 1 : 0) +
        (entry.set.ip_next_hop != null ? 1 : 0) +
        (entry.set.ip_v6_next_hop != null ? 1 : 0) +
        (entry.set.weight != null ? 1 : 0) +
        (entry.set.local_preference != null ? 1 : 0) +
        (entry.set.as_path_prepend != null ? 1 : 0)
      ) > 1 : false
    ]) > 0
  }
}
