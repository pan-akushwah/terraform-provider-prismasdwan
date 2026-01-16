resource "prismasdwan_probe_config" "probe_config_main" {
  # Required fields
  name      = var.probe_config_name
  endpoints = var.endpoints
  
  # Optional fields
  description = var.description
  tags        = var.tags
  enabled     = var.enabled
}