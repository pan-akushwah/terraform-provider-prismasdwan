# Hub Prefix Filter Profile Configuration
prefix_filter_profile_name = "TerraformTest1"
hub_site_name = "Seattle"
description = "Production enterprise hub prefix filter profile for comprehensive path prefix distribution control, route filtering, and traffic engineering across all branch and remote locations"
tags = ["terraform", "production", "hub-prefix-filter", "route-control", "distribution", "enterprise", "traffic-engineering"]

# Path Prefix Filter Configuration
path_prefix_filter_list = [
  {
    vrf_context_id = "default"
    path_prefix_filters = [
      # Corporate networks - permit with high priority
      {
        ipv4_prefix = "10.0.0.0/8"
        permit      = true
        order       = 10
      },
      {
        ipv4_prefix = "172.16.0.0/12"
        permit      = true
        order       = 20
      },
      {
        ipv4_prefix = "192.168.0.0/16"
        permit      = true
        order       = 30
      },
      # Data center networks - permit with medium priority
      {
        ipv4_prefix = "10.100.0.0/16"
        permit      = true
        order       = 40
      },
      {
        ipv4_prefix = "10.200.0.0/16"
        permit      = true
        order       = 50
      },
      # Management networks - permit with controlled distribution
      {
        ipv4_prefix = "10.255.0.0/16"
        permit      = true
        order       = 60
      },
      # Guest networks - deny distribution
      {
        ipv4_prefix = "192.168.100.0/24"
        permit      = false
        order       = 70
      },
      # Public internet - deny (default route control)
      {
        ipv4_prefix = "0.0.0.0/0"
        permit      = false
        order       = 100
      }
    ]
  },
  {
    vrf_context_id = "guest"
    path_prefix_filters = [
      # Guest VRF - limited distribution
      {
        ipv4_prefix = "192.168.100.0/24"
        permit      = true
        order       = 10
      },
      {
        ipv4_prefix = "192.168.101.0/24"
        permit      = true
        order       = 20
      },
      # Block everything else in guest VRF
      {
        ipv4_prefix = "0.0.0.0/0"
        permit      = false
        order       = 100
      }
    ]
  },
  {
    vrf_context_id = "management"
    path_prefix_filters = [
      # Management VRF - highly controlled distribution
      {
        ipv4_prefix = "10.255.0.0/16"
        permit      = true
        order       = 10
      },
      {
        ipv4_prefix = "172.31.0.0/16"
        permit      = true
        order       = 20
      },
      # IPv6 management networks
      {
        ipv6_prefix = "2001:db8:ffff::/48"
        permit      = true
        order       = 30
      },
      # Block all other networks from management VRF
      {
        ipv4_prefix = "0.0.0.0/0"
        permit      = false
        order       = 90
      },
      {
        ipv6_prefix = "::/0"
        permit      = false
        order       = 95
      }
    ]
  }
]

# Validation Configuration
enable_duplicate_order_validation = true
enable_prefix_validation = true
max_filters_per_vrf = 50