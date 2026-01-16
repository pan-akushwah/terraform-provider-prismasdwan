# Resource locators for policy sets in the stack
resource "prismasdwan_resource_locator" "policy_sets" {
  count = length(var.policyset_names)
  
  resource_type = "prismasdwan_nat_policy_set"
  resource_property = "name"
  resource_property_value = var.policyset_names[count.index]
}

resource "prismasdwan_nat_policy_set_stack" "nat_policy_set_stack_main" {
  # Required fields
  name = var.nat_policy_set_stack_name
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # Policy set IDs (resolved from names via resource locator)
  policyset_ids = [for locator in prismasdwan_resource_locator.policy_sets : locator.result]
  
  # Stack properties
  default_policysetstack = var.default_policysetstack
}