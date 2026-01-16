# Service Group Basic Properties (Required)
variable "service_group_name" {
  description = "Name of the service group (service label)"
  type        = string
  default     = "Enterprise-Service-Group"
  
  validation {
    condition     = length(var.service_group_name) > 0 && length(var.service_group_name) <= 128
    error_message = "Service group name must be between 1 and 128 characters."
  }
}

variable "service_group_type" {
  description = "Type of the service group"
  type        = string
  default     = "CG_TRANSIT"
  
  validation {
    condition     = contains(["cg-transit", "non-cg-transit", "sase"], var.service_group_type)
    error_message = "Service group type must be one of: CG_TRANSIT, NON_CG_TRANSIT, SASE."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the service group (max 256 characters)"
  type        = string
  default     = "Enterprise service group for network service classification and management"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the service group (max 10 tags, max 128 chars each, no commas or whitespace)"
  type        = list(string)
  default     = ["terraform", "service-group", "enterprise", "network"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
}

# SASE Properties (optional)
variable "active_sase_label" {
  description = "Whether this is an active SASE label (only applicable for SASE type)"
  type        = bool
  default     = null
}