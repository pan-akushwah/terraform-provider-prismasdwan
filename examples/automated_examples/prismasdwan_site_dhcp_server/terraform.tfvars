# Site DHCP Server Configuration
site_name = "London"

# Basic DHCP Configuration
address_family = "ipv4"
subnet = "192.168.1.0/24"
disabled = false
description = "Production DHCP server for branch office LAN with corporate network settings"
tags = ["terraform", "dhcp", "production", "branch-office", "network"]

# Network Configuration
gateway = "192.168.1.6"
broadcast_address = "192.168.1.255"
domain_name = "corp.example.com"
dns_servers = ["1.1.1.1", "8.8.8.8"]

# IP Range Configuration
ip_ranges = [
  {
    start_ip = "192.168.1.1"
    end_ip   = "192.168.1.5"
  },
  {
    start_ip = "192.168.1.100"
    end_ip   = "192.168.1.200"
  }
]

# Lease Time Configuration (in seconds)
default_lease_time = 43200  # 12 hours
max_lease_time = 86400      # 24 hours

# Context Configuration (use names for resource locator lookup)
vrf_context_name = "Global"  # Set to VRF context name if using resource locator
vrf_context_id = "1732165509570014796"
network_context_name = null  # Set to network context name if using resource locator
network_context_id = null

# Static IP Mappings (optional)
static_mappings = [
  {
    name = "server-01"
    ip_address = "192.168.1.10"
    mac = "00:11:22:33:44:55"
  },
  {
    name = "printer-01"
    ip_address = "192.168.1.11"
    mac = "aa:bb:cc:dd:ee:ff"
  }
]

# Custom DHCP Options (optional)
custom_options = null