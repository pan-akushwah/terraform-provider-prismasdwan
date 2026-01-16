# Deployment Status Output
output "deployment_status" {
  description = "Status of the IPFIX template deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "ipfix_template"
    status         = "success"
  }
}

# IPFIX Template ID
output "ipfix_template_id" {
  description = "The ID of the created IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.id
}

# IPFIX Template Name
output "ipfix_template_name" {
  description = "The name of the created IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.name
}

# IPFIX Template Description
output "ipfix_template_description" {
  description = "The description of the IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.description
}

# Flow Fields
output "flow_fields" {
  description = "The flow fields configured in the IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.flow_fields
}

# Options
output "options" {
  description = "The options configured in the IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.options
}

# Generate Biflow
output "generate_biflow" {
  description = "Whether biflow generation is enabled"
  value       = prismasdwan_ipfix_template.template_main.generate_biflow
}

# Template Export Timeout
output "template_export_timeout" {
  description = "Template export timeout in seconds"
  value       = prismasdwan_ipfix_template.template_main.template_export_timeout
}

# Option Export Timeout
output "option_export_timeout" {
  description = "Option export timeout in seconds"
  value       = prismasdwan_ipfix_template.template_main.option_export_timeout
}

# Tags
output "tags" {
  description = "Tags assigned to the IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.tags
}

# Schema and Etag (computed fields)
output "ipfix_template_schema" {
  description = "Schema version for the IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.x_schema
}

output "ipfix_template_etag" {
  description = "Etag for the IPFIX template"
  value       = prismasdwan_ipfix_template.template_main.x_etag
}

# Complete IPFIX Template Details
output "ipfix_template_details" {
  description = "Complete details of the created IPFIX template"
  value = {
    id                       = prismasdwan_ipfix_template.template_main.id
    name                     = prismasdwan_ipfix_template.template_main.name
    description              = prismasdwan_ipfix_template.template_main.description
    tags                     = prismasdwan_ipfix_template.template_main.tags
    flow_fields              = prismasdwan_ipfix_template.template_main.flow_fields
    options                  = prismasdwan_ipfix_template.template_main.options
    generate_biflow          = prismasdwan_ipfix_template.template_main.generate_biflow
    template_export_timeout  = prismasdwan_ipfix_template.template_main.template_export_timeout
    option_export_timeout    = prismasdwan_ipfix_template.template_main.option_export_timeout
    x_etag                   = prismasdwan_ipfix_template.template_main.x_etag
    x_schema                 = prismasdwan_ipfix_template.template_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "ipfix_template"
}

# Flow Fields Count
output "flow_fields_count" {
  description = "Number of flow fields configured"
  value       = length(prismasdwan_ipfix_template.template_main.flow_fields)
}

# Options Count
output "options_count" {
  description = "Number of options configured"
  value       = length(prismasdwan_ipfix_template.template_main.options)
}

# Flow Fields by Category
output "connection_flow_fields" {
  description = "Connection-related flow fields"
  value = [
    for field in prismasdwan_ipfix_template.template_main.flow_fields :
    field if can(regex("^CONNECTION_", field))
  ]
}

output "application_flow_fields" {
  description = "Application-related flow fields"
  value = [
    for field in prismasdwan_ipfix_template.template_main.flow_fields :
    field if can(regex("^(APP_|APPLICATION_)", field))
  ]
}

output "network_flow_fields" {
  description = "Network-related flow fields"
  value = [
    for field in prismasdwan_ipfix_template.template_main.flow_fields :
    field if can(regex("^(SRC_|DST_|PROTOCOL|TIME_)", field))
  ]
}

# Timeout Configuration Summary
output "timeout_configuration" {
  description = "Summary of timeout configurations"
  value = {
    template_export_timeout = prismasdwan_ipfix_template.template_main.template_export_timeout
    option_export_timeout   = prismasdwan_ipfix_template.template_main.option_export_timeout
    timeouts_equal         = prismasdwan_ipfix_template.template_main.template_export_timeout == prismasdwan_ipfix_template.template_main.option_export_timeout
  }
}