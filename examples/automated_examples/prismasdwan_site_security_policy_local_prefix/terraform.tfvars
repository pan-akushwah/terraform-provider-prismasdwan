# Site Configuration
site_name = "London"

# Security Policy Prefix Configuration
prefix_id = "ryanSecurityLocalPrefix1"

# IPv4 Prefixes for Security Policy Enforcement
ipv4_prefixes = [
  "192.168.20.0/24",
  "192.168.21.0/24",
  "10.30.40.0/24",
  "172.16.200.0/24",
  "10.100.0.0/16"
]

# IPv6 Prefixes for Security Policy Enforcement
ipv6_prefixes = [
  "2001:db8:4000::/64",
  "2001:db8:5000::/64",
  "fd00:9876:5432::/64",
  "2001:db8:6000::/48",
  "fd00:def0:1234::/56"
]

# Tags for organization and management
tags = ["terraform", "security", "ngfw", "local-prefix", "site-specific", "firewall"]