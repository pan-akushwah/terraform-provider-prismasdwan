# Element NTP Configuration Variables

# Element Configuration (Required)
variable "element_name" {
  description = "Name of the element where the NTP configuration will be applied"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Required NTP Configuration
variable "ntp_name" {
  description = "Name for the NTP configuration"
  type        = string
  default     = "default"
  
  validation {
    condition     = length(var.ntp_name) > 0 && length(var.ntp_name) <= 128
    error_message = "NTP name is required and must not exceed 128 characters."
  }
}

variable "ntp_servers" {
  description = "List of NTP servers (minimum 1, maximum 10)"
  type = list(object({
    host     = string
    version  = number
    min_poll = number
    max_poll = number
  }))
  default = [
    {
      host     = "0.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    },
    {
      host     = "1.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    },
    {
      host     = "2.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    },
    {
      host     = "3.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    }
  ]
  
  validation {
    condition     = length(var.ntp_servers) >= 1 && length(var.ntp_servers) <= 10
    error_message = "A minimum of 1 and a maximum of 10 NTP servers can be configured."
  }
  
  validation {
    condition = alltrue([
      for server in var.ntp_servers : 
      contains([2, 3, 4], server.version) &&
      server.min_poll >= 4 && server.min_poll <= 17 &&
      server.max_poll >= 4 && server.max_poll <= 17 &&
      server.max_poll >= server.min_poll
    ])
    error_message = "NTP server validation failed: version must be 2, 3, or 4; min_poll and max_poll must be between 4-17; max_poll must be >= min_poll."
  }
}

# Optional Configuration
variable "description" {
  description = "Description for the NTP configuration"
  type        = string
  default     = "Default NTP template created by Terraform"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "NTP description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the NTP configuration"
  type        = list(string)
  default     = ["terraform", "ntp", "time-sync"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
}

# Source Interface Configuration
variable "source_interface_names" {
  description = "Names of source interfaces for NTP (alternative to source_interface_ids)"
  type        = list(string)
  default     = null
}

variable "source_interface_ids" {
  description = "Source interface IDs for NTP (used if source_interface_names is not provided)"
  type        = list(string)
  default     = null
}