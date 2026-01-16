resource "prismasdwan_qos_policy_global_prefix" "qos_policy_global_prefix_main" {
  # Required fields
  name = var.qos_policy_global_prefix_name
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # IP Prefixes
  ipv4_prefixes = var.ipv4_prefixes
  ipv6_prefixes = var.ipv6_prefixes
}