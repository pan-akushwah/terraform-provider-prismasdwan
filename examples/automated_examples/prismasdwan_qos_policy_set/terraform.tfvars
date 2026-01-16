# QoS Policy Set Configuration
qos_policy_set_name = "Productionterraform"
description = "Production enterprise QoS policy set with comprehensive traffic prioritization, bandwidth management, and DSCP classification"
tags = ["terraform", "enterprise", "production", "qos", "traffic-management", "bandwidth", "dscp"]

# Policy Set Properties
template = false
defaultrule_policyset = false
clone_from = null

# Business Priority Names (Required)
business_priority_names = [
  {
    priority_name   = "Mission-Critical"
    priority_number = 1
  },
  {
    priority_name   = "Business-Critical"
    priority_number = 2
  },
  {
    priority_name   = "Standard"
    priority_number = 3
  },
  {
    priority_name   = "Best-Effort"
    priority_number = 4
  }
]

# Bandwidth Allocation Schemes (Required)
bandwidth_allocation_schemes = [
  {
    bandwidth_range = {
      low  = 1.0
      high = 50.0
    }
    business_priorities = [
      {
        priority_number     = 1
        bandwidth_allocation = 45.0
        bandwidth_split_per_type = {
          rt_audio      = 15.0
          rt_video      = 35.0
          transactional = 35.0
          bulk          = 15.0
        }
      },
      {
        priority_number     = 2
        bandwidth_allocation = 30.0
        bandwidth_split_per_type = {
          rt_audio      = 10.0
          rt_video      = 25.0
          transactional = 45.0
          bulk          = 20.0
        }
      },
      {
        priority_number     = 3
        bandwidth_allocation = 20.0
        bandwidth_split_per_type = {
          rt_audio      = 5.0
          rt_video      = 20.0
          transactional = 40.0
          bulk          = 35.0
        }
      },
      {
        priority_number     = 4
        bandwidth_allocation = 5.0
        bandwidth_split_per_type = {
          rt_audio      = 0.0
          rt_video      = 5.0
          transactional = 25.0
          bulk          = 70.0
        }
      }
    ]
  },
  {
    bandwidth_range = {
      low  = 50.0
      high = 200.0
    }
    business_priorities = [
      {
        priority_number     = 1
        bandwidth_allocation = 40.0
        bandwidth_split_per_type = {
          rt_audio      = 12.0
          rt_video      = 38.0
          transactional = 35.0
          bulk          = 15.0
        }
      },
      {
        priority_number     = 2
        bandwidth_allocation = 35.0
        bandwidth_split_per_type = {
          rt_audio      = 8.0
          rt_video      = 27.0
          transactional = 45.0
          bulk          = 20.0
        }
      },
      {
        priority_number     = 3
        bandwidth_allocation = 20.0
        bandwidth_split_per_type = {
          rt_audio      = 5.0
          rt_video      = 20.0
          transactional = 40.0
          bulk          = 35.0
        }
      },
      {
        priority_number     = 4
        bandwidth_allocation = 5.0
        bandwidth_split_per_type = {
          rt_audio      = 0.0
          rt_video      = 5.0
          transactional = 25.0
          bulk          = 70.0
        }
      }
    ]
  }
]

# Default Rule DSCP Mappings
default_rule_dscp_mappings = [
  {
    transfer_type   = "RT_AUDIO"
    priority_number = 1
    dscp           = [46, 34]
  },
  {
    transfer_type   = "RT_VIDEO"
    priority_number = 1
    dscp           = [38, 36, 32]
  },
  {
    transfer_type   = "TRANSACTIONAL"
    priority_number = 2
    dscp           = [26, 18, 20]
  },
  {
    transfer_type   = "BULK"
    priority_number = 4
    dscp           = [10, 8, 0]
  }
]