# Deployment Status Output
output "deployment_status" {
  description = "Status of the performance policy set deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "performance_policy_set"
    status         = "success"
  }
}

# Performance Policy Set ID
output "performance_policy_set_id" {
  description = "The ID of the created performance policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.id
}

# Performance Policy Set Name
output "performance_policy_set_name" {
  description = "The name of the created performance policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.name
}

# Performance Policy Set Description
output "performance_policy_set_description" {
  description = "The description of the performance policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.description
}

# Default Rule Policy Set Status
output "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.defaultrule_policyset
}

# Send to Element Status
output "send_to_element" {
  description = "Whether policy set is sent to element"
  value       = prismasdwan_performance_policy_set.policy_set_main.send_to_element
}

# Clone From Information
output "clone_from" {
  description = "The policy set ID this was cloned from"
  value       = prismasdwan_performance_policy_set.policy_set_main.clone_from
}

# Link Health Rules
output "link_health_rules" {
  description = "The link health rules configured in the policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.link_health_rules
}

# Policy Rules
output "policy_rules" {
  description = "The policy rules configured in the policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.policy_rules
}

# Link Health Rules Count
output "link_health_rules_count" {
  description = "Number of link health rules in the policy set"
  value       = length(prismasdwan_performance_policy_set.policy_set_main.link_health_rules)
}

# Policy Rules Count
output "policy_rules_count" {
  description = "Number of policy rules in the policy set"
  value       = length(prismasdwan_performance_policy_set.policy_set_main.policy_rules)
}

# Schema and Etag (computed fields) - FIXED: x_schema and x_etag
output "performance_policy_set_schema" {
  description = "Schema version for the performance policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.x_schema
}

output "performance_policy_set_etag" {
  description = "Etag for the performance policy set"
  value       = prismasdwan_performance_policy_set.policy_set_main.x_etag
}

# Complete Performance Policy Set Details
output "performance_policy_set_details" {
  description = "Complete details of the created performance policy set"
  value = {
    id                    = prismasdwan_performance_policy_set.policy_set_main.id
    name                  = prismasdwan_performance_policy_set.policy_set_main.name
    description           = prismasdwan_performance_policy_set.policy_set_main.description
    tags                  = prismasdwan_performance_policy_set.policy_set_main.tags
    defaultrule_policyset = prismasdwan_performance_policy_set.policy_set_main.defaultrule_policyset
    send_to_element       = prismasdwan_performance_policy_set.policy_set_main.send_to_element
    clone_from            = prismasdwan_performance_policy_set.policy_set_main.clone_from
    link_health_rules     = prismasdwan_performance_policy_set.policy_set_main.link_health_rules
    policy_rules          = prismasdwan_performance_policy_set.policy_set_main.policy_rules
    x_etag                = prismasdwan_performance_policy_set.policy_set_main.x_etag
    x_schema              = prismasdwan_performance_policy_set.policy_set_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "performance_policy_set"
}

# Link Health Rules by Type
output "app_circuit_health_rules" {
  description = "Link health rules of type APP_CIRCUIT_HEALTH"
  value = [
    for rule in prismasdwan_performance_policy_set.policy_set_main.link_health_rules :
    rule if rule.type == "APP_CIRCUIT_HEALTH"
  ]
}

output "system_site_health_rules" {
  description = "Link health rules of type SYSTEM_SITE_HEALTH"
  value = [
    for rule in prismasdwan_performance_policy_set.policy_set_main.link_health_rules :
    rule if rule.type == "SYSTEM_SITE_HEALTH"
  ]
}

# Enabled vs Disabled Rules Count
output "enabled_link_health_rules_count" {
  description = "Number of enabled link health rules"
  value = length([
    for rule in prismasdwan_performance_policy_set.policy_set_main.link_health_rules :
    rule if rule.enabled == true
  ])
}

output "disabled_link_health_rules_count" {
  description = "Number of disabled link health rules"
  value = length([
    for rule in prismasdwan_performance_policy_set.policy_set_main.link_health_rules :
    rule if rule.enabled == false
  ])
}

# Actions Summary
output "total_actions_count" {
  description = "Total number of actions across all link health rules"
  value = sum([
    for rule in prismasdwan_performance_policy_set.policy_set_main.link_health_rules :
    length(rule.actions)
  ])
}

# Active Policy Rules Count
output "active_policy_rules_count" {
  description = "Number of active (not disabled and not inactive) policy rules"
  value = length([
    for rule in prismasdwan_performance_policy_set.policy_set_main.policy_rules :
    rule if rule.disabled == false && rule.inactive == false
  ])
}
