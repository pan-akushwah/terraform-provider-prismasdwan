# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# Routing Route Map Configuration
routemap_name = "EnterpriseBGPRouteMap"
used_for = "bgp"
description = "Enterprise BGP route map for advanced route filtering, attribute manipulation, and traffic engineering with comprehensive match and set conditions"
tags = ["terraform", "bgp", "route-map", "routing-policy", "enterprise", "traffic-engineering"]

# Optional Configuration
auto_generated = false

# Route Map Entries Configuration
route_map_entries = [
  # Entry 1: High priority routes - match specific prefix list and set high local preference
  {
    order  = 10
    permit = true
    match = {
      ip_prefix_list_id = "high-priority-prefixes"
      metric           = null
      tag              = null
      community_list_id = null
      ip_next_hop_id   = null
      as_path_id       = null
    }
    set = {
      local_preference   = 200
      weight            = 100
      metric            = null
      type              = null
      additive_community = null
      tag               = null
      ip_v6_next_hop    = null
      ip_next_hop       = null
      community         = null
      as_path_prepend   = null
    }
    continue_entry = "20"
  },
  
  # Entry 2: Customer routes - match AS path and set community
  {
    order  = 20
    permit = true
    match = {
      as_path_id       = "customer-as-path-list"
      metric           = null
      tag              = null
      community_list_id = null
      ip_next_hop_id   = null
      ip_prefix_list_id = null
    }
    set = {
      community         = "65001:100"
      local_preference  = 150
      tag              = 100
      metric           = null
      type             = null
      additive_community = null
      ip_v6_next_hop   = null
      ip_next_hop      = null
      weight           = null
      as_path_prepend  = null
    }
    continue_entry = null
  },
  
  # Entry 3: Partner routes - match community list and modify attributes
  {
    order  = 30
    permit = true
    match = {
      community_list_id = "partner-community-list"
      metric           = null
      tag              = null
      ip_next_hop_id   = null
      ip_prefix_list_id = null
      as_path_id       = null
    }
    set = {
      local_preference   = 120
      community         = "65001:200"
      additive_community = true
      weight            = 50
      metric            = null
      type              = null
      tag               = null
      ip_v6_next_hop    = null
      ip_next_hop       = null
      as_path_prepend   = null
    }
    continue_entry = null
  },
  
  # Entry 4: Backup path - match next hop and set lower preference
  {
    order  = 40
    permit = true
    match = {
      ip_next_hop_id   = "backup-next-hop-list"
      metric           = null
      tag              = null
      community_list_id = null
      ip_prefix_list_id = null
      as_path_id       = null
    }
    set = {
      local_preference = 80
      weight          = 10
      as_path_prepend = "65001 65001"
      metric          = null
      type            = null
      additive_community = null
      tag             = null
      ip_v6_next_hop  = null
      ip_next_hop     = null
      community       = null
    }
    continue_entry = null
  },
  
  # Entry 5: Regional routes - match tag and set regional community
  {
    order  = 50
    permit = true
    match = {
      tag              = 1000
      metric           = null
      community_list_id = null
      ip_next_hop_id   = null
      ip_prefix_list_id = null
      as_path_id       = null
    }
    set = {
      community        = "65001:1001"
      local_preference = 100
      tag             = 2000
      metric          = null
      type            = null
      additive_community = null
      ip_v6_next_hop  = null
      ip_next_hop     = null
      weight          = null
      as_path_prepend = null
    }
    continue_entry = null
  },
  
  # Entry 6: Metric-based routing - match metric and adjust preference
  {
    order  = 60
    permit = true
    match = {
      metric           = 50
      tag              = null
      community_list_id = null
      ip_next_hop_id   = null
      ip_prefix_list_id = null
      as_path_id       = null
    }
    set = {
      local_preference = 90
      metric          = 100
      weight          = 20
      type            = null
      additive_community = null
      tag             = null
      ip_v6_next_hop  = null
      ip_next_hop     = null
      community       = null
      as_path_prepend = null
    }
    continue_entry = null
  },
  
  # Entry 7: IPv6 next hop setting - match prefix and set IPv6 next hop
  {
    order  = 70
    permit = true
    match = {
      ip_prefix_list_id = "ipv6-prefixes"
      metric           = null
      tag              = null
      community_list_id = null
      ip_next_hop_id   = null
      as_path_id       = null
    }
    set = {
      ip_v6_next_hop  = "2001:db8::1"
      local_preference = 110
      community       = "65001:300"
      metric          = null
      type            = null
      additive_community = null
      tag             = null
      ip_next_hop     = null
      weight          = null
      as_path_prepend = null
    }
    continue_entry = null
  },
  
  # Entry 8: Traffic engineering - specific next hop setting
  {
    order  = 80
    permit = true
    match = {
      community_list_id = "te-community-list"
      metric           = null
      tag              = null
      ip_next_hop_id   = null
      ip_prefix_list_id = null
      as_path_id       = null
    }
    set = {
      ip_next_hop     = "192.168.1.1"
      weight          = 200
      local_preference = 140
      metric          = null
      type            = null
      additive_community = null
      tag             = null
      ip_v6_next_hop  = null
      community       = null
      as_path_prepend = null
    }
    continue_entry = null
  },
  
  # Entry 9: Security filtering - deny unwanted routes
  {
    order  = 90
    permit = false
    match = {
      community_list_id = "blacklist-community"
      as_path_id       = "malicious-as-path"
      metric           = null
      tag              = null
      ip_next_hop_id   = null
      ip_prefix_list_id = null
    }
    set = null
    continue_entry = null
  },
  
  # Entry 10: Default action - permit all other routes with standard preference
  {
    order  = 100
    permit = true
    match = null
    set = {
      local_preference = 100
      community       = "65001:999"
      tag            = 9999
      metric         = null
      type           = null
      additive_community = null
      ip_v6_next_hop = null
      ip_next_hop    = null
      weight         = null
      as_path_prepend = null
    }
    continue_entry = null
  }
]