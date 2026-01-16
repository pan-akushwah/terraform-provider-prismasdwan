# Performance Profile Basic Properties (Required)
variable "profile_name" {
  description = "Name of the performance profile"
  type        = string
  default     = "test1"
  
  validation {
    condition     = length(var.profile_name) > 0 && length(var.profile_name) <= 128
    error_message = "Performance profile name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the performance profile (max 256 characters if provided)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the performance profile (max 10 tags, max 128 chars each if provided)"
  type        = list(string)
  default     = []
}

# Flow Metrics Thresholds
variable "flow_metrics_thresholds" {
  description = "Flow metrics thresholds configuration"
  type = object({
    percentage_flow_utilization = optional(number)
  })
  default = null
}

# Circuit Utilization Metrics Thresholds
variable "circuit_utilization_metrics_thresholds" {
  description = "Circuit utilization metrics thresholds configuration"
  type = object({
    percentage_circuit_utilization = optional(number)
  })
  default = null
}

# System Health Metrics Thresholds
variable "system_health_metrics_thresholds" {
  description = "System health metrics thresholds configuration"
  type = object({
    cpu_utilization    = optional(number)
    memory_utilization = optional(number)
    disk_utilization   = optional(number)
  })
  default = null
}

# Synthetic Probe Thresholds
variable "synthetic_probe_thresholds" {
  description = "Synthetic probe thresholds configuration"
  type = object({
    latency = optional(object({
      value           = number
      probe_config_id = string
    }))
    jitter = optional(object({
      value           = number
      probe_config_id = string
    }))
    packet_loss = optional(object({
      value           = number
      probe_config_id = string
    }))
    dns_txn_failure_pct = optional(object({
      value           = number
      probe_config_id = string
    }))
    init_failure_pct = optional(object({
      value           = number
      probe_config_id = string
    }))
  })
  default = null
}

# Hard Limit App Metrics
variable "hard_limit_app_metrics" {
  description = "Hard limit application metrics configuration"
  type = object({
    max_rtt               = optional(number)
    max_init_failure_rate = optional(number)
    udp_trt               = optional(number)
  })
  default = null
}

# Soft Limit App Metrics
variable "soft_limit_app_metrics" {
  description = "Soft limit application metrics configuration"
  type = object({
    max_rtt               = optional(number)
    max_init_failure_rate = optional(number)
    udp_trt               = optional(number)
  })
  default = null
}

# LQM Thresholds
variable "lqm_thresholds" {
  description = "Link Quality Monitoring thresholds configuration"
  type = object({
    max_latency     = optional(number)
    max_jitter      = optional(number)
    max_packet_loss = optional(number)
    min_mos         = optional(number)
  })
  default = null
}