# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# AS Path Access List Configuration
aspathacl_name = "EnterpriseASPathACL"
description = "Enterprise AS Path Access List for BGP route filtering based on AS path patterns and security policies"
tags = ["terraform", "routing", "bgp", "as-path-filter", "enterprise", "security"]

# Optional Configuration
auto_generated = false

# AS Path Regex Rules Configuration
as_path_regex_list = [
  {
    as_path_regex = "^65001$"
    permit        = true
    order         = 10
  },
  {
    as_path_regex = "^65002 65001$"
    permit        = true
    order         = 20
  },
  {
    as_path_regex = "_64512_"
    permit        = false
    order         = 30
  },
  {
    as_path_regex = "^65[0-9][0-9][0-9]$"
    permit        = false
    order         = 40
  }
]