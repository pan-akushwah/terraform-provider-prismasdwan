resource "prismasdwan_ipfix_template" "template_main" {
  # Required fields
  name        = var.template_name
  flow_fields = var.flow_fields
  options     = var.options
  
  # Optional fields
  description              = var.description
  tags                     = var.tags
  generate_biflow          = var.generate_biflow
  template_export_timeout  = var.template_export_timeout
  option_export_timeout    = var.option_export_timeout
}