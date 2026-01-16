# Site Configuration
site_name = "TerraformSite"
element_cluster_role = "SPOKE"
admin_state = "disabled"
description = "Production enterprise branch site with comprehensive SDWAN connectivity, security services, and application acceleration"
tags = ["terraform", "production", "branch", "sdwan", "enterprise", "spoke"]

# Site Features
app_acceleration_enabled = true
prefer_lan_default_over_wan_default_route = false
branch_gateway = false

# Policy Set Stack Assignments
security_policysetstack_name = "ryanzSecPolStack1 (Simple)"
network_policysetstack_name = "Default Path Simple Stack (Simple)"
nat_policysetstack_name = "Default-NATPolicySetStack"
priority_policysetstack_name = "Default QoS Simple Stack (Simple)"
perfmgmt_policysetstack_name = "Default Performance Policy Set Stack (Simple)"

# Service Configurations
vrf_context_profile_name = "Global Profile"
multicast_peer_group_name = null
service_binding_name = "North America"

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
sgi_config = {
  sgi_vendor_id = "SGI_VENDOR_ID_TYPE_8909"
  sgi_tag = 1001
}

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