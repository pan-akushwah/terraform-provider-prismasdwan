# Site Hub Prefix Filter Profile Basic Properties (Required)
variable "prefix_filter_profile_name" {
  description = "Name of the hub prefix filter profile"
  type        = string
  default     = "Enterprise-Hub-Prefix-Filter-Profile"
  
  validation {
    condition     = length(var.prefix_filter_profile_name) > 0 && length(var.prefix_filter_profile_name) <= 128
    error_message = "Prefix filter profile name must be between 1 and 128 characters."
  }
}

variable "hub_site_name" {
  description = "Name of the hub site where the prefix filter profile will be applied"
  type        = string
  default     = "Hub-Site-Primary"
  
  validation {
    condition     = length(var.hub_site_name) > 0
    error_message = "Hub site name is required."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the hub prefix filter profile"
  type        = string
  default     = "Enterprise hub prefix filter profile for controlling path prefix distribution and route advertisements"
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the hub prefix filter profile (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "hub-prefix-filter", "route-control", "distribution"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 1024 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 1024 characters and cannot contain commas or whitespace."
  }
}

# Path Prefix Filter List Configuration
variable "path_prefix_filter_list" {
  description = "List of path prefix filter configurations for different VRF contexts"
  type = list(object({
    vrf_context_id = optional(string, "default")
    path_prefix_filters = list(object({
      ipv4_prefix = optional(string)
      ipv6_prefix = optional(string)
      permit      = bool
      order       = number
    }))
  }))
  
  default = [
    {
      vrf_context_id = "default"
      path_prefix_filters = [
        {
          ipv4_prefix = "10.0.0.0/8"
          permit      = true
          order       = 10
        },
        {
          ipv4_prefix = "192.168.0.0/16"
          permit      = true
          order       = 20
        },
        {
          ipv4_prefix = "172.16.0.0/12"
          permit      = true
          order       = 30
        },
        {
          ipv4_prefix = "0.0.0.0/0"
          permit      = false
          order       = 100
        }
      ]
    }
  ]
  
  validation {
    condition = alltrue([
      for filter_list in var.path_prefix_filter_list : alltrue([
        for filter in filter_list.path_prefix_filters : (
          filter.order >= 1 && filter.order <= 65535
        )
      ])
    ])
    error_message = "All filter orders must be between 1 and 65535."
  }
  
  validation {
    condition = alltrue([
      for filter_list in var.path_prefix_filter_list : alltrue([
        for filter in filter_list.path_prefix_filters : (
          (filter.ipv4_prefix != null && filter.ipv6_prefix == null) ||
          (filter.ipv4_prefix == null && filter.ipv6_prefix != null)
        )
      ])
    ])
    error_message = "Each filter must specify either ipv4_prefix or ipv6_prefix, but not both."
  }
}

# Validation Configuration
variable "enable_duplicate_order_validation" {
  description = "Enable validation to check for duplicate order values within the same VRF context"
  type        = bool
  default     = true
}

variable "enable_prefix_validation" {
  description = "Enable validation for IPv4 and IPv6 prefix formats"
  type        = bool
  default     = true
}

variable "max_filters_per_vrf" {
  description = "Maximum number of prefix filters allowed per VRF context (for capacity planning)"
  type        = number
  default     = 100
  
  validation {
    condition     = var.max_filters_per_vrf >= 1
    error_message = "Maximum filters per VRF must be at least 1."
  }
}