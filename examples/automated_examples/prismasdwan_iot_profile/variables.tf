# IoT Profile Basic Properties (Required)
variable "iot_profile_name" {
  description = "Name of the IoT profile (max 128 characters)"
  type        = string
  default     = "Enterprise-IoT-Profile"
  
  validation {
    condition     = length(var.iot_profile_name) > 0 && length(var.iot_profile_name) <= 128
    error_message = "IoT profile name must be between 1 and 128 characters."
  }
}

variable "snmp_version" {
  description = "SNMP version for IoT device discovery"
  type        = string
  default     = "v2"
  
  validation {
    condition     = contains(["v2", "v3"], var.snmp_version)
    error_message = "SNMP version must be either v2 or v3."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the IoT profile (max 256 characters)"
  type        = string
  default     = "Enterprise IoT profile for device discovery and management"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the IoT profile (max 10 tags, max 128 chars each, no commas or whitespace)"
  type        = list(string)
  default     = ["terraform", "iot", "device-discovery", "enterprise"]
  
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

# SNMP Discovery Settings
variable "snmp_discovery_enabled" {
  description = "Enable SNMP discovery"
  type        = bool
  default     = true
}

variable "snmp_discovery_device_refresh_frequency" {
  description = "Device refresh frequency in minutes (minimum 30 minutes)"
  type        = number
  default     = 60
  
  validation {
    condition     = var.snmp_discovery_device_refresh_frequency >= 30
    error_message = "Device refresh frequency must be 30 minutes or more."
  }
}

variable "snmp_discovery_network_refresh_frequency" {
  description = "Network refresh frequency in minutes"
  type        = number
  default     = 120
}

variable "snmp_discovery_use_local_neighbours" {
  description = "Use local neighbours for discovery"
  type        = bool
  default     = true
}

# SNMP v2 Configuration (conditional)
variable "snmp_community_string" {
  description = "SNMP community string for v2 (max 32 characters, no whitespace)"
  type        = string
  default     = "public"
  
  validation {
    condition     = var.snmp_community_string == null || (length(var.snmp_community_string) <= 32 && can(regex("^\\S+$", var.snmp_community_string)))
    error_message = "SNMP community string must not exceed 32 characters and cannot contain whitespace."
  }
}

# SNMP v3 Configuration (conditional)
variable "snmp_username" {
  description = "SNMP username for v3 (4-256 characters, no whitespace)"
  type        = string
  default     = "snmpuser"
  
  validation {
    condition     = var.snmp_username == null || (length(var.snmp_username) >= 4 && length(var.snmp_username) <= 256 && can(regex("^\\S+$", var.snmp_username)))
    error_message = "SNMP username must be between 4 and 256 characters and cannot contain whitespace."
  }
}

variable "snmp_security_level" {
  description = "SNMP security level for v3"
  type        = string
  default     = "AUTH"
  
  validation {
    condition     = contains(["NOAUTH", "AUTH", "PRIVATE"], var.snmp_security_level)
    error_message = "SNMP security level must be one of: NOAUTH, AUTH, PRIVATE."
  }
}

variable "snmp_auth_protocol" {
  description = "SNMP authentication protocol for v3"
  type        = string
  default     = "SHA"
  
  validation {
    condition     = contains(["NONE", "MD5", "SHA"], var.snmp_auth_protocol)
    error_message = "SNMP auth protocol must be one of: NONE, MD5, SHA."
  }
}

variable "snmp_auth_password" {
  description = "SNMP authentication password for v3 (5-256 characters, no whitespace)"
  type        = string
  default     = "authpassword123"
  sensitive   = true
  
  validation {
    condition     = var.snmp_auth_password == null || (length(var.snmp_auth_password) >= 5 && length(var.snmp_auth_password) <= 256 && can(regex("^\\S+$", var.snmp_auth_password)))
    error_message = "SNMP auth password must be between 5 and 256 characters and cannot contain whitespace."
  }
}

variable "snmp_privacy_protocol" {
  description = "SNMP privacy protocol for v3"
  type        = string
  default     = "AES"
  
  validation {
    condition     = contains(["NONE", "AES", "DES"], var.snmp_privacy_protocol)
    error_message = "SNMP privacy protocol must be one of: NONE, AES, DES."
  }
}

variable "snmp_privacy_password" {
  description = "SNMP privacy password for v3 (5-256 characters, no whitespace)"
  type        = string
  default     = "privacypassword123"
  sensitive   = true
  
  validation {
    condition     = var.snmp_privacy_password == null || (length(var.snmp_privacy_password) >= 5 && length(var.snmp_privacy_password) <= 256 && can(regex("^\\S+$", var.snmp_privacy_password)))
    error_message = "SNMP privacy password must be between 5 and 256 characters and cannot contain whitespace."
  }
}

# Status Settings
variable "disabled" {
  description = "Whether the IoT profile is disabled"
  type        = bool
  default     = false
}

variable "disabled_reason" {
  description = "Reason for disabling the profile (max 5000 characters)"
  type        = string
  default     = null
  
  validation {
    condition     = try(length(var.disabled_reason) <= 5000, true)
    error_message = "Disabled reason must not exceed 5000 characters."
  }
}

variable "inactive" {
  description = "Whether the IoT profile is inactive"
  type        = bool
  default     = false
}

variable "inactive_reason" {
  description = "Reason for making the profile inactive (max 5000 characters)"
  type        = string
  default     = null
  
  validation {
    condition     = try(length(var.inactive_reason) <= 5000, true)
    error_message = "Inactive reason must not exceed 5000 characters."
  }
}