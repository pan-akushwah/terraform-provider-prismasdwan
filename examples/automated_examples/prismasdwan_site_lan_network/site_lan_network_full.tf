# Resource locators for dependencies
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_site_lan_network" "site_lan_network_full" {
  # Required fields
  name = var.site_lan_network_name
  scope = var.scope
  
  # X_parameters contains only site_id
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
  
  # Optional basic fields that are supported
  description = var.description
  tags = var.tags
}
