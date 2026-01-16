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
  description = "Name of the element where the SNMP trap will be configured"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# SNMP Trap Basic Configuration (Required)
variable "snmp_version" {
  description = "SNMP version for trap configuration (v2 or v3)"
  type        = string
  default     = "v2"
  
  validation {
    condition     = contains(["v2", "v3"], var.snmp_version)
    error_message = "SNMP version must be either 'v2' or 'v3'."
  }
}

variable "server_ip" {
  description = "IP address of the SNMP trap server"
  type        = string
  default     = "192.168.1.100"
  
  validation {
    condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.server_ip))
    error_message = "Server IP must be a valid IPv4 address."
  }
}

# Optional Configuration
variable "description" {
  description = "Description for the SNMP trap configuration"
  type        = string
  default     = "SNMP trap configured via Terraform"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the SNMP trap configuration"
  type        = list(string)
  default     = ["terraform", "snmp", "trap"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = var.tags == null || alltrue([
      for tag in var.tags : length(tag) <= 128 && length(tag) > 0 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must be between 1 and 128 characters and cannot contain commas or whitespace."
  }
}

variable "enabled" {
  description = "Enable or disable the SNMP trap"
  type        = bool
  default     = true
}

variable "source_interface" {
  description = "Source interface for SNMP trap packets"
  type        = string
  default     = null
}

# SNMPv2 Configuration
variable "v2_community" {
  description = "SNMPv2 community string for trap authentication"
  type        = string
  default     = "public"
  sensitive   = true
  
  validation {
    condition     = var.v2_community == null || length(var.v2_community) > 0
    error_message = "Community string cannot be empty if specified."
  }
}

# SNMPv3 Configuration
variable "v3_user_name" {
  description = "SNMPv3 username for trap authentication"
  type        = string
  default     = "snmpuser"
  
  validation {
    condition     = var.v3_user_name == null || length(var.v3_user_name) > 0
    error_message = "Username cannot be empty if specified."
  }
}

variable "v3_engine_id" {
  description = "SNMPv3 engine ID"
  type        = string
  default     = null
}

variable "v3_security_level" {
  description = "SNMPv3 security level (NOAUTH, AUTH, or PRIVATE)"
  type        = string
  default     = "NOAUTH"
  
  validation {
    condition     = contains(["NOAUTH", "AUTH", "PRIVATE"], var.v3_security_level)
    error_message = "Security level must be NOAUTH, AUTH, or PRIVATE."
  }
}

variable "v3_auth_type" {
  description = "SNMPv3 authentication type (NONE, MD5, or SHA)"
  type        = string
  default     = "NONE"
  
  validation {
    condition     = contains(["NONE", "MD5", "SHA"], var.v3_auth_type)
    error_message = "Auth type must be NONE, MD5, or SHA."
  }
}

variable "v3_auth_phrase" {
  description = "SNMPv3 authentication passphrase"
  type        = string
  default     = null
  sensitive   = true
}

variable "v3_enc_type" {
  description = "SNMPv3 encryption type (NONE, AES, or DES)"
  type        = string
  default     = "NONE"
  
  validation {
    condition     = contains(["NONE", "AES", "DES"], var.v3_enc_type)
    error_message = "Encryption type must be NONE, AES, or DES."
  }
}

variable "v3_enc_phrase" {
  description = "SNMPv3 encryption passphrase"
  type        = string
  default     = null
  sensitive   = true
}