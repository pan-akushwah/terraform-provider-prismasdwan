# Probe Config Basic Properties (Required)
variable "probe_config_name" {
  description = "Name of the probe configuration (max 128 characters)"
  type        = string
  default     = "CloudFlare-DNS-ICMP-Response"
  
  validation {
    condition     = length(var.probe_config_name) > 0 && length(var.probe_config_name) <= 128
    error_message = "Probe config name must be between 1 and 128 characters."
  }
}

variable "enabled" {
  description = "Whether the probe configuration is enabled"
  type        = bool
  default     = true
}

variable "endpoints" {
  description = "List of probe endpoints (required)"
  type = list(object({
    ipv4_address                     = optional(string)
    dns_server_ip                    = optional(string)
    fqdn                            = optional(string)
    protocol                        = string
    probe_cycle_duration            = optional(number)
    probe_count                     = optional(number)
    path_types                      = optional(list(string))
    allow_insecure_https_connection = optional(bool)
    http_response_codes             = optional(list(number))
    http_response_string            = optional(string)
  }))
  default = [
    {
      ipv4_address         = "1.1.1.2"
      protocol            = "icmp"
      probe_cycle_duration = 10
      probe_count         = 2
      path_types          = ["direct", "vpn", "servicelink"]
      allow_insecure_https_connection = false
    }
  ]
  
  validation {
    condition     = length(var.endpoints) > 0
    error_message = "At least one probe endpoint is required."
  }
  
  validation {
    condition = alltrue([
      for endpoint in var.endpoints : contains(["http", "https", "icmp", "dns"], endpoint.protocol)
    ])
    error_message = "Protocol must be one of: http, https, icmp, dns."
  }
  
  validation {
    condition = alltrue([
      for endpoint in var.endpoints : endpoint.path_types == null || alltrue([
        for path_type in endpoint.path_types : contains(["vpn", "direct", "servicelink", "all"], path_type)
      ])
    ])
    error_message = "Path types must be one of: vpn, direct, servicelink, all."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the probe configuration (max 256 characters)"
  type        = string
  default     = "CloudFlare DNS ICMP Response"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the probe configuration (max 10 tags, max 128 chars each, no commas or whitespace)"
  type        = list(string)
  default     = null
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = var.tags == null || alltrue([
      for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
}