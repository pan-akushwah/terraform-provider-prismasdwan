# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for security zone (required)
resource "prismasdwan_resource_locator" "security_zone" {
  resource_type = "prismasdwan_security_zone"
  resource_property = "name"
  resource_property_value = var.zone_name
}

# Resource locators for WAN networks (if specified)
resource "prismasdwan_resource_locator" "wan_networks" {
  count = length(var.wan_network_names)
  
  resource_type = "prismasdwan_wan_network"
  resource_property = "name"
  resource_property_value = var.wan_network_names[count.index]
}

# Resource locators for LAN networks (if specified)
resource "prismasdwan_resource_locator" "lan_networks" {
  count = length(var.lan_network_names)
  
  resource_type = "prismasdwan_lan_network"
  resource_property = "name"
  resource_property_value = var.lan_network_names[count.index]
}

# Resource locators for WAN overlay networks (if specified)
resource "prismasdwan_resource_locator" "wan_overlay_networks" {
  count = length(var.wan_overlay_network_names)
  
  resource_type = "prismasdwan_wan_overlay_network"
  resource_property = "name"
  resource_property_value = var.wan_overlay_network_names[count.index]
}

# Site security zone association
resource "prismasdwan_site_security_zone" "site_security_zone_main" {
  # Required fields
  zone_id = prismasdwan_resource_locator.security_zone.result
  
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
  
  # Network associations
  networks = concat(
    # WAN networks
    [for idx, locator in prismasdwan_resource_locator.wan_networks : {
      network_type = "wan_network"
      network_id   = locator.result
    }],
    # LAN networks
    [for idx, locator in prismasdwan_resource_locator.lan_networks : {
      network_type = "lan_network"
      network_id   = locator.result
    }],
    # WAN overlay networks
    [for idx, locator in prismasdwan_resource_locator.wan_overlay_networks : {
      network_type = "wan_overlay"
      network_id   = locator.result
    }]
  )
}
