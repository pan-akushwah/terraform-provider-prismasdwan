# Policy Set Configuration (Required for QoS Policy Rule)
variable "policy_set_name" {
  description = "Name of the QoS policy set where the rule will be created (used for resource locator)"
  type        = string
  default     = "Enterprise-QoS-Policy-Set"
  
  validation {
    condition     = length(var.policy_set_name) > 0
    error_message = "Policy set name is required and cannot be empty."
  }
}

# QoS Policy Rule Basic Properties (Required)
variable "qos_policy_rule_name" {
  description = "Name of the QoS policy rule"
  type        = string
  default     = "Critical-Application-QoS-Rule"
  
  validation {
    condition     = length(var.qos_policy_rule_name) > 0 && length(var.qos_policy_rule_name) <= 128
    error_message = "QoS policy rule name is required and must not exceed 128 characters."
  }
}

variable "priority_number" {
  description = "Priority number for the QoS rule (1-4, where 1 is highest priority)"
  type        = number
  default     = 1
  
  validation {
    condition     = var.priority_number >= 1 && var.priority_number <= 4
    error_message = "Priority number must be between 1 and 4."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the QoS policy rule"
  type        = string
  default     = "QoS policy rule for critical application traffic prioritization"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the QoS policy rule (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "qos", "critical", "rule"]
  
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

variable "enabled" {
  description = "Whether the QoS policy rule is enabled"
  type        = bool
  default     = true
}

variable "order_number" {
  description = "Order number for rule evaluation (1-65535)"
  type        = number
  default     = 100
  
  validation {
    condition     = var.order_number >= 1 && var.order_number <= 65535
    error_message = "Order number must be between 1 and 65535."
  }
}

# Traffic Classification
variable "app_def_names" {
  description = "List of application definition names to match (max 256)"
  type        = list(string)
  default     = ["Microsoft-Office-365", "Zoom", "WebEx"]
  
  validation {
    condition     = length(var.app_def_names) <= 256
    error_message = "Maximum 256 application definitions are allowed."
  }
}

variable "source_prefixes_name" {
  description = "Name of source prefix list to match"
  type        = string
  default     = null
}

variable "destination_prefixes_name" {
  description = "Name of destination prefix list to match"
  type        = string
  default     = null
}

variable "network_context_name" {
  description = "Name of network context to match"
  type        = string
  default     = null
}

# Device Filtering
variable "src_device_names" {
  description = "List of source device names to match (max 256)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.src_device_names) <= 256
    error_message = "Maximum 256 source devices are allowed."
  }
}

variable "dest_device_names" {
  description = "List of destination device names to match (max 10)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.dest_device_names) <= 10
    error_message = "Maximum 10 destination devices are allowed."
  }
}

# User/Group Filtering
variable "user_ids" {
  description = "List of user IDs to match (max 256)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.user_ids) <= 256
    error_message = "Maximum 256 user IDs are allowed."
  }
}

variable "user_group_ids" {
  description = "List of user group IDs to match (max 256)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.user_group_ids) <= 256
    error_message = "Maximum 256 user group IDs are allowed."
  }
}

# DSCP Configuration
variable "dscp_value" {
  description = "DSCP value to set (0-63)"
  type        = number
  default     = null
  
  validation {
    condition     = var.dscp_value == null || (var.dscp_value >= 0 && var.dscp_value <= 63)
    error_message = "DSCP value must be between 0 and 63."
  }
}