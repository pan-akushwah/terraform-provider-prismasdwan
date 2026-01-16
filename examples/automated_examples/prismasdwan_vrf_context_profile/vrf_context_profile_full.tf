# Resource locators for VRF contexts
resource "prismasdwan_resource_locator" "vrf_contexts" {
  count = length(var.vrf_context_names)
  
  resource_type = "prismasdwan_vrf_context"
  resource_property = "name"
  resource_property_value = var.vrf_context_names[count.index]
}

resource "prismasdwan_vrf_context_profile" "vrf_context_profile_full" {
  name                        = var.vrf_context_profile_name
  description                 = var.description
  tags                        = var.tags
  default_vrf_context_profile = var.default_vrf_context_profile
  vrf_context_ids             = [for locator in prismasdwan_resource_locator.vrf_contexts : locator.result]
  vrf_context_route_leak_rules = []
}