# QoS Policy Stack Basic Properties (Required)
# QoS Policy Stack Basic Properties (Required)
variable "qos_policy_stack_name" {
  description = "Name of the QoS policy stack"
  type        = string
  default     = "Enterprise-QoS-Policy-Stack"
  
  validation {
    condition     = length(var.qos_policy_stack_name) > 0 && length(var.qos_policy_stack_name) <= 128
    error_message = "QoS policy stack name is required and must not exceed 128 characters."
  }
}

variable "defaultrule_policyset_name" {
  description = "Name of the default rule policy set (required)"
  type        = string
  default     = "Default-QoS-Policy-Set"
  
  validation {
    condition     = length(var.defaultrule_policyset_name) > 0
    error_message = "Default rule policy set name is required."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the QoS policy stack"
  type        = string
  default     = "Enterprise QoS policy stack for traffic prioritization and bandwidth management"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the QoS policy stack (max 10 tags, max 128 chars each)"
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

variable "default_policysetstack" {
  description = "Whether this is a default policy set stack"
  type        = bool
  default     = false
}

# Policy Set Configuration (1-4 policy sets max)
variable "policyset_names" {
  description = "List of QoS policy set names to include in the stack (1-4 policy sets max)"
  type        = list(string)
  default     = [
    "High-Priority-QoS-Policy-Set",
    "Business-Critical-QoS-Policy-Set"
  ]
  
  validation {
    condition     = length(var.policyset_names) >= 0 && length(var.policyset_names) <= 4
    error_message = "Must specify between 0 and 4 policy sets in the stack."
  }
  
  validation {
    condition = alltrue([
      for name in var.policyset_names : length(name) > 0
    ])
    error_message = "All policy set names must be non-empty."
  }
  
  validation {
    condition = length(var.policyset_names) == length(distinct(var.policyset_names))
    error_message = "Policy set names must be unique within the stack."
  }
}
