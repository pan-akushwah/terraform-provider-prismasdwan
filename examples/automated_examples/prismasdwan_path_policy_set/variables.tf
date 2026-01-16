# Path Policy Set Basic Properties (Required)
variable "policy_set_name" {
  description = "Name of the path policy set"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.policy_set_name) > 0 && length(var.policy_set_name) <= 128
    error_message = "Path policy set name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the path policy set"
  type        = string
  default     = "This is managed by terraform"
}

variable "tags" {
  description = "Tags for the path policy set (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = null
}

variable "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  type        = bool
  default     = false
}

variable "clone_from" {
  description = "Policy set ID to clone from (max 20 digits)"
  type        = string
  default     = null
}