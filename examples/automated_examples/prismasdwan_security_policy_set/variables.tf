# Security Policy Set Basic Properties (Required)
variable "policy_set_name" {
  description = "Name of the security policy set"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.policy_set_name) > 0 && length(var.policy_set_name) <= 128
    error_message = "Security policy set name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the security policy set"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the security policy set (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = ["test", "terraform"]
}

variable "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  type        = bool
  default     = false
}

variable "policyrule_order" {
  description = "Order of policy rules in the policy set"
  type        = list(string)
  default     = []
}

variable "clone_from" {
  description = "Clone from another policy set (policy set ID)"
  type        = string
  default     = null
  
  validation {
    condition = var.clone_from == null || can(regex("^[0-9]+$", var.clone_from))
    error_message = "Clone from must be null or a valid policy set ID (numeric string)."
  }
}