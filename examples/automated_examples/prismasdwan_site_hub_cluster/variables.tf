# Site Hub Cluster Basic Properties (Required)
variable "hub_cluster_name" {
  description = "Name of the hub cluster"
  type        = string
  default     = "Enterprise-Hub-Cluster"
  
  validation {
    condition     = length(var.hub_cluster_name) > 0 && length(var.hub_cluster_name) <= 128
    error_message = "Hub cluster name must be between 1 and 128 characters."
  }
}

variable "hub_site_name" {
  description = "Name of the hub site (will be resolved to site ID)"
  type        = string
  default     = "Hub-Site-Primary"
  
  validation {
    condition     = length(var.hub_site_name) > 0
    error_message = "Hub site name is required."
  }
}

variable "peer_site_names" {
  description = "List of peer site names for the hub cluster (will be resolved to IDs)"
  type        = list(string)
  default     = ["Branch-Site-East", "Branch-Site-West"]
  
  validation {
    condition     = length(var.peer_site_names) >= 0
    error_message = "Peer site names list can be empty but must be a valid list."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the hub cluster"
  type        = string
  default     = "Enterprise hub cluster for centralized routing and connectivity"
  
  validation {
    condition     = length(var.description) <= 4096
    error_message = "Description must not exceed 4096 characters."
  }
}

variable "tags" {
  description = "Tags for the hub cluster (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "hub-cluster", "enterprise"]
  
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

variable "default_cluster" {
  description = "Whether this is a default cluster"
  type        = bool
  default     = false
}

variable "site_count_alarm_threshold" {
  description = "Site count alarm threshold (must be positive)"
  type        = number
  default     = 100
  
  validation {
    condition     = var.site_count_alarm_threshold > 0
    error_message = "Site count alarm threshold must be positive."
  }
}

# Hub Elements Configuration
variable "hub_element_names" {
  description = "List of hub element names with their locked status (names will be resolved to IDs)"
  type = list(object({
    element_name = string
    locked       = bool
  }))
  default = [
    {
      element_name = "Hub-Element-Primary"
      locked       = false
    },
    {
      element_name = "Hub-Element-Secondary"
      locked       = true
    }
  ]
  
  validation {
    condition = alltrue([
      for element in var.hub_element_names : length(element.element_name) > 0
    ])
    error_message = "All hub element names must be non-empty."
  
}
}
