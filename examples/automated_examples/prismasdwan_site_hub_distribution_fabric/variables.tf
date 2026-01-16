# Site Hub Distribution Fabric Basic Properties (Required)
variable "distribution_fabric_name" {
  description = "Name of the hub distribution fabric"
  type        = string
  default     = "Enterprise-Hub-Distribution-Fabric"
  
  validation {
    condition     = length(var.distribution_fabric_name) > 0 && length(var.distribution_fabric_name) <= 128
    error_message = "Distribution fabric name must be between 1 and 128 characters."
  }
}

variable "hub_site_name" {
  description = "Name of the hub site where the distribution fabric will be created"
  type        = string
  default     = "Hub-Site-Primary"
  
  validation {
    condition     = length(var.hub_site_name) > 0
    error_message = "Hub site name is required."
  }
}

variable "spoke_site_names" {
  description = "List of spoke site names to include in the distribution fabric"
  type        = list(string)
  default     = ["Branch-Site-East", "Branch-Site-West", "Branch-Site-Central"]
  
  validation {
    condition     = length(var.spoke_site_names) >= 1
    error_message = "At least one spoke site must be specified."
  }
  
  validation {
    condition = alltrue([
      for name in var.spoke_site_names : length(name) > 0
    ])
    error_message = "All spoke site names must be non-empty."
  }
  
  validation {
    condition = length(var.spoke_site_names) == length(distinct(var.spoke_site_names))
    error_message = "Spoke site names must be unique."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the hub distribution fabric"
  type        = string
  default     = "Enterprise hub distribution fabric for prefix distribution and routing coordination across spoke sites"
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the hub distribution fabric (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "hub-distribution", "prefix-distribution", "routing"]
  
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

# Operational Configuration
variable "max_spoke_sites" {
  description = "Maximum number of spoke sites to validate against (for capacity planning)"
  type        = number
  default     = 100
  
  validation {
    condition     = var.max_spoke_sites >= 1
    error_message = "Maximum spoke sites must be at least 1."
  }
}