# Hub Distribution Fabric Configuration
distribution_fabric_name = "TerraformTest1"
hub_site_name = "AnirudhTestHub"
description = "Production enterprise hub distribution fabric managing prefix distribution, route advertisements, and traffic coordination across all branch and remote office locations"
tags = ["terraform", "production", "hub-distribution", "prefix-distribution", "routing", "enterprise", "wan-optimization"]

# Spoke Sites Configuration
spoke_site_names = [
  "London","Chennai"
]

# Capacity Planning
max_spoke_sites = 50