# Probe Config Configuration
probe_config_name = "Production-CGNX-DNS-ICMP-Probe"
description = "Production probe configuration for CloudFlare DNS ICMP response monitoring and connectivity validation"
enabled = true
tags = ["terraform", "production", "cloudflare", "dns", "icmp", "monitoring"]

# Probe Endpoints Configuration
endpoints = [
  {
    ipv4_address                     = "1.1.1.1"
    protocol                        = "http"
    probe_cycle_duration            = 10
    probe_count                     = 2
    path_types                      = ["direct", "vpn", "servicelink"]
    allow_insecure_https_connection = false
  }
]