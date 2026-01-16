# Site Configuration
site_name = "London"

# NAT Prefix Configuration
prefix_id = "ryanzLocalNatPrefix1"

# IPv4 Prefixes for NAT Local Pool
ipv4_prefixes = [
  "192.168.100.0/24",
  "192.168.101.0/24", 
  "192.168.102.0/24",
  "10.10.20.0/24",
  "10.10.21.0/24"
]

# Tags for organization and management
tags = ["terraform", "nat", "local-prefix", "site-specific", "address-pool"]