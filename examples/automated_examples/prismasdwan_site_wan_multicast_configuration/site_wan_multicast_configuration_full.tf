# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_site_wan_multicast_configuration" "site_wan_multicast_configuration_full" {
  # Required site_configs array
  site_configs = [
    for config in var.site_configs : {
      source_ipv4_address = config.source_ipv4_address
      group_ipv4_prefix   = config.group_ipv4_prefix
    }
  ]
  
  # Set x_parameters for site-specific multicast configuration
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}