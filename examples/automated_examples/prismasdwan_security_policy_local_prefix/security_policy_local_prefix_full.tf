resource "prismasdwan_security_policy_local_prefix" "local_prefix_main" {
  # Required fields
  name = var.prefix_name
  
  # Optional fields
  description = var.description
  tags        = var.tags
}