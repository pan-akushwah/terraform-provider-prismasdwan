# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# SNMP Trap Basic Configuration
snmp_version = "v2"
server_ip = "192.168.1.100"
enabled = true
source_interface = null

# Basic Configuration
description = "SNMP trap for network alerts and monitoring"
tags = ["terraform", "snmp", "trap", "monitoring"]

# SNMPv2 Configuration
v2_community = "public"

# SNMPv3 Configuration (used when snmp_version = "v3")
v3_user_name = "snmpuser"
v3_engine_id = null
v3_security_level = "NOAUTH"
v3_auth_type = "NONE"
v3_auth_phrase = null
v3_enc_type = "NONE"
v3_enc_phrase = null