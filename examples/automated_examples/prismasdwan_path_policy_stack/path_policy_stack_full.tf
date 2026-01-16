# Resource locator for default rule policy set (required)
resource "prismasdwan_resource_locator" "defaultrule_policyset" {
  resource_type = "prismasdwan_path_policy_set"
  resource_property = "name"
  resource_property_value = var.defaultrule_policyset_name
}

# Resource locators for policy sets in the stack (optional, based on policy set names provided)
resource "prismasdwan_resource_locator" "policy_sets" {
  count = length(var.policyset_names)
  
  resource_type = "prismasdwan_path_policy_set"
  resource_property = "name"
  resource_property_value = var.policyset_names[count.index]
}

resource "prismasdwan_path_policy_stack" "policy_stack_main" {
  # Required fields
  name                     = var.policy_stack_name
  defaultrule_policyset_id = prismasdwan_resource_locator.defaultrule_policyset.result
  
  # Optional fields
  description              = var.description
  tags                    = var.tags
  default_policysetstack  = var.default_policysetstack
  
  # Policy set IDs (0-4 policy sets max, converted from names)
  policyset_ids = [for locator in prismasdwan_resource_locator.policy_sets : locator.result]
}