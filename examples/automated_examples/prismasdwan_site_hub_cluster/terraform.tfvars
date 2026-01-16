# Hub Cluster Configuration
hub_cluster_name = "Production-Enterprise-Hub-Cluster"
hub_site_name = "Seattle"
description = "Production enterprise hub cluster providing centralized routing, policy enforcement, and connectivity for branch sites and remote locations"
tags = ["terraform", "production", "hub-cluster", "enterprise", "routing", "connectivity"]

# Cluster Properties
default_cluster = false
site_count_alarm_threshold = 150

# Peer Sites Configuration (using site names that will be resolved to IDs)
peer_site_names = [
  "Chennai",
  "London"
]

# Hub Elements Configuration (using element names that will be resolved to IDs)
hub_element_names = [
  {
    element_name = "DC-SITE1-ELEM1"
    locked       = false
  }
]