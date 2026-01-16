# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_site_ipfix_local_prefix" "site_ipfix_local_prefix_full" {
  # Required field
  prefix_id = var.prefix_id
  
  # Optional fields
  ipv4_prefixes = var.ipv4_prefixes
  tags = var.tags
  
  # Set x_parameters for site-specific ipfix local prefix
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}