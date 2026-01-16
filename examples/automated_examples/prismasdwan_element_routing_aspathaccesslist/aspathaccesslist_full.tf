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
}

resource "prismasdwan_element_routing_aspathaccesslist" "aspathaccesslist_full" {
    x_parameters = {
  site_id       = prismasdwan_resource_locator.site.result
  element_id    = prismasdwan_resource_locator.element.result
    }
  name          = var.aspathacl_name
  description   = var.description
  tags          = var.tags
  auto_generated = var.auto_generated
  
  as_path_regex_list = var.as_path_regex_list
}