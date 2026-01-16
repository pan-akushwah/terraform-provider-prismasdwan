# Basic Static Route Information
output "static_route_id" {
  description = "The ID of the static route"
  value       = prismasdwan_element_static_route.element_static_route_full.id
}

output "site_id" {
  description = "The site ID where the static route is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "element_id" {
  description = "The element ID where the static route is configured"
  value       = prismasdwan_resource_locator.element.result
}

# Detailed Static Route Information
output "static_route_details" {
  description = "Detailed information about the static route"
  value = {
    id                          = prismasdwan_element_static_route.element_static_route_full.id
    site_id                     = prismasdwan_resource_locator.site.result
    element_id                  = prismasdwan_resource_locator.element.result
    name                        = prismasdwan_element_static_route.element_static_route_full.name
    description                 = prismasdwan_element_static_route.element_static_route_full.description
    tags                        = prismasdwan_element_static_route.element_static_route_full.tags
    address_family              = prismasdwan_element_static_route.element_static_route_full.address_family
    scope                       = prismasdwan_element_static_route.element_static_route_full.scope
    destination_prefix          = prismasdwan_element_static_route.element_static_route_full.destination_prefix
    nexthops                    = prismasdwan_element_static_route.element_static_route_full.nexthops
    vrf_context_id              = prismasdwan_element_static_route.element_static_route_full.vrf_context_id
    network_context_id          = prismasdwan_element_static_route.element_static_route_full.network_context_id
    nexthop_reachability_probe  = prismasdwan_element_static_route.element_static_route_full.nexthop_reachability_probe
    x_etag                      = prismasdwan_element_static_route.element_static_route_full.x_etag
    x_schema                    = prismasdwan_element_static_route.element_static_route_full.x_schema
    created_at                  = timestamp()
  }
}

# Nexthop Configuration Details
output "nexthop_configuration" {
  description = "Details about the nexthop configuration"
  value = {
    nexthops = prismasdwan_element_static_route.element_static_route_full.nexthops
    nexthop_count = length(prismasdwan_element_static_route.element_static_route_full.nexthops)
    has_ip_nexthops = length([for nh in prismasdwan_element_static_route.element_static_route_full.nexthops : nh if nh.nexthop_ip != null]) > 0
    has_interface_nexthops = length([for nh in prismasdwan_element_static_route.element_static_route_full.nexthops : nh if nh.nexthop_interface_id != null]) > 0
    has_self_nexthops = length([for nh in prismasdwan_element_static_route.element_static_route_full.nexthops : nh if nh.self == true]) > 0
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved = prismasdwan_resource_locator.site.result
    element_resolved = prismasdwan_resource_locator.element.result
    vrf_context_resolved = var.vrf_context_name != null ? prismasdwan_resource_locator.vrf_context[0].result : null
    network_context_resolved = var.network_context_name != null ? prismasdwan_resource_locator.network_context[0].result : null
    nexthop_interfaces_resolved = length(var.nexthop_interface_names) > 0 ? [for locator in prismasdwan_resource_locator.nexthop_interfaces : locator.result] : null
  }
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of static route configuration"
  value = {
    site_name             = var.site_name
    element_name          = var.element_name
    static_route_name     = prismasdwan_element_static_route.element_static_route_full.name
    destination_prefix    = prismasdwan_element_static_route.element_static_route_full.destination_prefix
    address_family        = prismasdwan_element_static_route.element_static_route_full.address_family
    scope                 = prismasdwan_element_static_route.element_static_route_full.scope
    nexthop_count         = length(prismasdwan_element_static_route.element_static_route_full.nexthops)
    has_description       = prismasdwan_element_static_route.element_static_route_full.description != null
    has_tags              = prismasdwan_element_static_route.element_static_route_full.tags != null
    reachability_probe    = prismasdwan_element_static_route.element_static_route_full.nexthop_reachability_probe
    resource_type         = "element_static_route"
    api_version           = "v2.3"
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the static route deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_static_route"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    element_resolved = prismasdwan_resource_locator.element.result != null
    api_version      = "v2.3"
    api_model        = "StaticRouteV2N3"
  }
}

# Schema and Etag (computed fields)
output "static_route_schema" {
  description = "Schema version for the static route"
  value       = prismasdwan_element_static_route.element_static_route_full.x_schema
}

output "static_route_etag" {
  description = "Etag for the static route"
  value       = prismasdwan_element_static_route.element_static_route_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_static_route"
}

# Input Variables Echo (for verification)
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name                = var.site_name
    element_name             = var.element_name
    address_family           = var.address_family
    scope                    = var.scope
    destination_prefix       = var.destination_prefix
    static_route_name        = var.static_route_name
    description              = var.description
    tags                     = var.tags
    vrf_context_name         = var.vrf_context_name
    network_context_name     = var.network_context_name
    nexthop_reachability_probe = var.nexthop_reachability_probe
    nexthops_count           = length(var.nexthops)
  }
}