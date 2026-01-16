# WAN Network Basic Properties (Required)
variable "network_name" {
  description = "Name of the WAN network"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.network_name) > 0 && length(var.network_name) <= 128
    error_message = "WAN network name must be between 1 and 128 characters."
  }
}

variable "network_type" {
  description = "Type of WAN network (publicwan or privatevan)"
  type        = string
  default     = "publicwan"
  
  validation {
    condition     = contains(["publicwan", "privatewan"], var.network_type)
    error_message = "WAN Network type must be either publicwan or privatevan."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the WAN network"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the WAN network (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = ["Managed", "by", "terraform"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 128
    ])
    error_message = "Each tag must not exceed 128 characters."
  }
  
  validation {
    condition = length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - no duplicates allowed."
  }
}
