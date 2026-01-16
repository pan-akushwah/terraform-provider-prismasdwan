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
  description = "Name of the element where the static route will be configured"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Static Route Basic Configuration (Required)
variable "address_family" {
  description = "Address family for the static route (ipv4 or ipv6)"
  type        = string
  default     = "ipv4"
  
  validation {
    condition     = contains(["ipv4", "ipv6"], var.address_family)
    error_message = "Address family must be either 'ipv4' or 'ipv6'."
  }
}

variable "scope" {
  description = "Scope of the static route (global or local)"
  type        = string
  default     = "global"
  
  validation {
    condition     = contains(["global", "local"], var.scope)
    error_message = "Scope must be either 'global' or 'local'."
  }
}

variable "destination_prefix" {
  description = "Destination prefix for the static route (e.g., 192.168.1.0/24)"
  type        = string
  default     = "0.0.0.0/0"
  
  validation {
    condition     = length(var.destination_prefix) > 0
    error_message = "Destination prefix is required."
  }
}

variable "nexthops" {
  description = "List of nexthops for the static route (maximum 8)"
  type = list(object({
    self                     = optional(bool, false)
    admin_distance          = optional(number, 1)
    nexthop_ip              = optional(string)
    nexthop_interface_id    = optional(string)
    nexthop_interface_name  = optional(string)
  }))
  default = [
    {
      self = false
      admin_distance = 1
      nexthop_ip = "192.168.1.1"
      nexthop_interface_id = null
      nexthop_interface_name = null
    }
  ]
  
  validation {
    condition     = length(var.nexthops) >= 1 && length(var.nexthops) <= 8
    error_message = "Must specify between 1 and 8 nexthops."
  }
}

# Helper variable for interface name resolution
variable "nexthop_interface_names" {
  description = "List of unique interface names used in nexthops (for resource locator)"
  type        = list(string)
  default     = []
}

# Optional Static Route Configuration
variable "static_route_name" {
  description = "Name for the static route"
  type        = string
  default     = "default-route"
  
  validation {
    condition     = var.static_route_name == null || length(var.static_route_name) <= 128
    error_message = "Static route name must not exceed 128 characters."
  }
}

variable "description" {
  description = "Description for the static route"
  type        = string
  default     = "Static route configured via Terraform"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the static route"
  type        = list(string)
  default     = ["terraform", "static-route"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
}

variable "nexthop_reachability_probe" {
  description = "Enable nexthop reachability probe"
  type        = bool
  default     = false
}

# Context Configuration (Optional)
variable "vrf_context_name" {
  description = "Name of the VRF context (alternative to vrf_context_id)"
  type        = string
  default     = null
}

variable "vrf_context_id" {
  description = "VRF context ID (used if vrf_context_name is not provided)"
  type        = string
  default     = null
}

variable "network_context_name" {
  description = "Name of the network context (alternative to network_context_id)"
  type        = string
  default     = null
}

variable "network_context_id" {
  description = "Network context ID (used if network_context_name is not provided)"
  type        = string
  default     = null
}