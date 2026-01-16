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

resource "prismasdwan_element_snmp_agent" "element_snmp_agent_full" {
  # Required system information
  system_location = var.system_location
  system_contact = var.system_contact
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # SNMPv2 Configuration
  v2_config = var.v2_enabled ? {
    enabled = var.v2_enabled
    community = var.v2_community
  } : null
  
  # SNMPv3 Configuration
  v3_config = var.v3_enabled ? {
    enabled = var.v3_enabled
    users_access = var.v3_users
  } : null
  
  # Set x_parameters for site and element-specific SNMP agent
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}