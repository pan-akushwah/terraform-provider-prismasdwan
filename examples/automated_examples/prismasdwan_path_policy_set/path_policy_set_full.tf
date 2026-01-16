resource "prismasdwan_path_policy_set" "policy_set_main" {
  # Required fields
  name = var.policy_set_name
  
  # Optional fields
  description           = var.description
  tags                 = var.tags
  defaultrule_policyset = var.defaultrule_policyset
  clone_from           = var.clone_from
}