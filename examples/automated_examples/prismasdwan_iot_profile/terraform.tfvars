# IoT Profile Configuration
iot_profile_name = "Enterprise-IoT-Profile"
snmp_version = "v3"
description = "Enterprise IoT profile for comprehensive device discovery and management"
tags = ["terraform", "iot", "device-discovery", "enterprise"]

# SNMP Discovery Settings
snmp_discovery_enabled = true
snmp_discovery_device_refresh_frequency = 60
snmp_discovery_network_refresh_frequency = 360
snmp_discovery_use_local_neighbours = true

# SNMP V2 Configuration (used when snmp_version = "V2")
snmp_community_string = "public"

# SNMP V3 Configuration (used when snmp_version = "V3")
snmp_username = "iotadmin"
snmp_security_level = "AUTH"
snmp_auth_protocol = "SHA"
snmp_auth_password = "SecureAuth123!"
snmp_privacy_protocol = "AES"
snmp_privacy_password = "SecurePrivacy123!"

# Status Settings
disabled = false
disabled_reason = null
inactive = false
inactive_reason = null