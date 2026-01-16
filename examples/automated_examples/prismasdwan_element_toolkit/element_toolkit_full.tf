# Resource locator for site (required for element lookup)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for element (required for element toolkit configuration)
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
}

resource "prismasdwan_resource_locator" "toolkit" {
    x_parameters = {
    element_id = prismasdwan_resource_locator.element.result
  }
  resource_type = "prismasdwan_element_toolkit"
  resource_property = "name"
  resource_property_value = var.element_name
}

resource "prismasdwan_element_toolkit" "element_toolkit_full" {
  # X-Parameters for API path (element_id required)
  x_parameters = {
    element_id = prismasdwan_resource_locator.element.result
    element_access_id = prismasdwan_resource_locator.toolkit.result
  }
  
  # Element Toolkit Configuration
  ssh_outbound_enabled     = var.ssh_outbound_enabled
  ssh_enabled             = var.ssh_enabled
  otpkey_version          = var.otpkey_version
  account_disable_interval = var.account_disable_interval
  retry_login_count       = var.retry_login_count
  inactive_interval       = var.inactive_interval
}