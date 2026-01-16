# Path Policy Rule Configuration
rule_name = "TerraformTest1"
policy_set_name = "New Stack Policy Set (Simple)"
description = "This is Managed by tf"
tags = null
network_context_id = null
source_prefixes_id = null
destination_prefixes_id = null
app_def_ids = null

# Paths Allowed Configuration
paths_allowed = {
  active_paths = [
    {
      label     = "public-*"
      path_type = "direct"
    }
  ]
  backup_paths     = null
  l3_failure_paths = null
}

service_context = null
order_number = 1024
enabled = true
user_or_group = null
src_device_ids = null
dest_device_ids = null
best_path_config = null