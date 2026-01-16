# Security Policy Rule Basic Properties (Required)
variable "rule_name" {
  description = "Name of the security policy rule"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.rule_name) > 0 && length(var.rule_name) <= 128
    error_message = "Security policy rule name must be between 1 and 128 characters."
  }
}

variable "action" {
  description = "Action for the security policy rule (allow, deny, etc.)"
  type        = string
  default     = "allow"
  
  validation {
    condition = contains(["allow", "deny"], var.action)
    error_message = "Action must be either 'allow' or 'deny'."
  }
}

variable "enabled" {
  description = "Whether the security policy rule is enabled"
  type        = bool
  default     = true
}

# Policy Set Reference (Required for x_parameters)
variable "policy_set_name" {
  description = "Name of the security policy set to associate this rule with"
  type        = string
  default     = "Default-Security-Policy-Set"
}

# Optional Properties
variable "description" {
  description = "Description for the security policy rule"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the security policy rule (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = null
}

# Zone IDs
variable "source_zone_ids" {
  description = "List of source zone IDs (max 16)"
  type        = list(string)
  default     = null
}

variable "destination_zone_ids" {
  description = "List of destination zone IDs (max 16)"
  type        = list(string)
  default     = null
}

# Prefix IDs
variable "source_prefix_ids" {
  description = "List of source prefix IDs (max 16)"
  type        = list(string)
  default     = null
}

variable "destination_prefix_ids" {
  description = "List of destination prefix IDs (max 16)"
  type        = list(string)
  default     = null
}

# Application Definition IDs
variable "app_def_ids" {
  description = "List of application definition IDs (max 16)"
  type        = list(string)
  default     = null
}

# Services Configuration
variable "services" {
  description = "Services configuration for the security policy rule"
  type = list(object({
    protocol = number
    source_ports = optional(list(object({
      from = number
      to   = number
    })))
    destination_ports = optional(list(object({
      from = number
      to   = number
    })))
  }))
  default = null
}

# User or Group Configuration
variable "user_or_group" {
  description = "User or group configuration"
  type = object({
    user_ids       = optional(list(string))
    user_group_ids = optional(list(string))
  })
  default = null
}

# Device IDs
variable "src_device_ids" {
  description = "List of source device IDs (max 256)"
  type        = list(string)
  default     = null
}

variable "dest_device_ids" {
  description = "List of destination device IDs (max 10)"
  type        = list(string)
  default     = null
}