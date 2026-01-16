# Deployment Status Output
output "deployment_status" {
  description = "Status of the NTP template deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "ntp_template"
    status         = "success"
  }
}

# NTP Template ID
output "ntp_template_id" {
  description = "The ID of the created NTP template"
  value       = prismasdwan_ntp_template.template_main.id
}

# NTP Template Name
output "ntp_template_name" {
  description = "The name of the created NTP template"
  value       = prismasdwan_ntp_template.template_main.name
}

# NTP Template Description
output "ntp_template_description" {
  description = "The description of the NTP template"
  value       = prismasdwan_ntp_template.template_main.description
}

# NTP Servers
output "ntp_servers" {
  description = "The NTP servers configured in the template"
  value       = prismasdwan_ntp_template.template_main.ntp_servers
}

# Tags
output "tags" {
  description = "Tags assigned to the NTP template"
  value       = prismasdwan_ntp_template.template_main.tags
}

# Default Template Flag
output "default_template" {
  description = "Whether this is a default NTP template"
  value       = prismasdwan_ntp_template.template_main.default_template
}

# Schema and Etag (computed fields)
output "ntp_template_schema" {
  description = "Schema version for the NTP template"
  value       = prismasdwan_ntp_template.template_main.x_schema
}

output "ntp_template_etag" {
  description = "Etag for the NTP template"
  value       = prismasdwan_ntp_template.template_main.x_etag
}

# Complete NTP Template Details
output "ntp_template_details" {
  description = "Complete details of the created NTP template"
  value = {
    id               = prismasdwan_ntp_template.template_main.id
    name             = prismasdwan_ntp_template.template_main.name
    description      = prismasdwan_ntp_template.template_main.description
    tags             = prismasdwan_ntp_template.template_main.tags
    ntp_servers      = prismasdwan_ntp_template.template_main.ntp_servers
    default_template = prismasdwan_ntp_template.template_main.default_template
    x_etag           = prismasdwan_ntp_template.template_main.x_etag
    x_schema         = prismasdwan_ntp_template.template_main.x_schema
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource"
  value       = "ntp_template"
}

# NTP Servers Count
output "ntp_servers_count" {
  description = "Number of NTP servers configured"
  value       = length(prismasdwan_ntp_template.template_main.ntp_servers)
}

# Tags Count
output "tags_count" {
  description = "Number of tags assigned"
  value       = length(prismasdwan_ntp_template.template_main.tags)
}

# NTP Servers Analysis
output "ntp_servers_analysis" {
  description = "Analysis of configured NTP servers"
  value = {
    total_servers = length(prismasdwan_ntp_template.template_main.ntp_servers)
    versions_used = distinct([
      for server in prismasdwan_ntp_template.template_main.ntp_servers : server.version
    ])
    hosts_configured = [
      for server in prismasdwan_ntp_template.template_main.ntp_servers : server.host
    ]
    poll_ranges = [
      for server in prismasdwan_ntp_template.template_main.ntp_servers : 
      "${server.min_poll}-${server.max_poll}"
    ]
  }
}

# Resource Metadata
output "resource_metadata" {
  description = "Resource metadata"
  value = {
    has_description    = length(prismasdwan_ntp_template.template_main.description) > 0
    has_tags          = length(prismasdwan_ntp_template.template_main.tags) > 0
    has_ntp_servers   = length(prismasdwan_ntp_template.template_main.ntp_servers) > 0
    is_default        = prismasdwan_ntp_template.template_main.default_template
    name_length       = length(prismasdwan_ntp_template.template_main.name)
    servers_in_range  = length(prismasdwan_ntp_template.template_main.ntp_servers) >= 1 && length(prismasdwan_ntp_template.template_main.ntp_servers) <= 10
  }
}