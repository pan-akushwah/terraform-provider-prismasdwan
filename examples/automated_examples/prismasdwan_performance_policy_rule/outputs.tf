# Deployment Status Output
output "deployment_status" {
  description = "Status of the performance policy rule deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "performance_policy_rule"
    status         = "success"
  }
}

# Performance Policy Rule ID
output "performance_policy_rule_id" {
  description = "The ID of the created performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main.id
}

# Performance Policy Rule Name
output "performance_policy_rule_name" {
  description = "The name of the created performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main.name
}

# Performance Policy Rule Type
output "performance_policy_rule_type" {
  description = "The type of the performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main.type
}

# Performance Policy Rule Enabled Status
output "performance_policy_rule_enabled" {
  description = "Whether the performance policy rule is enabled"
  value       = prismasdwan_performance_policy_rule.rule_main.enabled
}

# Actions Configuration
output "performance_policy_rule_actions" {
  description = "The actions configuration of the performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main.actions
}

# Parent Policy Set ID
output "parent_perfmgmtpolicyset_id" {
  description = "The parent performance management policy set ID"
  value       = prismasdwan_performance_policy_rule.rule_main.perfmgmtpolicyset_id
}

# Path Filters
output "performance_policy_rule_path_filters" {
  description = "The path filters of the performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main.path_filters
}

# App Filters
output "performance_policy_rule_app_filters" {
  description = "The application filters of the performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main.app_filters
}

# Service Label IDs
output "performance_policy_rule_service_labels" {
  description = "The service label IDs associated with the rule"
  value       = prismasdwan_performance_policy_rule.rule_main.service_label_ids
}

# Network Context IDs
output "performance_policy_rule_network_contexts" {
  description = "The network context IDs associated with the rule"
  value       = prismasdwan_performance_policy_rule.rule_main.network_context_ids
}

# Threshold Profile ID
output "performance_policy_rule_threshold_profile" {
  description = "The threshold profile ID associated with the rule"
  value       = prismasdwan_performance_policy_rule.rule_main.thresholdprofile_id
}

# Schema and Etag (computed fields)
output "performance_policy_rule_schema" {
  description = "Schema version for the performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main._schema
}

output "performance_policy_rule_etag" {
  description = "Etag for the performance policy rule"
  value       = prismasdwan_performance_policy_rule.rule_main._etag
}

# Complete Performance Policy Rule Details
output "performance_policy_rule_details" {
  description = "Complete details of the created performance policy rule"
  value = {
    id                     = prismasdwan_performance_policy_rule.rule_main.id
    name                   = prismasdwan_performance_policy_rule.rule_main.name
    type                   = prismasdwan_performance_policy_rule.rule_main.type
    enabled                = prismasdwan_performance_policy_rule.rule_main.enabled
    description            = prismasdwan_performance_policy_rule.rule_main.description
    tags                   = prismasdwan_performance_policy_rule.rule_main.tags
    perfmgmtpolicyset_id   = prismasdwan_performance_policy_rule.rule_main.perfmgmtpolicyset_id
    actions                = prismasdwan_performance_policy_rule.rule_main.actions
    path_filters           = prismasdwan_performance_policy_rule.rule_main.path_filters
    app_filters            = prismasdwan_performance_policy_rule.rule_main.app_filters
    service_label_ids      = prismasdwan_performance_policy_rule.rule_main.service_label_ids
    network_context_ids    = prismasdwan_performance_policy_rule.rule_main.network_context_ids
    thresholdprofile_id    = prismasdwan_performance_policy_rule.rule_main.thresholdprofile_id
    _etag                  = prismasdwan_performance_policy_rule.rule_main._etag
    _schema                = prismasdwan_performance_policy_rule.rule_main._schema
  }
}

# Rule Type Output
output "rule_type" {
  description = "The type of performance policy rule"
  value       = "performance_policy_rule"
}

# Actions Count
output "actions_count" {
  description = "Number of actions configured in the rule"
  value       = length(prismasdwan_performance_policy_rule.rule_main.actions)
}

# Path Filters Count
output "path_filters_count" {
  description = "Number of path filters configured"
  value       = length(prismasdwan_performance_policy_rule.rule_main.path_filters)
}

# Service Labels Count
output "service_labels_count" {
  description = "Number of service labels associated"
  value       = length(prismasdwan_performance_policy_rule.rule_main.service_label_ids)
}

# Network Contexts Count
output "network_contexts_count" {
  description = "Number of network contexts associated"
  value       = length(prismasdwan_performance_policy_rule.rule_main.network_context_ids)
}

# Application IDs Count (if app_filters exist)
output "application_ids_count" {
  description = "Number of application IDs in app filters"
  value = prismasdwan_performance_policy_rule.rule_main.app_filters != null && prismasdwan_performance_policy_rule.rule_main.app_filters.application_ids != null ? length(prismasdwan_performance_policy_rule.rule_main.app_filters.application_ids) : 0
}
