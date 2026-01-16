resource "prismasdwan_nat_policy_pool" "nat_policy_pool_main" {
  # Required fields
  name = var.nat_policy_pool_name
  
  # Optional fields
  description = var.description
  tags = var.tags
}