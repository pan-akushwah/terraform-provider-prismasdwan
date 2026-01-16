# QoS Policy Set Basic Properties (Required)
variable "qos_policy_set_name" {
  description = "Name of the QoS policy set"
  type        = string
  default     = "Enterprise-QoS-Policy-Set"
  
  validation {
    condition     = length(var.qos_policy_set_name) > 0 && length(var.qos_policy_set_name) <= 128
    error_message = "QoS policy set name is required and must not exceed 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the QoS policy set"
  type        = string
  default     = "Enterprise QoS policy set for traffic prioritization and bandwidth management"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the QoS policy set (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "qos", "enterprise", "traffic-management"]
  
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

variable "template" {
  description = "Whether this is a template policy set"
  type        = bool
  default     = false
}

variable "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  type        = bool
  default     = false
}

variable "clone_from" {
  description = "ID of the policy set to clone from"
  type        = string
  default     = null
  
  validation {
    condition     = var.clone_from == null || can(regex("^[0-9]{1,20}$", var.clone_from))
    error_message = "Clone from ID must be a valid numeric string with up to 20 digits."
  }
}

# Business Priority Names (Required)
variable "business_priority_names" {
  description = "Business priority names with their priority numbers (max 4, required)"
  type = list(object({
    priority_name   = string
    priority_number = number
  }))
  default = [
    {
      priority_name   = "Critical"
      priority_number = 1
    },
    {
      priority_name   = "High"
      priority_number = 2
    },
    {
      priority_name   = "Medium"
      priority_number = 3
    },
    {
      priority_name   = "Low"
      priority_number = 4
    }
  ]
  
  validation {
    condition     = length(var.business_priority_names) > 0 && length(var.business_priority_names) <= 4
    error_message = "Business priority names are required and must not exceed 4 entries."
  }
  
  validation {
    condition = alltrue([
      for priority in var.business_priority_names : length(priority.priority_name) > 0
    ])
    error_message = "All priority names must be non-empty."
  }
}

# Bandwidth Allocation Schemes (Required)
variable "bandwidth_allocation_schemes" {
  description = "Bandwidth allocation schemes for the policy set (max 4, required)"
  type = list(object({
    bandwidth_range = object({
      low  = number
      high = number
    })
    business_priorities = list(object({
      priority_number     = number
      bandwidth_allocation = number
      bandwidth_split_per_type = object({
        rt_audio      = number
        rt_video      = number
        transactional = number
        bulk          = number
      })
    }))
  }))
  default = [
    {
      bandwidth_range = {
        low  = 1.0
        high = 10.0
      }
      business_priorities = [
        {
          priority_number     = 1
          bandwidth_allocation = 40.0
          bandwidth_split_per_type = {
            rt_audio      = 10.0
            rt_video      = 30.0
            transactional = 40.0
            bulk          = 20.0
          }
        },
        {
          priority_number     = 2
          bandwidth_allocation = 30.0
          bandwidth_split_per_type = {
            rt_audio      = 5.0
            rt_video      = 25.0
            transactional = 50.0
            bulk          = 20.0
          }
        },
        {
          priority_number     = 3
          bandwidth_allocation = 20.0
          bandwidth_split_per_type = {
            rt_audio      = 5.0
            rt_video      = 15.0
            transactional = 40.0
            bulk          = 40.0
          }
        },
        {
          priority_number     = 4
          bandwidth_allocation = 10.0
          bandwidth_split_per_type = {
            rt_audio      = 0.0
            rt_video      = 10.0
            transactional = 30.0
            bulk          = 60.0
          }
        }
      ]
    }
  ]
  
  validation {
    condition     = length(var.bandwidth_allocation_schemes) > 0 && length(var.bandwidth_allocation_schemes) <= 4
    error_message = "Bandwidth allocation schemes are required and must not exceed 4 entries."
  }
  
  validation {
    condition = alltrue([
      for scheme in var.bandwidth_allocation_schemes : scheme.bandwidth_range.low <= scheme.bandwidth_range.high
    ])
    error_message = "Bandwidth range low value must be less than or equal to high value."
  }
}

# Default Rule DSCP Mappings (Optional)
variable "default_rule_dscp_mappings" {
  description = "Default rule DSCP mappings (max 16)"
  type = list(object({
    transfer_type   = string
    priority_number = number
    dscp           = list(number)
  }))
  default = [
    {
      transfer_type   = "RT_AUDIO"
      priority_number = 1
      dscp           = [46, 34]
    },
    {
      transfer_type   = "RT_VIDEO"
      priority_number = 1
      dscp           = [38, 36]
    },
    {
      transfer_type   = "TRANSACTIONAL"
      priority_number = 2
      dscp           = [26, 18]
    },
    {
      transfer_type   = "BULK"
      priority_number = 4
      dscp           = [10, 8]
    }
  ]
  
  validation {
    condition     = length(var.default_rule_dscp_mappings) <= 16
    error_message = "Maximum 16 DSCP mappings are allowed."
  }
  
  validation {
    condition = alltrue([
      for mapping in var.default_rule_dscp_mappings : 
      contains(["RT_AUDIO", "RT_VIDEO", "TRANSACTIONAL", "BULK"], mapping.transfer_type)
    ])
    error_message = "Transfer type must be one of: RT_AUDIO, RT_VIDEO, TRANSACTIONAL, BULK."
  }
  
  validation {
    condition = alltrue([
      for mapping in var.default_rule_dscp_mappings : 
      alltrue([for dscp in mapping.dscp : dscp >= 0 && dscp <= 63])
    ])
    error_message = "DSCP values must be between 0 and 63."
  }
}