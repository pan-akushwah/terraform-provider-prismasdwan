# Performance Policy Set Configuration
policy_set_name = "Enterprise-Performance-Policy-Set"
description = "Enterprise performance policy set for comprehensive network monitoring"
defaultrule_policyset = false
send_to_element = true
tags = ["terraform", "performance"]

# Link Health Rules Configuration (minimal)
link_health_rules = [
  {
    name = "Basic-Health-Rule"
    type = "APP_CIRCUIT_HEALTH"
    enabled = true
    description = "Basic health monitoring rule"
    tfid = "rule-001"
    
    actions = [
      {
        action_type = "VISIBILITY"
        always_on = false
        
        app_perf = {
          monitoring_approach = "MODERATE"
          bad_health_thresholds = {
            clear_below = 30
            raise_above = 60
          }
        }
      }
    ]
  }
]

# Policy Rules Configuration (minimal - try empty first)
policy_rules = []
