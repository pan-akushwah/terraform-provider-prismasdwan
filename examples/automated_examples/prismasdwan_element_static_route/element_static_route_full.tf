# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for element (required)
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
  
  # Set x_parameters for site-specific element lookup
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}

# Resource locators for VRF context (optional)
resource "prismasdwan_resource_locator" "vrf_context" {
  count = var.vrf_context_name != null ? 1 : 0
  
  resource_type = "prismasdwan_vrf_context"
  resource_property = "name"
  resource_property_value = var.vrf_context_name
}

# Resource locators for network context (optional)
resource "prismasdwan_resource_locator" "network_context" {
  count = var.network_context_name != null ? 1 : 0
  
  resource_type = "prismasdwan_network_context"
  resource_property = "name"
  resource_property_value = var.network_context_name
}

# Resource locators for nexthop interfaces (optional, for nexthops with interface names)
resource "prismasdwan_resource_locator" "nexthop_interfaces" {
  count = length(var.nexthop_interface_names)
  
  resource_type = "prismasdwan_element_interface"
  resource_property = "name"
  resource_property_value = var.nexthop_interface_names[count.index]
  
  # Set x_parameters for element-specific interface lookup
  x_parameters = {
    element_id = prismasdwan_resource_locator.element.result
    site_id = prismasdwan_resource_locator.site.result
  }
}

resource "prismasdwan_element_static_route" "element_static_route_full" {
  # Required fields
  address_family = var.address_family
  scope = var.scope
  destination_prefix = var.destination_prefix
  nexthops = [
    for i, nexthop in var.nexthops : {
      self = nexthop.self
      admin_distance = nexthop.admin_distance
      nexthop_ip = nexthop.nexthop_ip
      nexthop_interface_id = nexthop.nexthop_interface_name != null ? prismasdwan_resource_locator.nexthop_interfaces[index(var.nexthop_interface_names, nexthop.nexthop_interface_name)].result : nexthop.nexthop_interface_id
    }
  ]
  
  # Optional fields
  name = var.static_route_name
  description = var.description
  tags = var.tags
  vrf_context_id = var.vrf_context_name != null ? prismasdwan_resource_locator.vrf_context[0].result : var.vrf_context_id
  network_context_id = var.network_context_name != null ? prismasdwan_resource_locator.network_context[0].result : var.network_context_id
  nexthop_reachability_probe = var.nexthop_reachability_probe
  
  # Set x_parameters for site and element-specific static route
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}