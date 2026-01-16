resource "prismasdwan_iot_profile" "iot_profile_main" {
  # Required fields
  name = var.iot_profile_name
  snmp_version = var.snmp_version
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # SNMP Discovery Settings
  snmp_discovery_enabled = var.snmp_discovery_enabled
  snmp_discovery_device_refresh_frequency = var.snmp_discovery_device_refresh_frequency
  snmp_discovery_network_refresh_frequency = var.snmp_discovery_network_refresh_frequency
  snmp_discovery_use_local_neighbours = var.snmp_discovery_use_local_neighbours
  
  # SNMP V2 Configuration (conditional based on version)
  v2_config = var.snmp_version == "V2" ? {
    snmp_community_string = var.snmp_community_string
  } : null
  
  # SNMP V3 Configuration (conditional based on version)
  v3_config = var.snmp_version == "V3" ? {
    snmp_username = var.snmp_username
    snmp_security_level = var.snmp_security_level
    snmp_auth_protocol = var.snmp_auth_protocol
    snmp_auth_password = var.snmp_auth_password
    snmp_privacy_protocol = var.snmp_privacy_protocol
    snmp_privacy_password = var.snmp_privacy_password
  } : null
  
  # Status Settings
  disabled = var.disabled
  disabled_reason = var.disabled_reason
  inactive = var.inactive
  inactive_reason = var.inactive_reason
}