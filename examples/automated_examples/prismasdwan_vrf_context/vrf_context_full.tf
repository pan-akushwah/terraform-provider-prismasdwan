resource "prismasdwan_vrf_context" "context_main" {
  # Required fields
  name = var.context_name
  
  # Optional fields
  description = var.description
  tags        = var.tags
}
