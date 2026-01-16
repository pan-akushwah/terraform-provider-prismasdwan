# APN Profile Basic Properties (Required)
variable "apn_profile_name" {
  description = "Name of the APN profile"
  type        = string
  default     = "Default-APN-Profile"
  
  validation {
    condition     = length(var.apn_profile_name) > 0 && length(var.apn_profile_name) <= 128
    error_message = "APN profile name must be between 1 and 128 characters."
  }
}

variable "authentication" {
  description = "Authentication method for the APN profile"
  type        = string
  default     = "pap_or_chap"
  
  validation {
    condition     = contains(["none", "pap", "chap", "pap_or_chap"], var.authentication)
    error_message = "Authentication must be one of: none, pap, chap, pap_or_chap."
  }
}

# Optional APN Configuration
variable "apn" {
  description = "Access Point Name (APN) for cellular network connectivity"
  type        = string
  default     = "default.apn.network"
  
  validation {
    condition     = length(var.apn) <= 100
    error_message = "APN name must not exceed 100 characters and must be valid format."
  }
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]+$", var.apn))
    error_message = "APN must contain only alphanumeric characters, hyphens, and periods."
  }
}

# Authentication Credentials
variable "user_name" {
  description = "Username for APN authentication"
  type        = string
  default     = "default_user"
  
  validation {
    condition     = length(var.user_name) <= 100
    error_message = "Username must not exceed 100 characters."
  }
}

variable "password" {
  description = "Password for APN authentication (sensitive)"
  type        = string
  default     = "DefaultPassword123!"
  sensitive   = true
}

variable "clear_password" {
  description = "Whether to store password in clear text"
  type        = bool
  default     = false
}

# Optional Properties
variable "description" {
  description = "Description for the APN profile"
  type        = string
  default     = "APN profile for cellular network connectivity and authentication"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the APN profile (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "apn-profile", "cellular", "authentication"]
  
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