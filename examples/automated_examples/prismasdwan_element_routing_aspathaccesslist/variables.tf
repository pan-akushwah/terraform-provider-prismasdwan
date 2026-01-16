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
  description = "Name of the element where the AS Path Access List will be created (used for resource locator)"
  type        = string
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# AS Path Access List Basic Properties (Required)
variable "aspathacl_name" {
  description = "Name of the AS Path Access List"
  type        = string
  
  validation {
    condition     = length(var.aspathacl_name) > 0 && length(var.aspathacl_name) <= 128
    error_message = "AS Path Access List name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the AS Path Access List"
  type        = string
  default     = ""
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the AS Path Access List (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) > 0 && length(tag) <= 1024
    ])
    error_message = "Each tag must be between 1 and 1024 characters."
  }
}

variable "auto_generated" {
  description = "Whether this AS Path Access List is auto-generated"
  type        = bool
  default     = false
}

# AS Path Regex List Configuration
variable "as_path_regex_list" {
  description = "List of AS path regex rules for the access list (max 100 rules)"
  type = list(object({
    as_path_regex = string
    permit        = bool
    order         = number
  }))
  default = []
  
  validation {
    condition     = length(var.as_path_regex_list) <= 100
    error_message = "Maximum 100 AS path regex rules are allowed."
  }
  
  validation {
    condition = alltrue([
      for rule in var.as_path_regex_list : length(rule.as_path_regex) > 0
    ])
    error_message = "AS path regex cannot be empty in any rule."
  }
  
  validation {
    condition = alltrue([
      for rule in var.as_path_regex_list : rule.order >= 1 && rule.order <= 65535
    ])
    error_message = "Order must be between 1 and 65535 for all rules."
  }
  
  validation {
    condition = length(var.as_path_regex_list) == length(distinct([
      for rule in var.as_path_regex_list : rule.order
    ]))
    error_message = "Order values must be unique across all AS path regex rules."
  }
}