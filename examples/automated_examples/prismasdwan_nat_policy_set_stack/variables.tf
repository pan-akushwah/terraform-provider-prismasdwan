# NAT Policy Set Stack Basic Properties (Required)
variable "nat_policy_set_stack_name" {
  description = "Name of the NAT policy set stack"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.nat_policy_set_stack_name) > 0 && length(var.nat_policy_set_stack_name) <= 128
    error_message = "NAT policy set stack name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the NAT policy set stack (max 256 characters)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the NAT policy set stack (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = null
}

# Policy Set Names (to be resolved to IDs via resource locator)
variable "policyset_names" {
  description = "List of NAT policy set names to include in the stack (1-4 policy sets max)"
  type        = list(string)
  default     = ["Default-NATPolicySet"]
  
  validation {
    condition = length(var.policyset_names) >= 0 && length(var.policyset_names) <= 4
    error_message = "Must specify between 0 and 4 policy sets in the stack."
  }
  
  validation {
    condition = length(var.policyset_names) == length(distinct(var.policyset_names))
    error_message = "Policy set names must be unique within the stack."
  }
  
  validation {
    condition = alltrue([
      for name in var.policyset_names : length(name) > 0 && length(name) <= 128
    ])
    error_message = "Each policy set name must be between 1 and 128 characters."
  }
}

# Stack Properties
variable "default_policysetstack" {
  description = "Whether this is a default policy set stack"
  type        = bool
  default     = false
}