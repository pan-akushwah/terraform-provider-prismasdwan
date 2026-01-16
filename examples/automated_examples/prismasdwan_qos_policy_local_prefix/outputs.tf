# QoS Policy Local Prefix ID
output "qos_policy_local_prefix_id" {
  description = "The ID of the created QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.id
}

# QoS Policy Local Prefix Name
output "qos_policy_local_prefix_name" {
  description = "The name of the created QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.name
}

# Complete QoS Policy Local Prefix Details
output "qos_policy_local_prefix_details" {
  description = "Complete details of the created QoS policy local prefix"
  value = {
    id          = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.id
    name        = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.name
    description = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.description
    tags        = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags
    tfid        = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tfid
    x_etag      = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.x_etag
    x_schema    = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.x_schema
  }
}

# Basic Information
output "local_prefix_description" {
  description = "Description of the QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.description
}

output "local_prefix_tags" {
  description = "Tags of the QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags
}

# Schema and Etag (computed fields)
output "qos_policy_local_prefix_schema" {
  description = "Schema version for the QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.x_schema
}

output "qos_policy_local_prefix_etag" {
  description = "Etag for the QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.x_etag
}

output "qos_policy_local_prefix_tfid" {
  description = "Terraform ID for the QoS policy local prefix"
  value       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tfid
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of QoS policy local prefix configuration"
  value = {
    prefix_name       = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.name
    prefix_id         = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.id
    has_description   = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.description != null
    has_tags          = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags != null
    tag_count         = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags != null ? length(prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags) : 0
    resource_type     = "qos_policy_local_prefix"
  }
}

# Validation Results
output "validation_results" {
  description = "Validation checks for the QoS policy local prefix"
  value = {
    name_valid        = length(prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.name) > 0 && length(prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.name) <= 128
    description_valid = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.description == null ? true : length(prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.description) <= 256
    tags_count_valid  = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags == null ? true : length(prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tags) <= 10
    has_id            = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.id != null
    has_tfid          = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.tfid != null
    has_schema        = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.x_schema != null
    has_etag          = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.x_etag != null
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "qos_policy_local_prefix"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the QoS policy local prefix deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "qos_policy_local_prefix"
    status         = "success"
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of the tags configuration"
  value = {
    total_tags        = length(var.tags)
    tag_list          = var.tags
    has_terraform_tag = contains(var.tags, "terraform")
    has_qos_tag       = contains(var.tags, "qos")
    max_tag_length    = length(var.tags) > 0 ? max([for tag in var.tags : length(tag)]...) : 0
    tags_within_limit = length(var.tags) <= 10
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main ${prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.id}"
    import_block = {
      to = "prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main"
      id = prismasdwan_qos_policy_local_prefix.qos_policy_local_prefix_main.id
    }
  }
}

# API Information
output "api_information" {
  description = "API endpoint information for this resource"
  value = {
    get_api    = "/sdwan/v2.0/api/prioritypolicylocalprefixes/{priority_policy_id}"
    post_api   = "/sdwan/v2.0/api/prioritypolicylocalprefixes"
    put_api    = "/sdwan/v2.0/api/prioritypolicylocalprefixes/{priority_policy_id}"
    delete_api = "/sdwan/v2.0/api/prioritypolicylocalprefixes/{priority_policy_id}"
    api_model  = "PriorityPolicyLocalPrefix"
  }
}