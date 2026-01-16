resource "prismasdwan_nat_policy_set" "nat_policy_set_main" {
  # Required fields
  name = var.nat_policy_set_name
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # Policy rule ordering (optional)
  source_zone_policyrule_order = var.source_zone_policyrule_order
  destination_zone_policyrule_order = var.destination_zone_policyrule_order
  
  # Clone configuration (optional)
  clone_from = var.clone_from
  
  # Policy rules (optional, can be managed separately)
  policy_rules = var.policy_rules
  
  # Transient fields
  update_order = var.update_order
  send_to_element = var.send_to_element
  policy_req_version = var.policy_req_version
}