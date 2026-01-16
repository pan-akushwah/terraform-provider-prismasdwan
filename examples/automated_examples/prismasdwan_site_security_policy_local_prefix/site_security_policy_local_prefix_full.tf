# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for security policy prefix (required)
resource "prismasdwan_resource_locator" "security_policy_prefix" {
  resource_type = "prismasdwan_security_policy_local_prefix"
  resource_property = "name"
  resource_property_value = var.prefix_id
}

resource "prismasdwan_site_security_policy_local_prefix" "site_security_policy_local_prefix_full" {
  # Required fields
  prefix_id = prismasdwan_resource_locator.security_policy_prefix.result
  
  # Optional fields
  ipv4_prefixes = var.ipv4_prefixes
  ipv6_prefixes = var.ipv6_prefixes
  tags = var.tags
  
  # Set x_parameters for site-specific security policy local prefix configuration
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}