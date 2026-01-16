resource "prismasdwan_performance_policy_rule" "rule_main" {
  # Parent policy set ID (required for nested resource)
  #perfmgmtpolicyset_id = var.perfmgmtpolicyset_id
  
  # Required fields
  name = var.rule_name
  type = var.rule_type
  
  # Actions configuration (required array)
  actions = var.actions
  
  # Optional fields
  enabled             = var.enabled
  description         = var.description
  tags                = var.tags
  thresholdprofile_id = var.thresholdprofile_id
  
  # Optional filters
  network_context_ids = var.network_context_ids
  service_label_ids   = var.service_label_ids
  path_filters        = var.path_filters
  
  # Optional app filters
  #dynamic "app_filters" {
    for_each = var.app_filters != null ? [var.app_filters] : []
    #content {
      #app_transfer_types = app_filters.value.app_transfer_types
      #application_ids    = app_filters.value.application_ids
    }
  #}
#}