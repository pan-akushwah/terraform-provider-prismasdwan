# Resource locators for probe configurations (required)
resource "prismasdwan_resource_locator" "probe_configs" {
  count = length(var.probe_config_ids)
  
  resource_type = "prismasdwan_probe_config"
  resource_property = "name"
  resource_property_value = var.probe_config_ids[count.index]
}

resource "prismasdwan_probe_profile" "probe_profile_main" {
  # Required fields
  name             = var.probe_profile_name
  probe_config_ids = [for locator in prismasdwan_resource_locator.probe_configs : locator.result]
  
  # Optional fields
  description = var.description
  tags        = var.tags
}