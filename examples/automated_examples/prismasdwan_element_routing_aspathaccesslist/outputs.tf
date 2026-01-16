# AS Path Access List Details
output "aspathaccesslist_details" {
  description = "Details of the created AS Path Access List"
  value = {
    id             = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.id
    name           = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.name
    description    = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.description
    tags           = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.tags
    auto_generated = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.auto_generated
    as_path_regex_list = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.as_path_regex_list
    tfid           = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.tfid
    x_etag         = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.x_etag
    x_schema       = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.x_schema
  }
}

# Individual outputs for easy access
output "aspathaccesslist_id" {
  description = "ID of the created AS Path Access List"
  value       = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.id
}

output "aspathaccesslist_name" {
  description = "Name of the created AS Path Access List"
  value       = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.name
}

output "aspathaccesslist_tfid" {
  description = "Terraform ID of the AS Path Access List"
  value       = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.tfid
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

# AS Path Regex Analysis
output "aspath_regex_analysis" {
  description = "Analysis of AS path regex rules configuration"
  value = {
    total_rules = length(var.as_path_regex_list)
    permit_rules = length([
      for rule in var.as_path_regex_list : rule if rule.permit == true
    ])
    deny_rules = length([
      for rule in var.as_path_regex_list : rule if rule.permit == false
    ])
    
    has_rules = length(var.as_path_regex_list) > 0
    
    rule_patterns = {
      exact_match_patterns = length([
        for rule in var.as_path_regex_list : rule 
        if can(regex("^\\^[0-9\\s]+\\$", rule.as_path_regex))
      ])
      wildcard_patterns = length([
        for rule in var.as_path_regex_list : rule 
        if can(regex(".*[\\*\\+\\?\\.\\[\\]].*", rule.as_path_regex))
      ])
      anywhere_patterns = length([
        for rule in var.as_path_regex_list : rule 
        if can(regex("^_.*_$", rule.as_path_regex))
      ])
    }
    
    configuration_type = length(var.as_path_regex_list) == 0 ? "empty" : (
      length([for rule in var.as_path_regex_list : rule if rule.permit == false]) > 0 ? "filtering" : "allowing"
    )
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of AS Path Access List configuration"
  value = {
    acl_info = {
      name = var.aspathacl_name
      description = var.description
      auto_generated = var.auto_generated
      tag_count = length(var.tags)
    }
    
    rule_summary = {
      total_rules = length(var.as_path_regex_list)
      permit_rules = length([for rule in var.as_path_regex_list : rule if rule.permit == true])
      deny_rules = length([for rule in var.as_path_regex_list : rule if rule.permit == false])
      has_rules = length(var.as_path_regex_list) > 0
    }
    
    pattern_analysis = {
      private_as_rules = length([
        for rule in var.as_path_regex_list : rule 
        if can(regex(".*6[45][0-9][0-9][0-9].*", rule.as_path_regex))
      ])
      exact_match_rules = length([
        for rule in var.as_path_regex_list : rule 
        if can(regex("^\\^[0-9]+\\$", rule.as_path_regex))
      ])
      wildcard_rules = length([
        for rule in var.as_path_regex_list : rule 
        if can(regex(".*[\\*\\+\\?].*", rule.as_path_regex))
      ])
    }
    
    order_info = {
      orders_used = [for rule in var.as_path_regex_list : rule.order]
      rule_count = length(var.as_path_regex_list)
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "AS Path Access List deployment status and metadata"
  value = {
    status = "success"
    deployed_at = timestamp()
    resource_type = "element_routing_aspathaccesslist"
    resource_count = 1
    
    configuration_summary = {
      site_name = var.site_name
      element_name = var.element_name
      acl_name = var.aspathacl_name
      total_rules = length(var.as_path_regex_list)
      permit_rules = length([for rule in var.as_path_regex_list : rule if rule.permit == true])
      deny_rules = length([for rule in var.as_path_regex_list : rule if rule.permit == false])
      auto_generated = var.auto_generated
    }
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of all created resources"
  value = {
    primary_resource = {
      type = "prismasdwan_element_routing_aspathaccesslist"
      id = prismasdwan_element_routing_aspathaccesslist.aspathaccesslist_full.id
      name = var.aspathacl_name
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
      rules_configured = length(var.as_path_regex_list) > 0
      has_documentation = var.description != ""
      is_tagged = length(var.tags) > 0
    }
  }
}

# Rule Details
output "rule_details" {
  description = "Detailed information about each AS path regex rule"
  value = {
    rules = [
      for i, rule in var.as_path_regex_list : {
        index = i
        order = rule.order
        pattern = rule.as_path_regex
        action = rule.permit ? "permit" : "deny"
        pattern_type = (
          can(regex("^\\^[0-9]+\\$", rule.as_path_regex)) ? "exact_as" :
          can(regex("^\\^[0-9\\s]+\\$", rule.as_path_regex)) ? "exact_path" :
          can(regex("^_.*_$", rule.as_path_regex)) ? "anywhere" :
          can(regex(".*[\\*\\+\\?].*", rule.as_path_regex)) ? "wildcard" :
          "custom"
        )
      }
    ]
    
    rule_statistics = {
      total_count = length(var.as_path_regex_list)
      permit_count = length([for rule in var.as_path_regex_list : rule if rule.permit])
      deny_count = length([for rule in var.as_path_regex_list : rule if !rule.permit])
    }
  }
}