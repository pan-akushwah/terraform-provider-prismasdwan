# NAT Policy Set Configuration
nat_policy_set_name = "Default-NATPolicySet"

# NAT Policy Rule Configuration
nat_policy_rule_name = "OutboundSourceNATRule"
description = "Production NAT policy rule for outbound traffic source NAT from LAN to WAN with dynamic IP allocation"
tags = ["terraform", "nat", "enterprise", "outbound", "source-nat", "production"]

# Rule Properties
enabled = true
disabled = false
disabled_reason = "Just disabled"
inactive = false
inactive_reason = "just inactivated"

# NAT Actions Configuration
nat_actions = [
  {
    type = "no_nat"
    nat_pool_id = null  # Will be resolved from nat_pool_names
    port = null
    protocols = null
  }
]

# Traffic Classification
protocol = 6  # TCP protocol
source_ports = [
  {
    from = 1024
    to = 65535
  }
]
destination_ports = [
  {
    from = 80
    to = 80
  },
  {
    from = 443
    to = 443
  },
  {
    from = 53
    to = 53
  }
]

# Zone Configuration
source_zone_name = "internet"
destination_zone_name = null

# Prefix Configuration
source_prefixes_name = "EnterpriseGlobalPrefix"
destination_prefixes_name = "sprefix"

# NAT Pool Configuration
nat_pool_names = [
  "test1"
]