# VRF Context Basic Properties (Required)
variable "context_name" {
  description = "Name of the VRF context"
  type        = string
  default     = "TerraformVRFContext"
  
  validation {
    condition     = can(regex("^[A-Za-z][A-Za-z0-9_\\s-]*$", var.context_name))
    error_message = "VRF context name must start with a letter and contain only letters, numbers, underscores, spaces, and hyphens."
  }
  
  validation {
    condition     = length(var.context_name) > 0 && length(var.context_name) <= 128
    error_message = "VRF context name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the VRF context"
  type        = string
  default     = "VRF context managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the VRF context (max 10 unique tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "vrf", "context"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 1024 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 1024 characters and cannot contain commas or whitespace."
  }
  
  validation {
    condition = length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - no duplicates allowed."
  }
}