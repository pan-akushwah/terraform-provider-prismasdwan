# Element OSPF Global Config Basic Properties (Required)
variable "site_name" {
  description = "Name of the site where the element is located"
  type        = string
  default     = "Branch-Site-Primary"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required."
  }
}

variable "element_name" {
  description = "Name of the element for OSPF configuration"
  type        = string
  default     = "Branch-Element-Primary"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required."
  }
}

# OSPF Configuration Properties
variable "prefix_adv_type_to_lan" {
  description = "Prefix Advertisement Type To LAN"
  type        = string
  default     = "default"
  
  validation {
    condition = contains(["default", "redistribute", "summary", "external"], var.prefix_adv_type_to_lan)
    error_message = "Prefix advertisement type must be one of: default, redistribute, summary, external."
  }
}

variable "retransmit_interval" {
  description = "Retransmit interval in seconds (1-65535)"
  type        = number
  default     = 5
  
  validation {
    condition     = var.retransmit_interval >= 1 && var.retransmit_interval <= 65535
    error_message = "Retransmit interval must be between 1 and 65535 seconds."
  }
}

variable "cost" {
  description = "OSPF cost metric (1-65535)"
  type        = number
  default     = 10
  
  validation {
    condition     = var.cost >= 1 && var.cost <= 65535
    error_message = "Cost must be between 1 and 65535."
  }
}

variable "md5_key_id" {
  description = "MD5 authentication key ID (1-255)"
  type        = number
  default     = null
  
  validation {
    condition     = var.md5_key_id == null || (var.md5_key_id >= 1 && var.md5_key_id <= 255)
    error_message = "MD5 key ID must be between 1 and 255."
  }
}

variable "md5_secret" {
  description = "MD5 authentication secret (1-16 characters)"
  type        = string
  default     = null
  sensitive   = true
  
  validation {
    condition     = var.md5_secret == null || (length(var.md5_secret) >= 1 && length(var.md5_secret) <= 16)
    error_message = "MD5 secret must be between 1 and 16 characters."
  }
}

variable "dead_interval" {
  description = "Dead interval in seconds (1-65535)"
  type        = number
  default     = 40
  
  validation {
    condition     = var.dead_interval >= 1 && var.dead_interval <= 65535
    error_message = "Dead interval must be between 1 and 65535 seconds."
  }
}

variable "hello_interval" {
  description = "Hello interval in seconds (1-65535)"
  type        = number
  default     = 10
  
  validation {
    condition     = var.hello_interval >= 1 && var.hello_interval <= 65535
    error_message = "Hello interval must be between 1 and 65535 seconds."
  }
}

variable "transmit_delay" {
  description = "Transmit delay in seconds (1-65535)"
  type        = number
  default     = 1
  
  validation {
    condition     = var.transmit_delay >= 1 && var.transmit_delay <= 65535
    error_message = "Transmit delay must be between 1 and 65535 seconds."
  }
}

variable "router_id" {
  description = "OSPF Router ID (IPv4 address format)"
  type        = string
  default     = null
  
  validation {
    condition = var.router_id == null || can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.router_id))
    error_message = "Router ID must be a valid IPv4 address format."
  }
}

# Validation for interval relationships
variable "enable_interval_validation" {
  description = "Enable validation that dead_interval is at least 4 times hello_interval"
  type        = bool
  default     = true
}