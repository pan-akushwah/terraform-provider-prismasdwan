resource "prismasdwan_wan_network" "network_main" {
  # Required fields
  name = var.network_name
  type = var.network_type
  
  # Optional fields - only set if not null
  description         = var.description
  tags                = var.tags
}
