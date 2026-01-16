resource "prismasdwan_qos_policy_set" "qos_policy_set_full" {
  # Required fields
  name = var.qos_policy_set_name
  business_priority_names = var.business_priority_names
  bandwidth_allocation_schemes = var.bandwidth_allocation_schemes
  
  # Optional fields
  description = var.description
  tags = var.tags
  template = var.template
  defaultrule_policyset = var.defaultrule_policyset
  clone_from = var.clone_from
  default_rule_dscp_mappings = var.default_rule_dscp_mappings
}