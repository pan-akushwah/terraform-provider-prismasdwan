# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for element (required)
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
}

# Resource locator for source interface (optional)
resource "prismasdwan_resource_locator" "source_interface" {
  count = var.source_interface_name != null ? 1 : 0
  
  resource_type = "prismasdwan_element_interface"
  resource_property = "name"
  resource_property_value = var.source_interface_name
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}

resource "prismasdwan_element_application_probe" "element_application_probe_full" {
  # Required fields
  name = var.probe_name
  
  # Optional fields
  description = var.description
  enable_probe = var.enable_probe
  tags = var.tags
  source_interface_id = var.source_interface_name != null ? prismasdwan_resource_locator.source_interface[0].result : null
  
  # Set x_parameters for element-specific application probe configuration
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}