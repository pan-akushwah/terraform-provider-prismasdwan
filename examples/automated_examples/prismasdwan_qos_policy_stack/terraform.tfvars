# QoS Policy Stack Configuration
qos_policy_stack_name = "EnterpriseTerraformStack"
defaultrule_policyset_name = "Default QoS Simple Stack Default Rule Policy Set (Simple)"
description = "Production enterprise QoS policy stack with comprehensive traffic prioritization, bandwidth management, and application-aware routing"
tags = ["terraform", "enterprise", "production", "qos", "traffic-management", "bandwidth", "prioritization"]

# Stack Properties
default_policysetstack = false

# Policy Sets in Stack (0-4 max)
policyset_names = [
  "Default QoS Simple Stack Policy Set (Simple)"
]
