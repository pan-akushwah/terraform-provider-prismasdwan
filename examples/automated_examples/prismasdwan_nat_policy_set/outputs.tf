# NAT Policy Set ID
output "nat_policy_set_id" {
  description = "The ID of the created NAT policy set"
  value       = prismasdwan_nat_policy_set.nat_policy_set_main.id
}

# NAT Policy Set Name
output "nat_policy_set_name" {
  description = "The name of the created NAT policy set"
  value       = prismasdwan_nat_policy_set.nat_policy_set_main.name
}

# Complete NAT Policy Set Details
output "nat_policy_set_details" {
  description = "Complete details of the created NAT policy set"
  value = {
    id                                = prismasdwan_nat_policy_set.nat_policy_set_main.id
    name                              = prismasdwan_nat_policy_set.nat_policy_set_main.name
    description                       = prismasdwan_nat_policy_set.nat_policy_set_main.description
    tags                              = prismasdwan_nat_policy_set.nat_policy_set_main.tags
    source_zone_policyrule_order      = prismasdwan_nat_policy_set.nat_policy_set_main.source_zone_policyrule_order
    destination_zone_policyrule_order = prismasdwan_nat_policy_set.nat_policy_set_main.destination_zone_policyrule_order
    clone_from                        = prismasdwan_nat_policy_set.nat_policy_set_main.clone_from
    policy_rules                      = prismasdwan_nat_policy_set.nat_policy_set_main.policy_rules
    x_etag                            = prismasdwan_nat_policy_set.nat_policy_set_main.x_etag
    x_schema                          = prismasdwan_nat_policy_set.nat_policy_set_main.x_schema
  }
}

# Basic Information
output "policy_set_description" {
  description = "Description of the NAT policy set"
  value       = prismasdwan_nat_policy_set.nat_policy_set_main.description
}

output "policy_set_tags" {
  description = "Tags of the NAT policy set"
  value       = prismasdwan_nat_policy_set.nat_policy_set_main.tags
}

# Rule Ordering Information
output "rule_ordering" {
  description = "Policy rule ordering configuration"
  value = {
    source_zone_order      = prismasdwan_nat_policy_set.nat_policy_set_main.source_zone_policyrule_order
    destination_zone_order = prismasdwan_nat_policy_set.nat_policy_set_main.destination_zone_policyrule_order
    has_source_ordering    = prismasdwan_nat_policy_set.nat_policy_set_main.source_zone_policyrule_order != null
    has_destination_ordering = prismasdwan_nat_policy_set.nat_policy_set_main.destination_zone_policyrule_order != null
  }
}

# Schema and Etag (computed fields)
output "nat_policy_set_schema" {
  description = "Schema version for the NAT policy set"
  value       = prismasdwan_nat_policy_set.nat_policy_set_main.x_schema
}

output "nat_policy_set_etag" {
  description = "Etag for the NAT policy set"
  value       = prismasdwan_nat_policy_set.nat_policy_set_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of NAT policy set configuration"
  value = {
    policy_set_name              = prismasdwan_nat_policy_set.nat_policy_set_main.name
    policy_set_id                = prismasdwan_nat_policy_set.nat_policy_set_main.id
    has_description              = prismasdwan_nat_policy_set.nat_policy_set_main.description != null
    has_tags                     = prismasdwan_nat_policy_set.nat_policy_set_main.tags != null ? length(prismasdwan_nat_policy_set.nat_policy_set_main.tags) > 0 : false
    has_policy_rules             = prismasdwan_nat_policy_set.nat_policy_set_main.policy_rules != null
    has_source_ordering          = prismasdwan_nat_policy_set.nat_policy_set_main.source_zone_policyrule_order != null
    has_destination_ordering     = prismasdwan_nat_policy_set.nat_policy_set_main.destination_zone_policyrule_order != null
    is_cloned                    = prismasdwan_nat_policy_set.nat_policy_set_main.clone_from != null
    tag_count                    = prismasdwan_nat_policy_set.nat_policy_set_main.tags != null ? length(prismasdwan_nat_policy_set.nat_policy_set_main.tags) : 0
    rule_count                   = prismasdwan_nat_policy_set.nat_policy_set_main.policy_rules != null ? length(prismasdwan_nat_policy_set.nat_policy_set_main.policy_rules) : 0
    resource_type                = "nat_policy_set"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the NAT policy set"
  value = {
    name_valid                   = length(prismasdwan_nat_policy_set.nat_policy_set_main.name) > 0 && length(prismasdwan_nat_policy_set.nat_policy_set_main.name) <= 128
    description_valid            = prismasdwan_nat_policy_set.nat_policy_set_main.description != null ? length(prismasdwan_nat_policy_set.nat_policy_set_main.description) <= 256 : true
    tags_count_valid             = prismasdwan_nat_policy_set.nat_policy_set_main.tags != null ? length(prismasdwan_nat_policy_set.nat_policy_set_main.tags) <= 10 : true
    has_id                       = prismasdwan_nat_policy_set.nat_policy_set_main.id != null
    has_schema                   = prismasdwan_nat_policy_set.nat_policy_set_main.x_schema != null
    has_etag                     = prismasdwan_nat_policy_set.nat_policy_set_main.x_etag != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "nat_policy_set"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the NAT policy set deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "nat_policy_set"
    status         = "success"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags           = length(var.tags)
    tag_list             = var.tags
    has_terraform_tag    = contains(var.tags, "terraform")
    max_tag_length       = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit    = length(var.tags) <= 10
  }
}
