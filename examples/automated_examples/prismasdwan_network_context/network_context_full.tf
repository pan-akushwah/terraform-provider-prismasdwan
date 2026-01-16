resource "prismasdwan_network_context" "context_main" {
  # Required fields
  name = var.context_name
  
  # Optional fields
  description = var.description
}
