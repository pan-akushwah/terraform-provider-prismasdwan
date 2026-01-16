resource "prismasdwan_path_global_prefix" "path_global_prefix_main" {
  # Required fields
  name = var.path_global_prefix_name
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # IP Prefixes
  ipv4_prefixes = var.ipv4_prefixes
  ipv6_prefixes = var.ipv6_prefixes
}