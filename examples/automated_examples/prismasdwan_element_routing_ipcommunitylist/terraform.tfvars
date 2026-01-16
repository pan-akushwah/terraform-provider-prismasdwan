# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# IP Community List Configuration
communitylist_name = "EnterpriseBGPList"
description = "Enterprise BGP community list for route tagging, policy control, and traffic engineering with well-known and custom community values"
tags = ["terraform", "bgp", "community", "routing-policy", "enterprise", "traffic-engineering"]

# Optional Configuration
auto_generated = false

# Community List Configuration
community_list = [
  # Well-known BGP communities (permit)
  {
    community_str = "internet"
    permit        = true
  },
  {
    community_str = "no-export"
    permit        = false
  },
  {
    community_str = "no-advertise"
    permit        = false
  },
  {
    community_str = "local-AS"
    permit        = false
  },
  
  # Custom ASN:Value format communities for enterprise use
  # Enterprise internal communities (permit)
  {
    community_str = "65001:100"
    permit        = true
  },
  {
    community_str = "65001:200"
    permit        = true
  },
  {
    community_str = "65001:300"
    permit        = true
  },
  
  # Partner/Customer communities (permit)
  {
    community_str = "65002:100"
    permit        = true
  },
  {
    community_str = "65002:150"
    permit        = true
  },
  
  # Regional tagging communities (permit)
  {
    community_str = "65001:1001"  # North America
    permit        = true
  },
  {
    community_str = "65001:1002"  # Europe
    permit        = true
  },
  {
    community_str = "65001:1003"  # Asia Pacific
    permit        = true
  },
  
  # Service level communities (permit)
  {
    community_str = "65001:9001"  # Premium service
    permit        = true
  },
  {
    community_str = "65001:9002"  # Standard service
    permit        = true
  },
  {
    community_str = "65001:9003"  # Best effort
    permit        = true
  },
  
  # Security/filtering communities (deny)
  {
    community_str = "65000:666"   # Blackhole community
    permit        = false
  },
  {
    community_str = "65000:999"   # Quarantine community
    permit        = false
  },
  
  # Traffic engineering communities (permit)
  {
    community_str = "65001:2001"  # Primary path
    permit        = true
  },
  {
    community_str = "65001:2002"  # Backup path
    permit        = true
  },
  {
    community_str = "65001:2003"  # Load balancing
    permit        = true
  },
  
  # QoS marking communities (permit)
  {
    community_str = "65001:3001"  # High priority
    permit        = true
  },
  {
    community_str = "65001:3002"  # Medium priority
    permit        = true
  },
  {
    community_str = "65001:3003"  # Low priority
    permit        = true
  },
  
  # Unwanted external communities (deny)
  {
    community_str = "65535:65535" # Reserved/invalid
    permit        = false
  },
  {
    community_str = "64512:1"     # Private ASN range
    permit        = false
  }
]
  # Enterprise internal communities (permit)