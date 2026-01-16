# Site Configuration
site_name = "London"

# Path Policy Prefix Configuration
prefix_id = "ryanzPathLocalPrefix1b"

# IPv4 Prefixes for Path Policy Routing
ipv4_prefixes = [
  "192.168.10.0/24",
  "192.168.11.0/24",
  "10.20.30.0/24",
  "172.16.100.0/24",
  "10.50.60.0/22"
]

# IPv6 Prefixes for Path Policy Routing
ipv6_prefixes = [
  "2001:db8:1000::/64",
  "2001:db8:2000::/64", 
  "fd00:1234:5678::/64",
  "2001:db8:3000::/48",
  "fd00:abcd:ef01::/56"
]

# Tags for organization and management
tags = ["terraform", "path-policy", "local-prefix", "routing", "site-specific", "dual-stack"]