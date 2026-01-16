resource "prismasdwan_service_group" "service_group_main" {
  # Required fields
  name = var.service_group_name
  type = var.service_group_type
  
  # Optional fields
  description = var.description
  tags = var.tags
}