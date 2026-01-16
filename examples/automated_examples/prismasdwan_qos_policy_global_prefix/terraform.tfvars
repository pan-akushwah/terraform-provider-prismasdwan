# QoS Policy Global Prefix Configuration
qos_policy_global_prefix_name = "Enterprise-QoS-Global-Prefix"
description = "Global QoS policy prefix for enterprise-wide priority traffic classification and bandwidth allocation"
tags = ["terraform", "qos", "global-prefix", "priority", "enterprise"]

# IP Prefixes
ipv4_prefixes = [
  "10.0.0.0/8",
  "172.16.0.0/12", 
  "192.168.0.0/16"
]

ipv6_prefixes = [
  "2001:db8::/32",
  "fd00::/8"
]