# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# Routing Prefix List Configuration
prefixlist_name = "Enterprise-Routing-Prefix-List"
description = "Enterprise routing prefix list for BGP route filtering with IPv4 and IPv6 support, prefix length matching, and comprehensive access control"
tags = ["terraform", "routing", "bgp", "prefix-filter", "enterprise", "ipv4", "ipv6"]

# Optional Configuration
auto_generated = false

# Prefix Filter List Configuration
prefix_filter_list = [
  # IPv4 Exact Match Filters (using 0 for ge/le when doing exact match)
  {
    prefix       = "10.0.0.0/8"
    ipv6_prefix  = null
    permit       = true
    order        = 10
    ge           = 0
    le           = 0
  },
  {
    prefix       = "172.16.0.0/12"
    ipv6_prefix  = null
    permit       = true
    order        = 20
    ge           = 0
    le           = 0
  },
  {
    prefix       = "192.168.0.0/16"
    ipv6_prefix  = null
    permit       = true
    order        = 30
    ge           = 0
    le           = 0
  },
  
  # IPv4 Range Filters (with proper GE/LE values)
  # For 203.0.113.0/24, ge must be > 24, so starting from 25
  {
    prefix       = "203.0.113.0/24"
    ipv6_prefix  = null
    permit       = true
    order        = 40
    ge           = 25
    le           = 30
  },
  # For 198.51.100.0/24, ge must be > 24, so starting from 25
  {
    prefix       = "198.51.100.0/24"
    ipv6_prefix  = null
    permit       = false
    order        = 50
    ge           = 25
    le           = 32
  },
  
  
  
  
  # Deny filters for security
  # For 0.0.0.0/0, ge must be > 0, so starting from 1
  {
    prefix       = "0.0.0.0/0"
    ipv6_prefix  = null
    permit       = false
    order        = 90
    ge           = 1
    le           = 7
  },
 
  
  # Additional examples with different prefix lengths
  # For 10.1.0.0/16, allow subnets from /17 to /24
  {
    prefix       = "10.1.0.0/16"
    ipv6_prefix  = null
    permit       = true
    order        = 110
    ge           = 17
    le           = 24
  }
]
