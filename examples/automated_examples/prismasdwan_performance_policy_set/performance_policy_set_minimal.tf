resource "prismasdwan_performance_policy_set" "policy_set_minimal" {
  # Required fields
  name = var.policy_set_name
  
  # Optional basic fields
  description           = var.description
  tags                  = var.tags
  defaultrule_policyset = var.defaultrule_policyset
  send_to_element       = var.send_to_element
  
  # Link Health Rules only (skip policy_rules for now)
  link_health_rules = var.link_health_rules
}
