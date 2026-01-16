# Site Configuration
site_name = "TerraformSiteHub"
element_cluster_role = "HUB"
admin_state = "disabled"
description = "Production enterprise branch site with comprehensive SDWAN connectivity, security services, and application acceleration"
tags = ["terraform", "production", "branch", "sdwan", "enterprise", "spoke"]

# Site Features
app_acceleration_enabled = false
prefer_lan_default_over_wan_default_route = false
branch_gateway = false

# Policy Set Stack Assignments
security_policysetstack_name = null
network_policysetstack_name = null
nat_policysetstack_name = null
priority_policysetstack_name = null
perfmgmt_policysetstack_name = null

# Service Configurations
vrf_context_profile_name = "Global Profile"
multicast_peer_group_name = null
service_binding_name = null

# Extended Tags
extended_tags = [
  {
    key = "Environment"
    value = "Production"
    value_type = "string"
  },
  {
    key = "Department"
    value = "IT"
    value_type = "string"
  },
  {
    key = "CostCenter"
    value = "12345"
    value_type = "number"
  },
  {
    key = "Compliance"
    value = "SOX"
    value_type = "string"
  }
]

# SGI Configuration
sgi_config = null

# Location Information
location = {
  description = "San Francisco Enterprise Branch Office"
  latitude = 37.7749
  longitude = -122.4194
}

# Physical Address
address = {
  street = "456 Enterprise Boulevard"
  street2 = "Suite 200"
  city = "San Francisco"
  state = "California"
  post_code = "94105"
  country = "United States"
}