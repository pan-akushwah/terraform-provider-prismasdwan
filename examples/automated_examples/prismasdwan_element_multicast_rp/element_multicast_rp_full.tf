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
  
  # Set x_parameters for site-specific element lookup
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}

resource "prismasdwan_element_multicast_rp" "element_multicast_rp_full" {
  # Required fields
  name = var.rp_name
  ipv4_address = var.ipv4_address
  
  # Groups configuration (required)
  groups = [
    for group in var.multicast_groups : {
      name = group.name
      ipv4_prefix = group.ipv4_prefix
    }
  ]
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # Set x_parameters for site and element-specific multicast RP
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}