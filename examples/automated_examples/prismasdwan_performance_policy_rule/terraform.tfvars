# Performance Policy Rule Configuration
rule_name = "Enterprise-Performance-Policy-Rule"
rule_type = "APP_CIRCUIT_HEALTH"
enabled = true
description = "Enterprise performance policy rule for monitoring application and circuit health with automatic remediation"

# Parent Policy Set ID (this would typically come from a data source or another resource)
perfmgmtpolicyset_id = "example-perfmgmt-policyset-id-12345"

# Actions Configuration
actions = [
  {
    action_type = "VISIBILITY"
    always_on   = false
    
    app_perf = {
      monitoring_approach = "MODERATE"
      bad_health_thresholds = {
        clear_below = 25
        raise_above = 60
      }
    }
    
    circuit_utilization_perf = {
      monitoring_approach = "AGGRESSIVE"
      bad_health_thresholds = {
        clear_below = 20
        raise_above = 80
      }
    }
  },
  {
    action_type = "MOVE_FLOWS"
    always_on   = false
    
    lqm_perf = {
      monitoring_approach = "CONSERVATIVE"
      bad_health_thresholds = {
        clear_below = 30
        raise_above = 70
      }
    }
  }
]

# Path Filters
path_filters = [
  {
    path_type = "vpn"
    label     = "public-1"
  },
  {
    path_type = "direct"
    label     = "private-*"
  }
]

# Application Filters
app_filters = {
  app_transfer_types = ["RT_VIDEO", "TRANSACTIONAL"]
  application_ids    = ["app-id-1", "app-id-2", "app-id-3"]
}

# Service Labels
service_label_ids = ["service-label-1", "service-label-2"]

# Network Contexts
network_context_ids = ["network-context-1", "network-context-2"]

# Tags
tags = ["terraform", "enterprise", "performance", "policy", "monitoring", "health-check"]