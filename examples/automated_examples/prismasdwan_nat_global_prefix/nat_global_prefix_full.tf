resource "prismasdwan_nat_global_prefix" "nat_global_prefix_main" {
  # Required fields
  name = var.nat_global_prefix_name
  
  # Optional fields
  description = var.description
  tags = var.tags
  ipv4_prefixes = var.ipv4_prefixes
}