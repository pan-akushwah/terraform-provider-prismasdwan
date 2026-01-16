resource "prismasdwan_qos_policy_local_prefix" "qos_policy_local_prefix_main" {
  # Required fields
  name = var.qos_policy_local_prefix_name
  
  # Optional fields
  description = var.description
  tags = var.tags
}