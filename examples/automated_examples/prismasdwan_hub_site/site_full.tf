# Resource locators for policy set stacks (optional)
resource "prismasdwan_resource_locator" "security_policysetstack" {
  count = var.security_policysetstack_name != null ? 1 : 0
  
  resource_type = "prismasdwan_security_policy_stack"
  resource_property = "name"
  resource_property_value = var.security_policysetstack_name
}

resource "prismasdwan_resource_locator" "security_policyset" {
  count = var.security_policyset_name != null ? 1 : 0
  
  resource_type = "prismasdwan_security_policy_set"
  resource_property = "name"
  resource_property_value = var.security_policyset_name
}

resource "prismasdwan_resource_locator" "network_policysetstack" {
  count = var.network_policysetstack_name != null ? 1 : 0
  
  resource_type = "prismasdwan_path_policy_stack"
  resource_property = "name"
  resource_property_value = var.network_policysetstack_name
}

resource "prismasdwan_resource_locator" "nat_policysetstack" {
  count = var.nat_policysetstack_name != null ? 1 : 0
  
  resource_type = "prismasdwan_nat_policy_set_stack"
  resource_property = "name"
  resource_property_value = var.nat_policysetstack_name
}

resource "prismasdwan_resource_locator" "priority_policysetstack" {
  count = var.priority_policysetstack_name != null ? 1 : 0
  
  resource_type = "prismasdwan_qos_policy_stack"
  resource_property = "name"
  resource_property_value = var.priority_policysetstack_name
}

resource "prismasdwan_resource_locator" "perfmgmt_policysetstack" {
  count = var.perfmgmt_policysetstack_name != null ? 1 : 0
  
  resource_type = "prismasdwan_performance_policy_stack"
  resource_property = "name"
  resource_property_value = var.perfmgmt_policysetstack_name
}

resource "prismasdwan_resource_locator" "policy_set" {
  count = var.policy_set_name != null ? 1 : 0
  
  resource_type = "prismasdwan_policy_set"
  resource_property = "name"
  resource_property_value = var.policy_set_name
}

# Resource locators for VRF and service configurations (optional)
resource "prismasdwan_resource_locator" "vrf_context_profile" {
  count = var.vrf_context_profile_name != null ? 1 : 0
  
  resource_type = "prismasdwan_vrf_context_profile"
  resource_property = "name"
  resource_property_value = var.vrf_context_profile_name
}

resource "prismasdwan_resource_locator" "multicast_peer_group" {
  count = var.multicast_peer_group_name != null ? 1 : 0
  
  resource_type = "prismasdwan_multicast_peer_group"
  resource_property = "name"
  resource_property_value = var.multicast_peer_group_name
}

resource "prismasdwan_resource_locator" "service_binding" {
  count = var.service_binding_name != null ? 1 : 0
  
  resource_type = "prismasdwan_domain"
  resource_property = "name"
  resource_property_value = var.service_binding_name
}



resource "prismasdwan_site" "site_full" {
  # Required fields
  name = var.site_name
  element_cluster_role = var.element_cluster_role
  admin_state = var.admin_state
  
  # Optional basic fields
  description = var.description
  tags = var.tags
  
  # Extended tags (conditional)
  extended_tags = length(var.extended_tags) > 0 ? [
    for etag in var.extended_tags : {
      key = etag.key
      value = etag.value
      value_type = etag.value_type
    }
  ] : null
  
  # Site configuration flags
  app_acceleration_enabled = var.app_acceleration_enabled
  prefer_lan_default_over_wan_default_route = var.prefer_lan_default_over_wan_default_route
  branch_gateway = var.branch_gateway
  
  # Policy set stack assignments (conditional)
  security_policysetstack_id = length(prismasdwan_resource_locator.security_policysetstack) > 0 ? prismasdwan_resource_locator.security_policysetstack[0].result : null
  security_policyset_id = length(prismasdwan_resource_locator.security_policyset) > 0 ? prismasdwan_resource_locator.security_policyset[0].result : null
  network_policysetstack_id = length(prismasdwan_resource_locator.network_policysetstack) > 0 ? prismasdwan_resource_locator.network_policysetstack[0].result : null
  nat_policysetstack_id = length(prismasdwan_resource_locator.nat_policysetstack) > 0 ? prismasdwan_resource_locator.nat_policysetstack[0].result : null
  priority_policysetstack_id = length(prismasdwan_resource_locator.priority_policysetstack) > 0 ? prismasdwan_resource_locator.priority_policysetstack[0].result : null
  perfmgmt_policysetstack_id = length(prismasdwan_resource_locator.perfmgmt_policysetstack) > 0 ? prismasdwan_resource_locator.perfmgmt_policysetstack[0].result : null
  policy_set_id = length(prismasdwan_resource_locator.policy_set) > 0 ? prismasdwan_resource_locator.policy_set[0].result : null
  
  # Service configurations (conditional) - Note: correct field name is service_binding (not service_binding_id)
  vrf_context_profile_id = length(prismasdwan_resource_locator.vrf_context_profile) > 0 ? prismasdwan_resource_locator.vrf_context_profile[0].result : null
  multicast_peer_group_id = length(prismasdwan_resource_locator.multicast_peer_group) > 0 ? prismasdwan_resource_locator.multicast_peer_group[0].result : null
  service_binding = length(prismasdwan_resource_locator.service_binding) > 0 ? prismasdwan_resource_locator.service_binding[0].result : null
  
  # SGI configuration (conditional object assignment)
  sgi_config = var.sgi_config != null ? {
    sgi_vendor_id = var.sgi_config.sgi_vendor_id
    sgi_tag = var.sgi_config.sgi_tag
  } : null
  
  # Location configuration (conditional object assignment)
  location = var.location != null ? {
    description = var.location.description
    latitude = var.location.latitude
    longitude = var.location.longitude
  } : null
  
  # Address configuration (conditional object assignment)
  address = var.address != null ? {
    street = var.address.street
    street2 = var.address.street2
    city = var.address.city
    state = var.address.state
    post_code = var.address.post_code
    country = var.address.country
  } : null
}
