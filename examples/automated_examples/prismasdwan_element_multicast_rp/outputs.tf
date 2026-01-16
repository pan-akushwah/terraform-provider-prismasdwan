# Basic Multicast RP Information
output "multicast_rp_id" {
  description = "The ID of the multicast RP configuration"
  value       = prismasdwan_element_multicast_rp.element_multicast_rp_full.id
}

output "site_id" {
  description = "The site ID where the multicast RP is configured"
  value       = prismasdwan_resource_locator.site.result
}

output "element_id" {
  description = "The element ID where the multicast RP is configured"
  value       = prismasdwan_resource_locator.element.result
}

output "rp_name" {
  description = "The name of the multicast RP"
  value       = prismasdwan_element_multicast_rp.element_multicast_rp_full.name
}

output "rp_ipv4_address" {
  description = "The IPv4 address of the multicast RP"
  value       = prismasdwan_element_multicast_rp.element_multicast_rp_full.ipv4_address
}

# Detailed Multicast RP Information
output "multicast_rp_details" {
  description = "Detailed information about the multicast RP configuration"
  value = {
    id           = prismasdwan_element_multicast_rp.element_multicast_rp_full.id
    site_id      = prismasdwan_resource_locator.site.result
    element_id   = prismasdwan_resource_locator.element.result
    name         = prismasdwan_element_multicast_rp.element_multicast_rp_full.name
    ipv4_address = prismasdwan_element_multicast_rp.element_multicast_rp_full.ipv4_address
    groups       = prismasdwan_element_multicast_rp.element_multicast_rp_full.groups
    description  = prismasdwan_element_multicast_rp.element_multicast_rp_full.description
    tags         = prismasdwan_element_multicast_rp.element_multicast_rp_full.tags
    x_etag       = prismasdwan_element_multicast_rp.element_multicast_rp_full.x_etag
    x_schema     = prismasdwan_element_multicast_rp.element_multicast_rp_full.x_schema
    created_at   = timestamp()
  }
}

# Multicast RP Configuration Summary
output "multicast_rp_summary" {
  description = "Summary of multicast RP configuration"
  value = {
    site_name           = var.site_name
    element_name        = var.element_name
    rp_name            = prismasdwan_element_multicast_rp.element_multicast_rp_full.name
    rp_address         = prismasdwan_element_multicast_rp.element_multicast_rp_full.ipv4_address
    groups_count       = length(prismasdwan_element_multicast_rp.element_multicast_rp_full.groups)
    has_description    = prismasdwan_element_multicast_rp.element_multicast_rp_full.description != null
    has_tags          = prismasdwan_element_multicast_rp.element_multicast_rp_full.tags != null
    tags_count        = length(prismasdwan_element_multicast_rp.element_multicast_rp_full.tags != null ? prismasdwan_element_multicast_rp.element_multicast_rp_full.tags : [])
    resource_type     = "element_multicast_rp"
    api_version       = "v2.0"
  }
}

# Multicast Groups Information
output "multicast_groups_info" {
  description = "Information about configured multicast groups"
  value = {
    total_groups = length(prismasdwan_element_multicast_rp.element_multicast_rp_full.groups)
    groups_list  = prismasdwan_element_multicast_rp.element_multicast_rp_full.groups
    group_names  = [for group in prismasdwan_element_multicast_rp.element_multicast_rp_full.groups : group.name]
    group_prefixes = [for group in prismasdwan_element_multicast_rp.element_multicast_rp_full.groups : group.ipv4_prefix]
  }
}

# Multicast Groups Analysis
output "multicast_groups_analysis" {
  description = "Analysis of multicast group configurations"
  value = {
    groups_by_network = {
      for group in prismasdwan_element_multicast_rp.element_multicast_rp_full.groups : group.name => {
        network     = split("/", group.ipv4_prefix)[0]
        subnet_mask = split("/", group.ipv4_prefix)[1]
        is_class_d  = tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 224 && tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 239
        address_range = group.ipv4_prefix
      }
    }
    network_ranges = [
      for group in prismasdwan_element_multicast_rp.element_multicast_rp_full.groups : {
        name = group.name
        first_octet = tonumber(split(".", split("/", group.ipv4_prefix)[0])[0])
        is_local_network = tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) == 224
        is_internetwork = tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 225 && tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 231
        is_adsm = tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 232 && tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 238
      }
    ]
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used"
  value = {
    site_resolved    = prismasdwan_resource_locator.site.result
    element_resolved = prismasdwan_resource_locator.element.result
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the multicast RP deployment"
  value = {
    deployed_at      = timestamp()
    resource_count   = 1
    resource_type    = "element_multicast_rp"
    status           = "success"
    site_resolved    = prismasdwan_resource_locator.site.result != null
    element_resolved = prismasdwan_resource_locator.element.result != null
    api_version      = "v2.0"
    api_model        = "MulticastRPConfigScreen"
  }
}

# Schema and Etag (computed fields)
output "multicast_rp_schema" {
  description = "Schema version for the multicast RP"
  value       = prismasdwan_element_multicast_rp.element_multicast_rp_full.x_schema
}

output "multicast_rp_etag" {
  description = "Etag for the multicast RP"
  value       = prismasdwan_element_multicast_rp.element_multicast_rp_full.x_etag
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "element_multicast_rp"
}

# Input Configuration Echo
output "input_configuration" {
  description = "Echo of input configuration for verification"
  value = {
    site_name         = var.site_name
    element_name      = var.element_name
    rp_name          = var.rp_name
    ipv4_address     = var.ipv4_address
    multicast_groups = var.multicast_groups
    description      = var.description
    tags             = var.tags
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    site_association_valid    = prismasdwan_resource_locator.site.result != null
    element_association_valid = prismasdwan_resource_locator.element.result != null
    rp_name_valid            = length(var.rp_name) > 0
    ipv4_address_valid       = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.ipv4_address))
    groups_count_valid       = length(var.multicast_groups) > 0 && length(var.multicast_groups) <= 1024
    all_groups_multicast     = alltrue([
      for group in var.multicast_groups : 
      tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 224 && 
      tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 239
    ])
      all_validations_passed = (
        prismasdwan_resource_locator.site.result != null && 
        prismasdwan_resource_locator.element.result != null &&
        length(var.rp_name) > 0
      )
  }
}

# RP Address Analysis
output "rp_address_analysis" {
  description = "Analysis of the RP IPv4 address"
  value = {
    address = var.ipv4_address
    octets = split(".", var.ipv4_address)
    is_private = contains([
      "10.", "172.16.", "172.17.", "172.18.", "172.19.", "172.20.", "172.21.", "172.22.", "172.23.",
      "172.24.", "172.25.", "172.26.", "172.27.", "172.28.", "172.29.", "172.30.", "172.31.", "192.168."
    ], substr(var.ipv4_address, 0, min(length(var.ipv4_address), 8)))
    is_loopback = startswith(var.ipv4_address, "127.")
    is_link_local = startswith(var.ipv4_address, "169.254.")
    is_multicast = tonumber(split(".", var.ipv4_address)[0]) >= 224 && tonumber(split(".", var.ipv4_address)[0]) <= 239
  }
}

# Multicast Group Statistics
output "multicast_group_statistics" {
  description = "Statistics about multicast groups"
  value = {
    total_groups = length(var.multicast_groups)
    unique_names = length(distinct([for group in var.multicast_groups : group.name]))
    unique_prefixes = length(distinct([for group in var.multicast_groups : group.ipv4_prefix]))
    group_types = {
      local_network = length([
        for group in var.multicast_groups : group 
        if tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) == 224
      ])
      internetwork = length([
        for group in var.multicast_groups : group 
        if tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 225 && 
           tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 231
      ])
      administratively_scoped = length([
        for group in var.multicast_groups : group 
        if tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 232 && 
           tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 238
      ])
    }
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_element_multicast_rp.element_multicast_rp_full.tags
    tags_count      = length(prismasdwan_element_multicast_rp.element_multicast_rp_full.tags != null ? prismasdwan_element_multicast_rp.element_multicast_rp_full.tags : [])
    has_tags        = prismasdwan_element_multicast_rp.element_multicast_rp_full.tags != null && length(prismasdwan_element_multicast_rp.element_multicast_rp_full.tags) > 0
  }
}