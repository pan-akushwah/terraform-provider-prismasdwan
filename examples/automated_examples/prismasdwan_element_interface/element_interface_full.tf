# Resource locators for dependencies
resource "prismasdwan_resource_locator" "site" {
  count = var.site_name != null ? 1 : 0
  
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_resource_locator" "element" {
  count = var.element_name != null ? 1 : 0
  
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
}

resource "prismasdwan_element_interface" "element_interface_minimal" {
  # Required fields
  name = var.interface_name
  type = var.interface_type
  used_for = var.used_for
  scope = var.scope
  peer_bypasspair_wan_port_type = var.peer_bypasspair_wan_port_type
  x_parameters = {
  # Site and Element IDs (required in x_parameters or as separate arguments)
  site_id = var.site_id != null ? var.site_id : (
    length(prismasdwan_resource_locator.site) > 0 ? prismasdwan_resource_locator.site[0].result : null
  )
  
  element_id = var.element_id != null ? var.element_id : (
    length(prismasdwan_resource_locator.element) > 0 ? prismasdwan_resource_locator.element[0].result : null
  )
  }
  # Optional basic fields
  description = var.description
  tags = var.tags
  admin_up = var.admin_up
  mtu = var.mtu
}