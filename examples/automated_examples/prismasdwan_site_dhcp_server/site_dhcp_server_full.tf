# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for VRF context (if specified)
resource "prismasdwan_resource_locator" "vrf_context" {
  count = var.vrf_context_name != null ? 1 : 0
  
  resource_type = "prismasdwan_vrf_context"
  resource_property = "name"
  resource_property_value = var.vrf_context_name
}

# Resource locator for network context (if specified)
resource "prismasdwan_resource_locator" "network_context" {
  count = var.network_context_name != null ? 1 : 0
  
  resource_type = "prismasdwan_network_context"
  resource_property = "name"
  resource_property_value = var.network_context_name
}

# Site DHCP Server
resource "prismasdwan_site_dhcp_server" "dhcp_server_main" {
  # Required fields
  address_family = var.address_family
  subnet = var.subnet
  ip_ranges = var.ip_ranges
  
  # Site parameters
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
  
  # Optional basic configuration
  disabled = var.disabled
  tags = var.tags
  description = var.description
  
  # Network configuration
  gateway = var.gateway
  broadcast_address = var.broadcast_address
  domain_name = var.domain_name
  dns_servers = var.dns_servers
  
  # Lease time configuration
  default_lease_time = var.default_lease_time
  max_lease_time = var.max_lease_time
  
  # Context IDs (using resource locators if names provided, otherwise direct IDs)
  vrf_context_id = var.vrf_context_name != null ? prismasdwan_resource_locator.vrf_context[0].result : var.vrf_context_id
  network_context_id = var.network_context_name != null ? prismasdwan_resource_locator.network_context[0].result : var.network_context_id
  
  # Advanced configuration
  static_mappings = var.static_mappings
  custom_options = var.custom_options
}