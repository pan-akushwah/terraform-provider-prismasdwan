variable "wan_interface_label_name" {
  description = "Name of the WAN interface label"
  type        = string
  default     = "Enterprise-WAN-Label"
}

variable "description" {
  description = "Description for the WAN interface label"
  type        = string
  default     = "Enterprise WAN interface label for path management"
}

variable "label" {
  description = "Label value (format: public|private-(1-32|1000-1009))"
  type        = string
  default     = "public-1"
  
  validation {
    condition = can(regex("^(public|private)-(([1-9])|([1-2][0-9])|(3[0-2])|(100[0-9]))$", var.label))
    error_message = "Label must follow format: public|private-(1-32|1000-1009)."
  }
}

variable "tags" {
  description = "Tags for the WAN interface label (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "wan-label", "enterprise"]
  
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

variable "probe_profile_name" {
  description = "Name of the probe profile to use"
  type        = string
  default     = "Default-Probe-Profile"
}

variable "bwc_enabled" {
  description = "Bandwidth control enabled"
  type        = bool
  default     = true
}

variable "lqm_enabled" {
  description = "Link quality monitoring enabled"
  type        = bool
  default     = true
}

variable "use_lqm_for_non_hub_paths" {
  description = "Use LQM for non-hub paths"
  type        = bool
  default     = false
}

variable "use_for_application_reachability_probes" {
  description = "Use for application reachability probes"
  type        = bool
  default     = true
}

variable "use_for_controller_connections" {
  description = "Use for controller connections"
  type        = bool
  default     = true
}

variable "l3_reachability_use_element_default" {
  description = "Use element default for L3 reachability"
  type        = bool
  default     = true
}

variable "l3_reachability_probe_config_names" {
  description = "List of probe config names for L3 reachability"
  type        = list(string)
  default     = []
}

variable "vpnlink_keep_alive_interval" {
  description = "VPN link keep alive interval (100-1740000 ms)"
  type        = number
  default     = 10000
  
  validation {
    condition = var.vpnlink_keep_alive_interval >= 100 && var.vpnlink_keep_alive_interval <= 1740000
    error_message = "VPN Link keep alive interval must be between 100ms-1740000ms."
  }
}

variable "vpnlink_keep_alive_failure_count" {
  description = "VPN link keep alive failure count (3-30)"
  type        = number
  default     = 5
  
  validation {
    condition = var.vpnlink_keep_alive_failure_count >= 3 && var.vpnlink_keep_alive_failure_count <= 30
    error_message = "VPN Link keep alive failure count must be between 3 and 30."
  }
}