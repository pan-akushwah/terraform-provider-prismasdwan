# Resource locator to get the policy set ID
resource "prismasdwan_resource_locator" "policy_set" {
  resource_type = "prismasdwan_path_policy_set"
  resource_property = "name"
  resource_property_value = var.policy_set_name
}

resource "prismasdwan_path_policy_rule" "policy_rule_main" {
  # Required fields
  name = var.rule_name
  paths_allowed = var.paths_allowed
  
  # Optional fields
  description             = var.description
  tags                   = var.tags
  network_context_id     = var.network_context_id
  source_prefixes_id     = var.source_prefixes_id
  destination_prefixes_id = var.destination_prefixes_id
  app_def_ids            = var.app_def_ids
  service_context        = var.service_context
  order_number           = var.order_number
  enabled                = var.enabled
  user_or_group          = var.user_or_group
  src_device_ids         = var.src_device_ids
  dest_device_ids        = var.dest_device_ids
  best_path_config       = var.best_path_config
  
  # x_parameters for policy set ID
  x_parameters = {
    policy_set_id = prismasdwan_resource_locator.policy_set.result
  }
}