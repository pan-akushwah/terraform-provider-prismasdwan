# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# Static Route Configuration
address_family = "ipv4"
scope = "global"
destination_prefix = "10.1.1.0/24"
static_route_name = "default-route"
description = "Default static route configured via Terraform"
tags = ["terraform", "static-route", "default"]

# Nexthop Configuration
nexthops = [
  {
    self = false
    admin_distance = 1
    nexthop_ip = "192.168.1.1"
    nexthop_interface_id = null
    nexthop_interface_name = null
  }
]

# Helper for interface name resolution
nexthop_interface_names = []

# Context Configuration (optional)
vrf_context_name = "Global"
vrf_context_id = null
network_context_name = null
network_context_id = null

# Additional Options
nexthop_reachability_probe = false