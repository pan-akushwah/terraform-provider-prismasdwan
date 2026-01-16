# Site Configuration (Required)
variable "site_name" {
  description = "Name of the site where the element application probe will be configured"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

# Element Configuration (Required)
variable "element_name" {
  description = "Name of the element where the application probe will be configured"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Application Probe Configuration (Required)
variable "probe_name" {
  description = "Name of the application probe (required, max 128 characters)"
  type        = string
  default     = "Corporate-App-Probe"
  
  validation {
    condition     = length(var.probe_name) > 0 && length(var.probe_name) <= 128
    error_message = "Probe name is required and must not exceed 128 characters."
  }
}

# Optional Configuration
variable "description" {
  description = "Description for the application probe (max 256 characters)"
  type        = string
  default     = "Application probe for monitoring corporate applications and network performance"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "enable_probe" {
  description = "Enable or disable the application probe"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for the application probe (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "application-probe", "monitoring", "performance"]
  
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

variable "source_interface_name" {
  description = "Name of the source interface for the application probe (optional)"
  type        = string
  default     = null
  
  validation {
    condition     = var.source_interface_name == null || length(var.source_interface_name) > 0
    error_message = "Source interface name must be non-empty if specified."
  }
}