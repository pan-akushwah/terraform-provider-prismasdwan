resource "prismasdwan_nat_local_prefix" "nat_local_prefix_main" {
  # Required fields
  name = var.nat_local_prefix_name
  
  # Optional fields
  description = var.description
  tags = var.tags
}