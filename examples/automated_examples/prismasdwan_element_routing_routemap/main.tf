# Resource locator for site
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for element
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
  
  depends_on = [prismasdwan_resource_locator.site]
}

# Element Routing Route Map resource
resource "prismasdwan_element_routing_routemap" "routemap_full" {
  # Required fields
  x_parameters = {
  site_id    = prismasdwan_resource_locator.site.result
  element_id = prismasdwan_resource_locator.element.result
  }
  name       = var.routemap_name
  used_for   = var.used_for
  
  # Optional fields
  description      = var.description
  tags            = var.tags
  auto_generated  = var.auto_generated
  
  # Route map entries
  route_map_entries = var.route_map_entries
}