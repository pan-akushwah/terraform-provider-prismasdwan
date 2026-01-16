# Site and Element Configuration (Required)
variable "site_name" {
  description = "Name of the site where the element is located"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

variable "element_name" {
  description = "Name of the element where the SNMP agent will be configured"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# SNMP Agent System Configuration (Required)
variable "system_location" {
  description = "System location for SNMP agent"
  type        = string
  default     = "Branch Office - Building A, Floor 2"
  
  validation {
    condition     = length(var.system_location) > 0
    error_message = "System location is required."
  }
}

variable "system_contact" {
  description = "System contact for SNMP agent"
  type        = string
  default     = "Network Admin <admin@company.com>"
  
  validation {
    condition     = length(var.system_contact) > 0
    error_message = "System contact is required."
  }
}

# Optional Configuration
variable "description" {
  description = "Description for the SNMP agent configuration"
  type        = string
  default     = "SNMP agent configured via Terraform"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the SNMP agent configuration"
  type        = list(string)
  default     = ["terraform", "snmp", "monitoring"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = var.tags == null || alltrue([
      for tag in var.tags : length(tag) <= 128 && length(tag) > 0
    ])
    error_message = "Each tag must be between 1 and 128 characters."
  }
}

# SNMPv2 Configuration
variable "v2_enabled" {
  description = "Enable SNMPv2 configuration"
  type        = bool
  default     = true
}

variable "v2_community" {
  description = "SNMPv2 community string"
  type        = string
  default     = "public"
  sensitive   = true
  
  validation {
    condition     = var.v2_community == null || length(var.v2_community) > 0
    error_message = "Community string cannot be empty if v2 is enabled."
  }
}

# SNMPv3 Configuration
variable "v3_enabled" {
  description = "Enable SNMPv3 configuration"
  type        = bool
  default     = false
}

variable "v3_users" {
  description = "SNMPv3 users configuration"
  type = list(object({
    user_name = string
    engine_id = optional(string)
    security_level = string
    auth_type = optional(string, "NONE")
    auth_phrase = optional(string)
    enc_type = optional(string, "NONE")
    enc_phrase = optional(string)
  }))
  default = []
  
  validation {
    condition = alltrue([
      for user in var.v3_users : contains(["NOAUTH", "AUTH", "PRIVATE"], user.security_level)
    ])
    error_message = "Security level must be NOAUTH, AUTH, or PRIVATE."
  }
  
  validation {
    condition = alltrue([
      for user in var.v3_users : user.auth_type == null || contains(["NONE", "MD5", "SHA"], user.auth_type)
    ])
    error_message = "Auth type must be NONE, MD5, or SHA."
  }
  
  validation {
    condition = alltrue([
      for user in var.v3_users : user.enc_type == null || contains(["NONE", "AES", "DES"], user.enc_type)
    ])
    error_message = "Encryption type must be NONE, AES, or DES."
  }
}