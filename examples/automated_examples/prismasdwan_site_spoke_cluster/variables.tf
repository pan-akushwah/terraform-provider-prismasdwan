# Site Spoke Cluster Basic Properties (Required)
variable "spoke_cluster_name" {
  description = "Name of the spoke cluster"
  type        = string
  default     = "Enterprise-Spoke-Cluster"
  
  validation {
    condition     = length(var.spoke_cluster_name) > 0 && length(var.spoke_cluster_name) <= 128
    error_message = "Spoke cluster name must be between 1 and 128 characters."
  }
}

variable "site_name" {
  description = "Name of the site where the spoke cluster will be created"
  type        = string
  default     = "Branch-Site-Primary"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required."
  }
}

variable "advertisement_interval" {
  description = "Advertisement interval in seconds (min: 2, precision: 3 decimal places)"
  type        = number
  default     = 5.0
  
  validation {
    condition     = var.advertisement_interval >= 2.0
    error_message = "Advertisement interval must be at least 2 seconds."
  }
}

variable "preempt" {
  description = "Preempt setting for the spoke cluster"
  type        = bool
  default     = true
}

# Optional Properties
variable "description" {
  description = "Description for the spoke cluster"
  type        = string
  default     = "Enterprise spoke cluster for branch site redundancy and failover"
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the spoke cluster (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "spoke-cluster", "branch"]
  
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