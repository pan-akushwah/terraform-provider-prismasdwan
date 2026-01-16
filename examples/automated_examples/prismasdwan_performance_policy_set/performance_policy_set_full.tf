resource "prismasdwan_performance_policy_set" "policy_set_main" {
  # Required fields
  name = var.policy_set_name
  
  # Optional basic fields
  description           = var.description
  tags                  = var.tags
  defaultrule_policyset = var.defaultrule_policyset
  send_to_element       = var.send_to_element
  clone_from            = var.clone_from
  
  # Link Health Rules (attribute - direct assignment)
  link_health_rules = var.link_health_rules
  
  # Policy Rules (attribute - direct assignment)  
  policy_rules = var.policy_rules
}