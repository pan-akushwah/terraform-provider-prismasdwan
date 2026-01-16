# Path Policy Rule Basic Properties (Required)
variable "rule_name" {
  description = "Name of the path policy rule"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.rule_name) > 0 && length(var.rule_name) <= 128
    error_message = "Path policy rule name must be between 1 and 128 characters."
  }
}

variable "policy_set_name" {
  description = "Name of the policy set to add this rule to"
  type        = string
  default     = "Default-Path-Policy-Set"
  
  validation {
    condition     = length(var.policy_set_name) > 0
    error_message = "Policy set name is required."
  }
}

variable "paths_allowed" {
  description = "Paths allowed configuration"
  type = object({
    active_paths = optional(list(object({
      path_type = string
      label     = optional(string)
    })))
    backup_paths = optional(list(object({
      path_type = string
      label     = optional(string)
    })))
    l3_failure_paths = optional(list(object({
      path_type = string
      label     = optional(string)
    })))
  })
  default = {
    active_paths = [
      {
        label     = "public-*"
        path_type = "direct"
      }
    ]
    backup_paths     = null
    l3_failure_paths = null
  }
}

# Optional Properties
variable "description" {
  description = "Description for the path policy rule"
  type        = string
  default     = "This is Managed by tf"
}

variable "tags" {
  description = "Tags for the path policy rule (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = null
}

variable "network_context_id" {
  description = "Network context ID"
  type        = string
  default     = null
}

variable "source_prefixes_id" {
  description = "Source prefixes ID"
  type        = string
  default     = null
}

variable "destination_prefixes_id" {
  description = "Destination prefixes ID"
  type        = string
  default     = null
}

variable "app_def_ids" {
  description = "Application definition IDs (max 256)"
  type        = list(string)
  default     = null
}

variable "service_context" {
  description = "Service context configuration"
  type = object({
    type                      = string
    active_service_label_id   = string
    active_service_label_type = optional(string)
    backup_service_label_id   = optional(string)
    backup_service_label_type = optional(string)
  })
  default = null
}

variable "order_number" {
  description = "Order number for the policy rule (1-65535)"
  type        = number
  default     = 1024
  
  validation {
    condition     = var.order_number >= 1 && var.order_number <= 65535
    error_message = "Order number must be between 1 and 65535."
  }
}

variable "enabled" {
  description = "Whether the policy rule is enabled"
  type        = bool
  default     = true
}

variable "user_or_group" {
  description = "User or group configuration"
  type = object({
    user_ids       = optional(list(string))
    user_group_ids = optional(list(string))
  })
  default = null
}

variable "src_device_ids" {
  description = "Source device IDs (max 256)"
  type        = list(string)
  default     = null
}

variable "dest_device_ids" {
  description = "Destination device IDs (max 10)"
  type        = list(string)
  default     = null
}

variable "best_path_config" {
  description = "Best path configuration"
  type = object({
    metric_type     = string
    metric          = string
    probe_config_id = optional(string)
  })
  default = null
}