# Path Local Prefix ID
output "path_local_prefix_id" {
  description = "The ID of the created path local prefix"
  value       = prismasdwan_path_local_prefix.path_local_prefix_main.id
}

# Path Local Prefix Name
output "path_local_prefix_name" {
  description = "The name of the created path local prefix"
  value       = prismasdwan_path_local_prefix.path_local_prefix_main.name
}

# Complete Path Local Prefix Details
output "path_local_prefix_details" {
  description = "Complete details of the created path local prefix"
  value = {
    id          = prismasdwan_path_local_prefix.path_local_prefix_main.id
    name        = prismasdwan_path_local_prefix.path_local_prefix_main.name
    description = prismasdwan_path_local_prefix.path_local_prefix_main.description
    tags        = prismasdwan_path_local_prefix.path_local_prefix_main.tags
    x_etag      = prismasdwan_path_local_prefix.path_local_prefix_main.x_etag
    x_schema    = prismasdwan_path_local_prefix.path_local_prefix_main.x_schema
  }
}

# Basic Information
output "local_prefix_description" {
  description = "Description of the path local prefix"
  value       = prismasdwan_path_local_prefix.path_local_prefix_main.description
}

output "local_prefix_tags" {
  description = "Tags of the path local prefix"
  value       = prismasdwan_path_local_prefix.path_local_prefix_main.tags
}

# Schema and Etag (computed fields)
output "path_local_prefix_schema" {
  description = "Schema version for the path local prefix"
  value       = prismasdwan_path_local_prefix.path_local_prefix_main.x_schema
}

output "path_local_prefix_etag" {
  description = "Etag for the path local prefix"
  value       = prismasdwan_path_local_prefix.path_local_prefix_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of path local prefix configuration"
  value = {
    prefix_name       = prismasdwan_path_local_prefix.path_local_prefix_main.name
    prefix_id         = prismasdwan_path_local_prefix.path_local_prefix_main.id
    has_description   = prismasdwan_path_local_prefix.path_local_prefix_main.description != null
    has_tags          = prismasdwan_path_local_prefix.path_local_prefix_main.tags != null
    tag_count         = prismasdwan_path_local_prefix.path_local_prefix_main.tags != null ? length(prismasdwan_path_local_prefix.path_local_prefix_main.tags) : 0
    resource_type     = "path_local_prefix"
    api_category      = "networkpolicylocalprefixes"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the path local prefix"
  value = {
    name_valid        = length(prismasdwan_path_local_prefix.path_local_prefix_main.name) > 0 && length(prismasdwan_path_local_prefix.path_local_prefix_main.name) <= 128
    description_valid = prismasdwan_path_local_prefix.path_local_prefix_main.description == null ? true : length(prismasdwan_path_local_prefix.path_local_prefix_main.description) <= 256
    tags_count_valid  = prismasdwan_path_local_prefix.path_local_prefix_main.tags == null ? true : length(prismasdwan_path_local_prefix.path_local_prefix_main.tags) <= 10
    has_id            = prismasdwan_path_local_prefix.path_local_prefix_main.id != null
    has_schema        = prismasdwan_path_local_prefix.path_local_prefix_main.x_schema != null
    has_etag          = prismasdwan_path_local_prefix.path_local_prefix_main.x_etag != null
    id_is_transient   = true
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "path_local_prefix"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the path local prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "path_local_prefix"
    status         = "success"
    api_version    = "v2.0"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags         = length(var.tags)
    tag_list           = var.tags
    has_terraform_tag  = contains(var.tags, "terraform")
    has_path_tag       = contains(var.tags, "path")
    has_routing_tag    = contains(var.tags, "routing")
    max_tag_length     = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit  = length(var.tags) <= 10
    all_tags_valid     = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
  }
}

# Network Policy Information
output "network_policy_information" {
  description = "Network policy related information"
  value = {
    policy_type       = "local_prefix"
    scope            = "local"
    applies_to       = "network_policy"
    routing_context  = "local_prefix_based"
    classification   = "traffic_classification"
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_path_local_prefix.path_local_prefix_main ${prismasdwan_path_local_prefix.path_local_prefix_main.id}"
    import_block = {
      to = "prismasdwan_path_local_prefix.path_local_prefix_main"
      id = prismasdwan_path_local_prefix.path_local_prefix_main.id
    }
  }
}

# API Information
output "api_information" {
  description = "API endpoint information for this resource"
  value = {
    get_api    = "/sdwan/v2.0/api/networkpolicylocalprefixes/{prefix_id}"
    post_api   = "/sdwan/v2.0/api/networkpolicylocalprefixes"
    put_api    = "/sdwan/v2.0/api/networkpolicylocalprefixes/{prefix_id}"
    delete_api = "/sdwan/v2.0/api/networkpolicylocalprefixes/{prefix_id}"
    api_model  = "NetworkPolicyLocalPrefix"
    api_version = "v2.0"
  }
}

# Schema Information
output "schema_information" {
  description = "Schema and structure information"
  value = {
    required_fields = ["name"]
    optional_fields = ["description", "tags"]
    computed_fields = ["id", "_etag", "_schema"]
    id_type        = "transient"
    etag_minimum   = 1
    schema_minimum = 1
    max_tags       = 10
    max_tag_length = 128
    tag_regex      = "^[^,\\\\s]+$"
  }
}

# Usage Examples
output "usage_examples" {
  description = "Usage examples and best practices"
  value = {
    use_cases = [
      "Network policy routing",
      "Traffic classification",
      "Local prefix management",
      "Policy-based routing"
    ]
    best_practices = [
      "Use descriptive names for easy identification",
      "Tag resources for better organization",
      "Keep descriptions under 256 characters",
      "Avoid commas and whitespace in tags"
    ]
    related_resources = [
      "prismasdwan_network_policy",
      "prismasdwan_path_global_prefix",
      "prismasdwan_routing_policy"
    ]
  }
}