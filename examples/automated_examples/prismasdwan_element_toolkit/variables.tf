# Site and Element Configuration (Required for resource locators)
variable "site_name" {
  description = "Name of the site where the element is located (used for resource locator)"
  type        = string
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

variable "element_name" {
  description = "Name of the element where the Element Toolkit will be configured (used for resource locator)"
  type        = string
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Element Toolkit Configuration Properties
variable "ssh_outbound_enabled" {
  description = "Enable SSH outbound connections"
  type        = bool
  default     = false
}

variable "ssh_enabled" {
  description = "Enable SSH access to the element"
  type        = bool
  default     = true
}

variable "otpkey_version" {
  description = "OTP key version for authentication"
  type        = number
  default     = 1
  
  validation {
    condition     = var.otpkey_version >= 0
    error_message = "OTP key version must be a non-negative integer."
  }
}

variable "account_disable_interval" {
  description = "Account disable interval in minutes (5-60)"
  type        = number
  default     = 30
  
  validation {
    condition     = var.account_disable_interval >= 5 && var.account_disable_interval <= 60
    error_message = "Account disable interval must be between 5 and 60 minutes."
  }
}

variable "retry_login_count" {
  description = "Number of retry login attempts allowed (5-20)"
  type        = number
  default     = 10
  
  validation {
    condition     = var.retry_login_count >= 5 && var.retry_login_count <= 20
    error_message = "Retry login count must be between 5 and 20."
  }
}

variable "inactive_interval" {
  description = "Inactive session timeout interval in minutes (15-60)"
  type        = number
  default     = 30
  
  validation {
    condition     = var.inactive_interval >= 15 && var.inactive_interval <= 60
    error_message = "Inactive interval must be between 15 and 60 minutes."
  }
}