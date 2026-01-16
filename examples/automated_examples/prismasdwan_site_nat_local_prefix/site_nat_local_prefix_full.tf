# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for NAT prefix (required)
resource "prismasdwan_resource_locator" "nat_prefix" {
  resource_type = "prismasdwan_nat_local_prefix"
  resource_property = "prefix_id"
  resource_property_value = var.prefix_id
}

resource "prismasdwan_site_nat_local_prefix" "site_nat_local_prefix_full" {
  # Required fields
  prefix_id = prismasdwan_resource_locator.nat_prefix.result
  
  # Optional fields
  ipv4_prefixes = var.ipv4_prefixes
  tags = var.tags
  
  # Set x_parameters for site-specific NAT local prefix configuration
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}