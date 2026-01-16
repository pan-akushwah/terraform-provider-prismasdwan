# NAT Policy Set Stack ID
output "nat_policy_set_stack_id" {
  description = "The ID of the created NAT policy set stack"
  value       = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.id
}

# NAT Policy Set Stack Name
output "nat_policy_set_stack_name" {
  description = "The name of the created NAT policy set stack"
  value       = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.name
}

# Complete NAT Policy Set Stack Details
output "nat_policy_set_stack_details" {
  description = "Complete details of the created NAT policy set stack"
  value = {
    id                     = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.id
    name                   = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.name
    description            = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.description
    tags                   = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.tags
    policyset_ids          = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids
    default_policysetstack = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.default_policysetstack
    x_etag                 = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.x_etag
    x_schema               = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.x_schema
  }
}

# Resource Locator Results
output "resource_locator_results" {
  description = "Results from resource locators"
  value = {
    policy_set_names = var.policyset_names
    policy_set_ids   = [for locator in prismasdwan_resource_locator.policy_sets : locator.result]
    locator_mapping  = {
      for i, name in var.policyset_names : name => prismasdwan_resource_locator.policy_sets[i].result
    }
  }
}

# Basic Information
output "stack_description" {
  description = "Description of the NAT policy set stack"
  value       = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.description
}

output "stack_tags" {
  description = "Tags of the NAT policy set stack"
  value       = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.tags
}

# Policy Set Information
output "policy_set_information" {
  description = "Information about policy sets in the stack"
  value = {
    policy_set_names = var.policyset_names
    policy_set_ids   = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids
    policy_set_count = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids != null ? length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids) : 0
    has_policy_sets  = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids != null && length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids) > 0
    is_default_stack = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.default_policysetstack
  }
}

# Schema and Etag (computed fields)
output "nat_policy_set_stack_schema" {
  description = "Schema version for the NAT policy set stack"
  value       = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.x_schema
}

output "nat_policy_set_stack_etag" {
  description = "Etag for the NAT policy set stack"
  value       = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.x_etag
}

# Configuration Summary
output "configuration_summary" {
  description = "Summary of NAT policy set stack configuration"
  value = {
    stack_name           = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.name
    stack_id             = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.id
    has_description      = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.description != null
    has_tags             = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.tags != null
    policy_set_count     = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids != null ? length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids) : 0
    is_default_stack     = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.default_policysetstack
    resource_type        = "nat_policy_set_stack"
    uses_resource_locator = true
  }
}

# Validation Results (Simplified)
output "validation_results" {
  description = "Validation checks for the NAT policy set stack"
  value = {
    name_valid           = length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.name) > 0 && length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.name) <= 128
    description_valid    = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.description == null ? true : length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.description) <= 256
    tags_count_valid     = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.tags == null ? true : length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.tags) <= 10
    policy_sets_valid    = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids != null ? length(prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.policyset_ids) <= 4 : true
    has_id               = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.id != null
    has_schema           = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.x_schema != null
    has_etag             = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.x_etag != null
    locators_resolved    = length([for locator in prismasdwan_resource_locator.policy_sets : locator.result]) == length(var.policyset_names)
  }
}

# Resource Type Output
output "resource_type" {
  description = "The type of resource created"
  value       = "nat_policy_set_stack"
}

# Deployment Status
output "deployment_status" {
  description = "Status of the NAT policy set stack deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1 + length(var.policyset_names)
    resource_type  = "nat_policy_set_stack"
    status         = "success"
    locators_used  = length(var.policyset_names)
  }
}

# Import Information
output "import_information" {
  description = "Information for importing this resource"
  value = {
    import_command = "terraform import prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main ${prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.id}"
    import_block = {
      to = "prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main"
      id = prismasdwan_nat_policy_set_stack.nat_policy_set_stack_main.id
    }
  }
}