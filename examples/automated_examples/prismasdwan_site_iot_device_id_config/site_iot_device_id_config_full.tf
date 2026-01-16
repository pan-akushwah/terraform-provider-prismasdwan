# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_site_iot_device_id_config" "site_iot_device_id_config_full" {
  # Required/Optional fields
  cfg_device_id_enabled = var.cfg_device_id_enabled
  
  # Set x_parameters for site-specific IoT device ID configuration
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}