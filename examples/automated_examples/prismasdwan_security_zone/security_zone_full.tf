resource "prismasdwan_security_zone" "security_zone_main" {
  # Required fields
  name = var.zone_name
  
  # Optional fields
  description = var.description
  tcp_allow_non_syn = var.tcp_allow_non_syn
}