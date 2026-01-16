resource "prismasdwan_ipfix_local_prefix" "prefix_main" {
  # Required fields
  name = var.prefix_name
  
  # Optional fields
  description = var.description
  tags        = var.tags
}