# Site Security Zone Association Properties (Required)
variable "site_name" {
  description = "Name of the site where the security zone will be associated"
  type        = string
  default     = "Branch-Office-Site-01"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

variable "zone_name" {
  description = "Name of the security zone to associate with the site"
  type        = string
  default     = "Internal-Corporate-Zone"
  
  validation {
    condition     = length(var.zone_name) > 0
    error_message = "Security zone name is required and cannot be empty."
  }
}

# Network Configuration (At least one network must be specified)
variable "wan_network_names" {
  description = "List of WAN network names to associate with the security zone"
  type        = list(string)
  default     = ["Internet-WAN", "MPLS-WAN"]
  
  validation {
    condition = alltrue([
      for name in var.wan_network_names : length(name) > 0
    ])
    error_message = "All WAN network names must be non-empty."
  }
}

variable "lan_network_names" {
  description = "List of LAN network names to associate with the security zone"
  type        = list(string)
  default     = ["Corporate-LAN", "Guest-LAN"]
  
  validation {
    condition = alltrue([
      for name in var.lan_network_names : length(name) > 0
    ])
    error_message = "All LAN network names must be non-empty."
  }
}

variable "wan_overlay_network_names" {
  description = "List of WAN overlay network names to associate with the security zone"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for name in var.wan_overlay_network_names : length(name) > 0
    ])
    error_message = "All WAN overlay network names must be non-empty."
  }
}

# Validation to ensure at least one network is specified
locals {
  total_networks = length(var.wan_network_names) + length(var.lan_network_names) + length(var.wan_overlay_network_names)
}

variable "validate_networks" {
  description = "Internal validation variable - do not modify"
  type        = bool
  default     = true
  
  validation {
    condition     = var.validate_networks == true ? local.total_networks > 0 : true
    error_message = "At least one network (WAN, LAN, or WAN overlay) must be specified for the security zone association."
  }
}