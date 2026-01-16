# Resource locator for NAT policy set (required for NAT policy rule)
resource "prismasdwan_resource_locator" "nat_policy_set" {
  resource_type = "prismasdwan_nat_policy_set"
  resource_property = "name"
  resource_property_value = var.nat_policy_set_name
}
# Resource locators for source zone (conditional)
resource "prismasdwan_resource_locator" "source_zone" {
  count = var.source_zone_name != null ? 1 : 0
  
  resource_type = "prismasdwan_nat_zone"
  resource_property = "name"
  resource_property_value = var.source_zone_name
}

# Resource locators for destination zone (conditional)
resource "prismasdwan_resource_locator" "destination_zone" {
  count = var.destination_zone_name != null ? 1 : 0
  
  resource_type = "prismasdwan_nat_zone"
  resource_property = "name"
  resource_property_value = var.destination_zone_name
}
# Resource locator for source prefixes (optional)
resource "prismasdwan_resource_locator" "source_prefixes" {
  count = var.source_prefixes_name != null ? 1 : 0
  
  resource_type = "prismasdwan_nat_global_prefix"
  resource_property = "name"
  resource_property_value = var.source_prefixes_name
}

# Resource locator for destination prefixes (optional)
resource "prismasdwan_resource_locator" "destination_prefixes" {
  count = var.destination_prefixes_name != null ? 1 : 0
  
  resource_type = "prismasdwan_nat_global_prefix"
  resource_property = "name"
  resource_property_value = var.destination_prefixes_name
}

# Resource locators for NAT pools (optional)
resource "prismasdwan_resource_locator" "nat_pools" {
  count = length(var.nat_pool_names)
  
  resource_type = "prismasdwan_nat_policy_pool"
  resource_property = "name"
  resource_property_value = var.nat_pool_names[count.index]
}

# Local variable to map NAT pool names to resolved IDs
locals {
  nat_pool_id_map = {
    for i, name in var.nat_pool_names : name => (
      length(prismasdwan_resource_locator.nat_pools) > i ? 
      prismasdwan_resource_locator.nat_pools[i].result : null
    )
  }
  
  # Process NAT actions and resolve pool names to IDs
  processed_actions = [
    for i, action in var.nat_actions : {
      type = action.type
      nat_pool_id = (
        action.nat_pool_id != null ? action.nat_pool_id : (
          length(var.nat_pool_names) > i ? lookup(local.nat_pool_id_map, var.nat_pool_names[i], null) : null
        )
      )
      port = action.port
      protocols = action.protocols
    }
  ]
}

resource "prismasdwan_nat_policy_rule" "nat_policy_rule_full" {
  # X-Parameters for API path (nat_policy_set_id required)
  x_parameters = {
    nat_policy_set_id = prismasdwan_resource_locator.nat_policy_set.result
  }
  
  # Required fields
  name = var.nat_policy_rule_name
  actions = [
    for action in local.processed_actions : {
      type = action.type
      nat_pool_id = action.nat_pool_id
      port = action.port
      protocols = action.protocols
    }
  ]
  
  # Optional fields
  description = var.description
  tags = var.tags
  enabled = var.enabled
  #disabled = var.disabled
  #disabled_reason = var.disabled_reason
  #inactive = var.inactive
  #inactive_reason = var.inactive_reason
  
  # Traffic Classification
  protocol = var.protocol
  source_ports = length(var.source_ports) > 0 ? [
    for port_range in var.source_ports : {
      from = port_range.from
      to = port_range.to
    }
  ] : null
  destination_ports = length(var.destination_ports) > 0 ? [
    for port_range in var.destination_ports : {
      from = port_range.from
      to = port_range.to
    }
  ] : null
  
  # Zone Configuration (conditional)
  source_zone_id = length(prismasdwan_resource_locator.source_zone) > 0 ? prismasdwan_resource_locator.source_zone[0].result : null
  destination_zone_id = length(prismasdwan_resource_locator.destination_zone) > 0 ? prismasdwan_resource_locator.destination_zone[0].result : null
  
  # Prefix Configuration
  source_prefixes_id = length(prismasdwan_resource_locator.source_prefixes) > 0 ? prismasdwan_resource_locator.source_prefixes[0].result : null
  destination_prefixes_id = length(prismasdwan_resource_locator.destination_prefixes) > 0 ? prismasdwan_resource_locator.destination_prefixes[0].result : null
}