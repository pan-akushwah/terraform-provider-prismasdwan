# Site LAN Network Configuration
site_lan_network_name = "CorporateMainLAN"
scope = "local"
description = "Main corporate LAN network for office connectivity, DHCP services, and local resource access"
tags = ["terraform", "corporate", "main-lan", "dhcp-enabled", "production"]

# Site Configuration
site_name = "London"

# Network Configuration
ipv4_prefixes = ["192.168.10.0/24", "192.168.11.0/24"]
ipv4_default_routers = ["192.168.10.1", "192.168.11.1"]
ipv6_prefixes = ["2001:db8:10::/64"]
ipv6_default_routers = ["2001:db8:10::1"]

# VRF and Context
vrf_context_profile_name = "Corporate-VRF-Profile"
network_context_name = "Corporate-Network-Context"

# DHCP Server Configuration
dhcp_server_enabled = true
dhcp_server_subnet = "192.168.10.0/24"
dhcp_server_gateway = "192.168.10.1"
dhcp_server_broadcast_address = "192.168.10.255"

dhcp_server_ip_ranges = [
  {
    start_ip = "192.168.10.100"
    end_ip   = "192.168.10.200"
  },
  {
    start_ip = "192.168.10.220"
    end_ip   = "192.168.10.250"
  }
]

dhcp_server_default_lease_time = 86400   # 24 hours
dhcp_server_max_lease_time = 604800      # 7 days
dhcp_server_dns_servers = ["8.8.8.8", "1.1.1.1", "9.9.9.9"]
dhcp_server_domain_name = "corp.example.com"
dhcp_server_description = "Corporate DHCP server for main office LAN"
dhcp_server_tags = ["dhcp", "corporate", "main-office"]

# DHCP Static Mappings
dhcp_server_static_mappings = [
  {
    name       = "printer-hp-lobby"
    ip_address = "192.168.10.50"
    mac        = "00:1B:63:84:45:E6"
  },
  {
    name       = "conference-room-display"
    ip_address = "192.168.10.51"
    mac        = "00:50:56:C0:00:01"
  },
  {
    name       = "security-camera-main"
    ip_address = "192.168.10.52"
    mac        = "00:0C:29:69:41:C6"
  }
]

# DHCP Custom Options
dhcp_server_custom_options = [
  {
    option_definition = "option ntp-servers code 42 = array of ip-address"
    option_value     = "192.168.10.10, 192.168.10.11"
  },
  {
    option_definition = "option tftp-server-name code 66 = string"
    option_value     = "tftp.corp.example.com"
  }
]

# DHCP Relay (disabled in favor of local DHCP server)
dhcp_relay_enabled = false

# Traffic Policy Configuration
ingress_traffic_policysetstack_name = "Corporate-Ingress-Policy-Stack"
egress_traffic_policysetstack_name = "Corporate-Egress-Policy-Stack"

# Extended Tags
extended_tags = [
  {
    key        = "Environment"
    value      = "Production"
    value_type = "STRING"
  },
  {
    key        = "Department"
    value      = "IT"
    value_type = "STRING"
  },
  {
    key        = "VLAN_ID"
    value      = "10"
    value_type = "NUMBER"
  },
  {
    key        = "Critical"
    value      = "true"
    value_type = "BOOLEAN"
  }
]