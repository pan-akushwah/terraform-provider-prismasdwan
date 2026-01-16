# WAN Interface Label Configuration
wan_interface_label_name = "ProductionLabel"
description = "Production enterprise WAN interface label for primary internet connection with comprehensive monitoring and traffic management"
label = "public-12"
tags = ["terraform", "production", "wan-label", "enterprise", "primary-internet"]

# Probe Configuration
probe_profile_name = "Default probe profile"

# Feature Configuration
bwc_enabled = true
lqm_enabled = true
use_lqm_for_non_hub_paths = true
use_for_application_reachability_probes = true
use_for_controller_connections = true

# L3 Reachability Configuration
l3_reachability_use_element_default = false
l3_reachability_probe_config_names = [
  "CloudFlare DNS ICMP Response",
  "Google G-Suite ICMP Response"
]

# VPN Link Configuration
vpnlink_keep_alive_interval = 5000
vpnlink_keep_alive_failure_count = 3