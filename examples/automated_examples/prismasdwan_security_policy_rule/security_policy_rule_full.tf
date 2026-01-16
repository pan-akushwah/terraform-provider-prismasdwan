# Resource locator for security policy set (required for x_parameters)
resource "prismasdwan_resource_locator" "policy_set" {
  resource_type = "prismasdwan_security_policy_set"
  resource_property = "name"
  resource_property_value = var.policy_set_name
}

resource "prismasdwan_security_policy_rule" "security_policy_rule_main" {
  # Required fields
  name    = var.rule_name
  action  = var.action
  enabled = var.enabled
  
  # Optional fields
  description                = var.description
  tags                      = var.tags
  source_zone_ids           = var.source_zone_ids
  source_prefix_ids         = var.source_prefix_ids
  destination_zone_ids      = var.destination_zone_ids
  destination_prefix_ids    = var.destination_prefix_ids
  app_def_ids              = var.app_def_ids
  services                 = var.services
  user_or_group            = var.user_or_group
  src_device_ids           = var.src_device_ids
  dest_device_ids          = var.dest_device_ids
  # Removed: security_profile_group_id (not supported)
  
  # x_parameters for policy set ID
  x_parameters = {
    policy_set_id = prismasdwan_resource_locator.policy_set.result
  }
}