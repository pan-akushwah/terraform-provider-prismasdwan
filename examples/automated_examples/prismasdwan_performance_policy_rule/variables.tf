# Parent Performance Management Policy Set ID (Required)
variable "perfmgmtpolicyset_id" {
  description = "ID of the parent performance management policy set"
  type        = string
  default     = "default-perfmgmt-policyset-id"
}

# Performance Policy Rule Basic Properties (Required)
variable "rule_name" {
  description = "Name of the performance policy rule"
  type        = string
  default     = "Default-Performance-Policy-Rule"
  
  validation {
    condition     = length(var.rule_name) > 0 && length(var.rule_name) <= 128
    error_message = "Performance policy rule name must be between 1 and 128 characters."
  }
}

variable "rule_type" {
  description = "Type of performance policy rule"
  type        = string
  default     = "APP_CIRCUIT_HEALTH"
  
  validation {
    condition     = contains(["APP_CIRCUIT_HEALTH", "SYSTEM_SITE_HEALTH"], var.rule_type)
    error_message = "Rule type must be either APP_CIRCUIT_HEALTH or SYSTEM_SITE_HEALTH."
  }
}

# Actions Configuration (Required)
variable "actions" {
  description = "Array of actions for the performance policy rule"
  type = list(object({
    action_type = string
    always_on   = optional(bool)
    
    # Performance monitoring configurations (optional)
    circuit_utilization_perf = optional(object({
      monitoring_approach = string
      bad_health_thresholds = optional(object({
        clear_below = number
        raise_above = number
      }))
    }))
    
    sys_perf = optional(object({
      monitoring_approach = string
      bad_health_thresholds = optional(object({
        clear_below = number
        raise_above = number
      }))
    }))
    
    probe_perf = optional(object({
      monitoring_approach = string
      bad_health_thresholds = optional(object({
        clear_below = number
        raise_above = number
      }))
    }))
    
    app_perf = optional(object({
      monitoring_approach = string
      bad_health_thresholds = optional(object({
        clear_below = number
        raise_above = number
      }))
    }))
    
    lqm_perf = optional(object({
      monitoring_approach = string
      bad_health_thresholds = optional(object({
        clear_below = number
        raise_above = number
      }))
    }))
  }))
  
  default = [
    {
      action_type = "VISIBILITY"
      always_on   = false
      
      app_perf = {
        monitoring_approach = "MODERATE"
        bad_health_thresholds = {
          clear_below = 30
          raise_above = 50
        }
      }
    }
  ]
  
  validation {
    condition = alltrue([
      for action in var.actions : contains([
        "RAISE_ALARM", "MOVE_FLOWS", "MOVE_FLOWS_FORCED", 
        "FEC", "VISIBILITY", "APP_ACCELERATION", "PACKET_DUPLICATION"
      ], action.action_type)
    ])
    error_message = "All action types must be valid enum values."
  }
}

# Optional Configuration
variable "enabled" {
  description = "Whether the performance policy rule is enabled"
  type        = bool
  default     = true
}

variable "description" {
  description = "Description for the performance policy rule"
  type        = string
  default     = "Performance policy rule for application and circuit health monitoring"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the performance policy rule (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "performance", "policy", "monitoring"]
  
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

variable "thresholdprofile_id" {
  description = "ID of the threshold profile to use"
  type        = string
  default     = null
}

# Filter Configurations
variable "network_context_ids" {
  description = "Array of network context IDs"
  type        = list(string)
  default     = []
}

variable "service_label_ids" {
  description = "Array of service label IDs (max 32)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.service_label_ids) <= 32
    error_message = "Maximum 32 service labels are supported."
  }
  
  validation {
    condition = length(var.service_label_ids) == length(distinct(var.service_label_ids))
    error_message = "Service label IDs must be unique - no duplicates allowed."
  }
}

variable "path_filters" {
  description = "Array of path filter objects (max 32)"
  type = list(object({
    path_type = string
    label     = optional(string)
  }))
  default = []
  
  validation {
    condition     = length(var.path_filters) <= 32
    error_message = "Maximum 32 path filters are supported."
  }
  
  validation {
    condition = alltrue([
      for filter in var.path_filters : contains(["vpn", "direct", "servicelink", "all"], filter.path_type)
    ])
    error_message = "All path types must be valid enum values (vpn, direct, servicelink, all)."
  }
  
  validation {
    condition = alltrue([
      for filter in var.path_filters : 
      filter.label == null || can(regex("^(public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))$", filter.label))
    ])
    error_message = "Path filter labels must match pattern (public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))."
  }
}

variable "app_filters" {
  description = "Application filters configuration"
  type = object({
    app_transfer_types = optional(list(string))
    application_ids    = optional(list(string))
  })
  default = null
  
  validation {
    condition = var.app_filters == null || (
      var.app_filters.app_transfer_types == null || 
      length(var.app_filters.app_transfer_types) <= 4
    )
    error_message = "Maximum 4 app transfer types are supported."
  }
  
  validation {
    condition = var.app_filters == null || (
      var.app_filters.application_ids == null || 
      length(var.app_filters.application_ids) <= 64
    )
    error_message = "Maximum 64 applications can be specified."
  }
  
  validation {
    condition = var.app_filters == null || (
      var.app_filters.app_transfer_types == null || 
      alltrue([
        for transfer_type in var.app_filters.app_transfer_types : 
        contains(["RT_AUDIO", "RT_VIDEO", "TRANSACTIONAL", "BULK"], transfer_type)
      ])
    )
    error_message = "All app transfer types must be valid enum values."
  }
}