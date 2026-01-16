# Site Configuration
site_name = "London"

# Site WAN Multicast Configurations
site_configs = [
  {
    source_ipv4_address = "192.168.1.10"
    group_ipv4_prefix   = "224.1.1.0/24"
  },
  {
    source_ipv4_address = "192.168.1.20"
    group_ipv4_prefix   = "224.2.1.0/24"
  },
  {
    source_ipv4_address = "192.168.2.10"
    group_ipv4_prefix   = "224.3.1.0/24"
  },
  {
    source_ipv4_address = "192.168.2.20"
    group_ipv4_prefix   = "232.1.1.0/24"
  },
  {
    source_ipv4_address = "10.0.1.100"
    group_ipv4_prefix   = "232.2.1.0/24"
  },
  {
    source_ipv4_address = "10.0.2.100"
    group_ipv4_prefix   = "225.1.1.0/24"
  }
]