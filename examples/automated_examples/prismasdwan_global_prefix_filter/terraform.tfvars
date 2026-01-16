# Global Prefix Filter Configuration
global_prefix_filter_name = "Enterprise-Global-Prefix-Filter"
description = "Enterprise global prefix filter for network route management and prefix advertisement control"

# Filters Configuration - Required field
filters = [
  {
    type = "ipv4"
    ip_prefixes = [
      "10.0.0.0/8",
      "172.16.0.0/12", 
      "192.168.0.0/16",
      "203.0.113.0/24",
      "198.51.100.0/24"
    ]
  }
]