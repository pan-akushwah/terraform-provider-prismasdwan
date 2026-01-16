resource "prismasdwan_ipfix_global_prefix" "prefix_main" {
  # Required fields
  name = var.prefix_name
  
  # Optional fields
  description    = var.description
  tags           = var.tags
  ipv4_prefixes  = var.ipv4_prefixes
}