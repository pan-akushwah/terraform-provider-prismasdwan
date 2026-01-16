# NAT Policy Set Configuration based on payload
nat_policy_set_name = "TerraformTest1"
description = "This is managed by Terraform"
tags = ["terraform"]

# Policy rule ordering (null as per payload)
source_zone_policyrule_order = null
destination_zone_policyrule_order = null

# Clone configuration (null as per payload)
clone_from = null

# Policy rules (optional - can be managed separately)
policy_rules = null

# Transient fields
update_order = null
send_to_element = null
policy_req_version = null