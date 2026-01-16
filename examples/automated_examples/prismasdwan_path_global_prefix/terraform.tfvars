# Path Global Prefix Configuration
path_global_prefix_name = "Enterprise-Path-Global-Prefix"
description = "Global path prefix for enterprise-wide network policy routing and traffic classification"
tags = ["terraform", "path", "global-prefix", "routing", "enterprise"]

# IP Prefixes
ipv4_prefixes = [
  "10.0.0.0/8",
  "172.16.0.0/12", 
  "192.168.0.0/16"
]

ipv6_prefixes = [
  "2001:db8::/32",
  "fd00::/8"
]