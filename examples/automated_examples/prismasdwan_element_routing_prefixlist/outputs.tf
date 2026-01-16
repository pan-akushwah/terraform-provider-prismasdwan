# Routing Prefix List Details
output "prefixlist_details" {
  description = "Details of the created Routing Prefix List"
  value = {
    id             = prismasdwan_element_routing_prefixlist.prefixlist_full.id
    name           = prismasdwan_element_routing_prefixlist.prefixlist_full.name
    description    = prismasdwan_element_routing_prefixlist.prefixlist_full.description
    tags           = prismasdwan_element_routing_prefixlist.prefixlist_full.tags
    auto_generated = prismasdwan_element_routing_prefixlist.prefixlist_full.auto_generated
    prefix_filter_list = prismasdwan_element_routing_prefixlist.prefixlist_full.prefix_filter_list
    tfid           = prismasdwan_element_routing_prefixlist.prefixlist_full.tfid
    x_etag         = prismasdwan_element_routing_prefixlist.prefixlist_full.x_etag
    x_schema       = prismasdwan_element_routing_prefixlist.prefixlist_full.x_schema
  }
}

# Individual outputs for easy access
output "prefixlist_id" {
  description = "ID of the created Routing Prefix List"
  value       = prismasdwan_element_routing_prefixlist.prefixlist_full.id
}

output "prefixlist_name" {
  description = "Name of the created Routing Prefix List"
  value       = prismasdwan_element_routing_prefixlist.prefixlist_full.name
}

output "prefixlist_tfid" {
  description = "Terraform ID of the Routing Prefix List"
  value       = prismasdwan_element_routing_prefixlist.prefixlist_full.tfid
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

# Prefix Filter Analysis
output "prefix_filter_analysis" {
  description = "Analysis of prefix filter configuration"
  value = {
    total_filters = length(var.prefix_filter_list)
    permit_filters = length([
      for filter in var.prefix_filter_list : filter if filter.permit == true
    ])
    deny_filters = length([
      for filter in var.prefix_filter_list : filter if filter.permit == false
    ])
    
    ipv4_filters = length([
      for filter in var.prefix_filter_list : filter 
      if filter.prefix != null && filter.prefix != ""
    ])
    ipv6_filters = length([
      for filter in var.prefix_filter_list : filter 
      if filter.ipv6_prefix != null && filter.ipv6_prefix != ""
    ])
    
    filters_with_ge = length([
      for filter in var.prefix_filter_list : filter 
      if filter.ge != null
    ])
    filters_with_le = length([
      for filter in var.prefix_filter_list : filter 
      if filter.le != null
    ])
    filters_with_range = length([
      for filter in var.prefix_filter_list : filter 
      if filter.ge != null && filter.le != null
    ])
    
    has_filters = length(var.prefix_filter_list) > 0
    
    configuration_type = length(var.prefix_filter_list) == 0 ? "empty" : (
      length([for filter in var.prefix_filter_list : filter if filter.permit == false]) > 0 ? "filtering" : "allowing"
    )
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of Routing Prefix List configuration"
  value = {
    prefixlist_info = {
      name = var.prefixlist_name
      description = var.description
      auto_generated = var.auto_generated
      tag_count = length(var.tags)
    }
    
    filter_summary = {
      total_filters = length(var.prefix_filter_list)
      permit_filters = length([for filter in var.prefix_filter_list : filter if filter.permit == true])
      deny_filters = length([for filter in var.prefix_filter_list : filter if filter.permit == false])
      has_filters = length(var.prefix_filter_list) > 0
      ipv4_count = length([for filter in var.prefix_filter_list : filter if filter.prefix != null && filter.prefix != ""])
      ipv6_count = length([for filter in var.prefix_filter_list : filter if filter.ipv6_prefix != null && filter.ipv6_prefix != ""])
    }
    
    order_info = {
      orders_used = [for filter in var.prefix_filter_list : filter.order]
      filter_count = length(var.prefix_filter_list)
    }
    
    prefix_analysis = {
      exact_prefixes = length([
        for filter in var.prefix_filter_list : filter 
        if filter.ge == null && filter.le == null
      ])
      range_prefixes = length([
        for filter in var.prefix_filter_list : filter 
        if filter.ge != null || filter.le != null
      ])
      ge_only = length([
        for filter in var.prefix_filter_list : filter 
        if filter.ge != null && filter.le == null
      ])
      le_only = length([
        for filter in var.prefix_filter_list : filter 
        if filter.le != null && filter.ge == null
      ])
      ge_le_both = length([
        for filter in var.prefix_filter_list : filter 
        if filter.ge != null && filter.le != null
      ])
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Routing Prefix List deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "element_routing_prefixlist"
    resource_count = 1
    
    configuration_summary = {
      site_name = var.site_name
      element_name = var.element_name
      prefixlist_name = var.prefixlist_name
      total_filters = length(var.prefix_filter_list)
      permit_filters = length([for filter in var.prefix_filter_list : filter if filter.permit == true])
      deny_filters = length([for filter in var.prefix_filter_list : filter if filter.permit == false])
      auto_generated = var.auto_generated
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of all created resources"
  value = {
    primary_resource = {
      type = "prismasdwan_element_routing_prefixlist"
      id = prismasdwan_element_routing_prefixlist.prefixlist_full.id
      name = var.prefixlist_name
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
      filters_configured = length(var.prefix_filter_list) > 0
      has_documentation = var.description != ""
      is_tagged = length(var.tags) > 0
      ipv4_and_ipv6_support = (
        length([for filter in var.prefix_filter_list : filter if filter.prefix != null]) > 0 &&
        length([for filter in var.prefix_filter_list : filter if filter.ipv6_prefix != null]) > 0
      )
    }
  }
}

# Filter Details
output "filter_details" {
  description = "Detailed information about each prefix filter"
  value = {
    filters = [
      for i, filter in var.prefix_filter_list : {
        index = i
        order = filter.order
        prefix = filter.prefix
        ipv6_prefix = filter.ipv6_prefix
        action = filter.permit ? "permit" : "deny"
        ge = filter.ge
        le = filter.le
        prefix_type = filter.prefix != null ? "ipv4" : "ipv6"
        has_range = filter.ge != null || filter.le != null
        range_type = (
          filter.ge != null && filter.le != null ? "ge_and_le" :
          filter.ge != null ? "ge_only" :
          filter.le != null ? "le_only" :
          "exact"
        )
      }
    ]
    filter_statistics = {
      total_count = length(var.prefix_filter_list)
      permit_count = length([for filter in var.prefix_filter_list : filter if filter.permit])
      deny_count = length([for filter in var.prefix_filter_list : filter if !filter.permit])
      ipv4_count = length([for filter in var.prefix_filter_list : filter if filter.prefix != null && filter.prefix != ""])
      ipv6_count = length([for filter in var.prefix_filter_list : filter if filter.ipv6_prefix != null && filter.ipv6_prefix != ""])
    }
  }
}