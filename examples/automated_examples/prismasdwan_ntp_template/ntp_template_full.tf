resource "prismasdwan_ntp_template" "template_main" {
  # Required fields
  name        = var.template_name
  ntp_servers = var.ntp_servers
  
  # Optional fields
  description      = var.description
  tags             = var.tags
  default_template = var.default_template
}