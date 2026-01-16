# Site and Element Configuration (Required for resource locators)
variable "site_name" {
  description = "Name of the site where the element is located (used for resource locator)"
  type        = string
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

variable "element_name" {
  description = "Name of the element where the Routing Prefix List will be created (used for resource locator)"
  type        = string
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Routing Prefix List Basic Properties (Required)
variable "prefixlist_name" {
  description = "Name of the Routing Prefix List"
  type        = string
  
  validation {
    condition     = length(var.prefixlist_name) > 0 && length(var.prefixlist_name) <= 128
    error_message = "Routing Prefix List name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the Routing Prefix List"
  type        = string
  default     = ""
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the Routing Prefix List (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) > 0 && length(tag) <= 1024 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must be between 1 and 1024 characters and cannot contain commas or whitespace."
  }
}

variable "auto_generated" {
  description = "Whether this Routing Prefix List is auto-generated"
  type        = bool
  default     = false
}

# Prefix Filter List Configuration
variable "prefix_filter_list" {
  description = "List of prefix filters for the routing prefix list. Use ge=0 and le=0 when not applying length constraints."
  type = list(object({
    prefix       = optional(string)
    ipv6_prefix  = optional(string)
    permit       = bool
    order        = number
    ge           = number
    le           = number
  }))
  default = []
  
  validation {
    condition = alltrue([
      for filter in var.prefix_filter_list : (
        (filter.prefix != null && filter.prefix != "") || 
        (filter.ipv6_prefix != null && filter.ipv6_prefix != "")
      )
    ])
    error_message = "Each prefix filter must have either prefix (IPv4) or ipv6_prefix specified."
  }
  
  validation {
    condition = alltrue([
      for filter in var.prefix_filter_list : filter.order >= 1 && filter.order <= 65535
    ])
    error_message = "Order must be between 1 and 65535 for all prefix filters."
  }
  
  validation {
    condition = length(var.prefix_filter_list) == length(distinct([
      for filter in var.prefix_filter_list : filter.order
    ]))
    error_message = "Order values must be unique across all prefix filters."
  }
  
  validation {
    condition = alltrue([
      for filter in var.prefix_filter_list : filter.ge >= 0 && filter.ge <= 128
    ])
    error_message = "GE (greater than or equal) value must be between 0 and 128. Use 0 when not applying length constraints."
  }
  
  validation {
    condition = alltrue([
      for filter in var.prefix_filter_list : filter.le >= 0 && filter.le <= 128
    ])
    error_message = "LE (less than or equal) value must be between 0 and 128. Use 0 when not applying length constraints."
  }
}
