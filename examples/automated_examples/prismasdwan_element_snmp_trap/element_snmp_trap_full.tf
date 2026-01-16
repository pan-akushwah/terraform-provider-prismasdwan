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

resource "prismasdwan_element_snmp_trap" "element_snmp_trap_full" {
  # Required fields
  version = var.snmp_version
  server_ip = var.server_ip
  
  # Optional fields
  description = var.description
  tags = var.tags
  enabled = var.enabled
  source_interface = var.source_interface
  
  # SNMPv2 Configuration
  v2_config = var.snmp_version == "v2" ? {
    community = var.v2_community
  } : null
  
  # SNMPv3 Configuration
  v3_config = var.snmp_version == "v3" ? {
    user_access = {
      user_name = var.v3_user_name
      engine_id = var.v3_engine_id
      security_level = var.v3_security_level
      auth_type = var.v3_auth_type
      auth_phrase = var.v3_auth_phrase
      enc_type = var.v3_enc_type
      enc_phrase = var.v3_enc_phrase
    }
  } : null
  
  # Set x_parameters for site and element-specific SNMP trap
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}