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
  description = "Name of the element where the multicast global config will be configured"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Protocol Enable/Disable Controls
variable "enable_igmp" {
  description = "Enable IGMP protocol parameters configuration"
  type        = bool
  default     = true
}

variable "enable_pim" {
  description = "Enable PIM protocol parameters configuration"
  type        = bool
  default     = true
}

# IGMP Protocol Parameters
variable "igmp_query_max_response_time" {
  description = "IGMP Query Max Response Time in seconds"
  type        = number
  default     = 10
  
  validation {
    condition     = var.igmp_query_max_response_time >= 1 && var.igmp_query_max_response_time <= 25
    error_message = "IGMP Query Max Response Time must be between 1 and 25 seconds."
  }
}

variable "igmp_last_member_query_interval" {
  description = "IGMP Last Member Query Interval in milliseconds"
  type        = number
  default     = 1000
  
  validation {
    condition     = var.igmp_last_member_query_interval >= 100 && var.igmp_last_member_query_interval <= 25500
    error_message = "IGMP Last Member Query Interval must be between 100 and 25500 milliseconds."
  }
}

variable "igmp_last_member_query_count" {
  description = "IGMP Last Member Query Count"
  type        = number
  default     = 2
  
  validation {
    condition     = var.igmp_last_member_query_count >= 1 && var.igmp_last_member_query_count <= 7
    error_message = "IGMP Last Member Query Count must be between 1 and 7."
  }
}

variable "igmp_query_interval" {
  description = "IGMP Query Interval in seconds"
  type        = number
  default     = 125
  
  validation {
    condition     = var.igmp_query_interval >= 1 && var.igmp_query_interval <= 31744
    error_message = "IGMP Query Interval must be between 1 and 31744 seconds."
  }
}

# PIM Protocol Parameters
variable "pim_join_prune_interval" {
  description = "PIM Join Prune Interval in seconds"
  type        = number
  default     = 60
  
  validation {
    condition     = var.pim_join_prune_interval >= 1 && var.pim_join_prune_interval <= 18724
    error_message = "PIM Join Prune Interval must be between 1 and 18724 seconds."
  }
}

variable "pim_hello_hold_time" {
  description = "PIM Hello Hold Time in seconds"
  type        = number
  default     = 105
  
  validation {
    condition     = var.pim_hello_hold_time >= 1 && var.pim_hello_hold_time <= 65535
    error_message = "PIM Hello Hold Time must be between 1 and 65535 seconds."
  }
}

variable "pim_hello_interval" {
  description = "PIM Hello Interval in seconds"
  type        = number
  default     = 30
  
  validation {
    condition     = var.pim_hello_interval >= 1 && var.pim_hello_interval <= 18724
    error_message = "PIM Hello Interval must be between 1 and 18724 seconds."
  }
}

# Multicast Global Configuration Parameters
variable "dr_priority" {
  description = "Designated Router Priority (1 to 4294967295)"
  type        = number
  default     = 1
  
  validation {
    condition     = var.dr_priority >= 1 && var.dr_priority <= 4294967295
    error_message = "DR Priority must be between 1 and 4294967295."
  }
}

variable "bsm_enabled" {
  description = "Enable Bootstrap Message (BSM) processing"
  type        = bool
  default     = false
}

variable "spt_switchover_enabled" {
  description = "Enable Shortest Path Tree (SPT) switchover"
  type        = bool
  default     = true
}