resource "prismasdwan_security_policy_set" "security_policy_set_main" {
  # Required fields
  name = var.policy_set_name
  
  # Optional fields
  description             = var.description
  tags                   = var.tags
  defaultrule_policyset  = var.defaultrule_policyset
  policyrule_order       = var.policyrule_order
  clone_from             = var.clone_from
}