# Policy Set Configuration
policy_set_name = "Default QoS Simple Stack Policy Set (Simple)"

# QoS Policy Rule Configuration
qos_policy_rule_name = "CriticalTerraformRule"
priority_number = 1
description = "QoS policy rule for critical business applications requiring high priority treatment and guaranteed bandwidth allocation"
tags = ["terraform", "qos", "critical", "business-apps", "high-priority", "production"]

# Rule Properties
enabled = true
order_number = 50

# Traffic Classification
app_def_names = [
  "Wbem",
  "SFDC"
]

source_prefixes_name = "EnterpriseGlobalPrefix"
destination_prefixes_name = "EnterpriseGlobalPrefix"
network_context_name = "aaa"

# Device Filtering
src_device_names = [
]

dest_device_names = [
]

# User/Group Filtering
user_ids = []
user_group_ids = []

# DSCP Configuration
dscp_value = 46