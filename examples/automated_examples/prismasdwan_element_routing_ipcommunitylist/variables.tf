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
  description = "Name of the element where the IP Community List will be created (used for resource locator)"
  type        = string
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# IP Community List Basic Properties (Required)
variable "communitylist_name" {
  description = "Name of the IP Community List"
  type        = string
  
  validation {
    condition     = length(var.communitylist_name) > 0 && length(var.communitylist_name) <= 128
    error_message = "IP Community List name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the IP Community List"
  type        = string
  default     = ""
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the IP Community List (max 10 tags, max 1024 chars each)"
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
  description = "Whether this IP Community List is auto-generated"
  type        = bool
  default     = false
}

# Community List Configuration
variable "community_list" {
  description = "List of community strings for BGP community filtering"
  type = list(object({
    community_str = string
    permit        = bool
  }))
  default = []
  
  validation {
    condition = alltrue([
      for community in var.community_list : length(community.community_str) > 0 && length(community.community_str) <= 256
    ])
    error_message = "Each community string must be between 1 and 256 characters."
  }
  
  validation {
    condition = alltrue([
      for community in var.community_list : can(regex("^(internet|no-export|no-advertise|local-AS|(0|6553[0-5]|655[0-2][0-9]|65[0-4]\\d{2}|6[0-4]\\d{3}|[1-5]\\d{4}|[1-9]\\d{0,3}):(0|6553[0-5]|655[0-2][0-9]|65[0-4]\\d{2}|6[0-4]\\d{3}|[1-5]\\d{4}|[1-9]\\d{0,3}))$", community.community_str))
    ])
    error_message = "Each community string must be in valid format: internet, no-export, no-advertise, local-AS, or ASN:VALUE format (e.g., 65001:100)."
  }
  
  validation {
    condition = length(var.community_list) == length(distinct([
      for community in var.community_list : community.community_str
    ]))
    error_message = "Community strings must be unique within the list."
  }
}