resource "prismasdwan_path_local_prefix" "path_local_prefix_main" {
  # Required fields
  name = var.path_local_prefix_name
  
  # Optional fields
  description = var.description
  tags = var.tags
}