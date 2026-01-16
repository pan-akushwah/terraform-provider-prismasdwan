# NTP Template Basic Properties (Required)
variable "template_name" {
  description = "Name of the NTP template"
  type        = string
  default     = "TerraformNTPTemplate"
  
  validation {
    condition     = length(var.template_name) > 0 && length(var.template_name) <= 128
    error_message = "Template name must be between 1 and 128 characters."
  }
}

variable "ntp_servers" {
  description = "List of NTP servers (min 1, max 10)"
  type = list(object({
    host     = string
    version  = number
    min_poll = number
    max_poll = number
  }))
  default = [
    {
      host     = "pool.ntp.org"
      version  = 4
      min_poll = 4
      max_poll = 10
    },
    {
      host     = "time.google.com"
      version  = 4
      min_poll = 4
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
      server.version >= 2 && server.version <= 4
    ])
    error_message = "Allowed versions are 2, 3 & 4."
  }
  
  validation {
    condition = alltrue([
      for server in var.ntp_servers : 
      server.min_poll >= 4 && server.min_poll <= 17
    ])
    error_message = "The range for minimum poll values is between 4-17."
  }
  
  validation {
    condition = alltrue([
      for server in var.ntp_servers : 
      server.max_poll >= 4 && server.max_poll <= 17
    ])
    error_message = "The range for maximum poll values is between 4-17."
  }
  
  validation {
    condition = alltrue([
      for server in var.ntp_servers : 
      server.max_poll >= server.min_poll
    ])
    error_message = "Maximum poll value must be greater than or equal to minimum poll value."
  }
  
  validation {
    condition = alltrue([
      for server in var.ntp_servers : 
      can(regex("^[a-zA-Z0-9.-]+$", server.host)) && length(server.host) > 0
    ])
    error_message = "Host can be only domain name or IP address."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the NTP template"
  type        = string
  default     = "NTP template managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "NTP description is invalid. The maximum length is 256."
  }
}

variable "tags" {
  description = "Tags for the NTP template"
  type        = list(string)
  default     = ["terraform", "ntp", "template"]
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
  
  validation {
    condition = length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - no duplicates allowed."
  }
}

variable "default_template" {
  description = "Whether this is a default NTP template"
  type        = bool
  default     = false
}