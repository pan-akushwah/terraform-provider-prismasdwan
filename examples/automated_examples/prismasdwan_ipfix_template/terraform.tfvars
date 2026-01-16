# IPFIX Template Configuration
template_name = "Terraformtesttemplate"
description = "This is managed by Terraform"
tags = ["terraform", "ipfixtemplate"]

# Flow Fields Configuration (required)
flow_fields = [
  "TIME_STAMPS",
  "DST_IPV4_ADDRESS", 
  "DST_PORT",
  "SRC_IPV4_ADDRESS",
  "SRC_PORT", 
  "PROTOCOL",
  "CONNECTION_UNIFLOW_BYTES",
  "CONNECTION_UNIFLOW_PACKETS",
  "DSCP_LAST",
  "APP_DEF_ID",
  "APPLICATION_HOST"
]

# Options Configuration (required)
options = ["APP_DEF_ID_TABLE"]

# Optional Configuration
generate_biflow = false
template_export_timeout = 600
option_export_timeout = 600