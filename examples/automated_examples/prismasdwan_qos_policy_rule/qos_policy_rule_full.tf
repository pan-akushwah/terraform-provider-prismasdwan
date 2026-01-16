# Resource locator for policy set (required for QoS policy rule)
resource "prismasdwan_resource_locator" "policy_set" {
  resource_type = "prismasdwan_qos_policy_set"
  resource_property = "name"
  resource_property_value = var.policy_set_name
}

# Resource locators for application definitions (optional, based on app names provided)
resource "prismasdwan_resource_locator" "app_definitions" {
  count = length(var.app_def_names)
  
  resource_type = "prismasdwan_app_def"
  resource_property = "abbreviation"
  resource_property_value = var.app_def_names[count.index]
}

# Resource locator for source prefixes (optional)
resource "prismasdwan_resource_locator" "source_prefixes" {
  count = var.source_prefixes_name != null ? 1 : 0
  
  resource_type = "prismasdwan_qos_policy_global_prefix"
  resource_property = "name"
  resource_property_value = var.source_prefixes_name
}

# Resource locator for destination prefixes (optional)
resource "prismasdwan_resource_locator" "destination_prefixes" {
  count = var.destination_prefixes_name != null ? 1 : 0
  
  resource_type = "prismasdwan_qos_policy_global_prefix"
  resource_property = "name"
  resource_property_value = var.destination_prefixes_name
}

# Resource locator for network context (optional)
resource "prismasdwan_resource_locator" "network_context" {
  count = var.network_context_name != null ? 1 : 0
  
  resource_type = "prismasdwan_network_context"
  resource_property = "name"
  resource_property_value = var.network_context_name
}

# Resource locators for source devices (optional)
resource "prismasdwan_resource_locator" "src_devices" {
  count = length(var.src_device_names)
  
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.src_device_names[count.index]
}

# Resource locators for destination devices (optional)
resource "prismasdwan_resource_locator" "dest_devices" {
  count = length(var.dest_device_names)
  
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.dest_device_names[count.index]
}

resource "prismasdwan_qos_policy_rule" "qos_policy_rule_full" {
  # X-Parameters for API path (policy_set_id required)
  x_parameters = {
    policy_set_id = prismasdwan_resource_locator.policy_set.result
  }
  
  # Required fields
  name = var.qos_policy_rule_name
  priority_number = var.priority_number
  
  # Optional fields
  description = var.description
  tags = var.tags
  enabled = var.enabled
  order_number = var.order_number
  
  # Traffic Classification
  app_def_ids = [for locator in prismasdwan_resource_locator.app_definitions : locator.result]
  source_prefixes_id = length(prismasdwan_resource_locator.source_prefixes) > 0 ? prismasdwan_resource_locator.source_prefixes[0].result : null
  destination_prefixes_id = length(prismasdwan_resource_locator.destination_prefixes) > 0 ? prismasdwan_resource_locator.destination_prefixes[0].result : null
  network_context_id = length(prismasdwan_resource_locator.network_context) > 0 ? prismasdwan_resource_locator.network_context[0].result : null
  
  # Device Filtering
  src_device_ids = [for locator in prismasdwan_resource_locator.src_devices : locator.result]
  dest_device_ids = [for locator in prismasdwan_resource_locator.dest_devices : locator.result]
  
  # User/Group Filtering
  user_or_group = length(var.user_ids) > 0 || length(var.user_group_ids) > 0 ? {
    user_ids = var.user_ids
    user_group_ids = var.user_group_ids
  } : null
  
  # DSCP Configuration
  dscp = var.dscp_value != null ? {
    value = var.dscp_value
  } : null
}