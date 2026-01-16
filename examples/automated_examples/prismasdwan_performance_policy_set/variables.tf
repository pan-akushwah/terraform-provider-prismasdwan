# Performance Policy Set Basic Properties (Required)
variable "policy_set_name" {
  description = "Name of the performance policy set"
  type        = string
  default     = "Default-Performance-Policy-Set"
  
  validation {
    condition     = length(var.policy_set_name) > 0 && length(var.policy_set_name) <= 128
    error_message = "Performance policy set name must be between 1 and 128 characters."
  }
}

# Optional Basic Properties
variable "description" {
  description = "Description for the performance policy set"
  type        = string
  default     = "Performance policy set for comprehensive network monitoring and optimization"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the performance policy set (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "performance", "policy-set", "monitoring"]
  
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
  
  validation {
    condition = length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - no duplicates allowed."
  }
}

variable "defaultrule_policyset" {
  description = "Whether this is a default rule policy set"
  type        = bool
  default     = false
}

variable "send_to_element" {
  description = "Whether to send policy set to element (transient)"
  type        = bool
  default     = true
}

variable "clone_from" {
  description = "Clone from another policy set ID"
  type        = string
  default     = null
  
  validation {
    condition     = var.clone_from == null || can(regex("^[0-9]{1,20}$", var.clone_from))
    error_message = "Clone from must be a valid policy set ID (digits only, max 20 characters)."
  }
}

# Link Health Rules Configuration (as direct list attribute)
variable "link_health_rules" {
  description = "Array of link health rules for the policy set"
  type        = any
  default = [
    {
      name = "Default-Link-Health-Rule"
      type = "APP_CIRCUIT_HEALTH"
      enabled = true
      description = "Default link health monitoring rule"
      tags = ["default", "link-health"]
      tfid = "default-rule-001"
      
      actions = [
        {
          action_type = "VISIBILITY"
          always_on = false
          
          app_perf = {
            monitoring_approach = "MODERATE"
            bad_health_thresholds = {
              clear_below = 30
              raise_above = 60
            }
          }
        }
      ]
    }
  ]
}

# Policy Rules Configuration (as direct list attribute)
variable "policy_rules" {
  description = "Array of policy rules for the policy set"
  type        = any
  default     = []
}
