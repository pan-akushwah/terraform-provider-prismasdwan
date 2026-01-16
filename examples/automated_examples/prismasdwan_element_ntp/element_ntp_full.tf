# Resource locator for element (required)
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
}

resource "prismasdwan_resource_locator" "ntp" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element.result
  }
  resource_type = "prismasdwan_element_ntp"
  resource_property = "name"
  resource_property_value = var.ntp_name
}



# Resource locators for source interfaces (optional, based on interface names provided)
resource "prismasdwan_resource_locator" "source_interfaces" {
  count = var.source_interface_names != null ? length(var.source_interface_names) : 0
  
  resource_type = "prismasdwan_element_interface"
  resource_property = "name"
  resource_property_value = var.source_interface_names[count.index]
  
  # Set x_parameters for element-specific interface lookup
  x_parameters = {
    element_id = prismasdwan_resource_locator.element.result
  }
}

resource "prismasdwan_element_ntp" "element_ntp_full" {
  # Required fields
  name = var.ntp_name
  ntp_servers = var.ntp_servers
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # Source interface IDs (converted from names using resource locators)
  source_interface_ids = var.source_interface_names != null ? [for locator in prismasdwan_resource_locator.source_interfaces : locator.result] : var.source_interface_ids
  
  # Set x_parameters for element-specific NTP configuration
  x_parameters = {
    element_id = prismasdwan_resource_locator.element.result
    ntp_id = prismasdwan_resource_locator.ntp.result
  }
}