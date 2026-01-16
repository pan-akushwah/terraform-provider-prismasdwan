resource "prismasdwan_security_policy_global_prefix" "global_prefix_main" {
  # Required fields
  name = var.prefix_name
  
  # Optional fields
  description    = var.description
  tags          = var.tags
  ipv4_prefixes = var.ipv4_prefixes
  ipv6_prefixes = var.ipv6_prefixes
}