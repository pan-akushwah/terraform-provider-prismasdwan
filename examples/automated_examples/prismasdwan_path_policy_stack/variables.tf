# Path Policy Stack Basic Properties (Required)
variable "policy_stack_name" {
  description = "Name of the path policy stack"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.policy_stack_name) > 0 && length(var.policy_stack_name) <= 128
    error_message = "Path policy stack name must be between 1 and 128 characters."
  }
}

variable "defaultrule_policyset_name" {
  description = "Name of the default rule policy set (required)"
  type        = string
  default     = "Default-Path-Policy-Set"
  
  validation {
    condition     = length(var.defaultrule_policyset_name) > 0
    error_message = "Default rule policy set name is required."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the path policy stack"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the path policy stack (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = null
}

variable "default_policysetstack" {
  description = "Whether this is a default policy set stack"
  type        = bool
  default     = false
}

# Policy Set Configuration (0-4 policy sets max)
variable "policyset_names" {
  description = "List of path policy set names to include in the stack (0-4 policy sets max)"
  type        = list(string)
  default     = [
    "High-Priority-Path-Policy-Set"
  ]
  
  validation {
    condition     = length(var.policyset_names) >= 0 && length(var.policyset_names) <= 4
    error_message = "Must specify between 0 and 4 policy sets in the stack."
  }
  
  validation {
    condition = alltrue([
      for name in var.policyset_names : length(name) > 0
    ])
    error_message = "All policy set names must be non-empty."
  }
  
  validation {
    condition = length(var.policyset_names) == length(distinct(var.policyset_names))
    error_message = "Policy set names must be unique within the stack."
  }
}