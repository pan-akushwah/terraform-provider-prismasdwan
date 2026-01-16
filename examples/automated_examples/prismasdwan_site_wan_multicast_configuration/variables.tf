# Site Configuration (Required)
variable "site_name" {
  description = "Name of the site where the WAN multicast configuration will be applied"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

# Site Multicast Configuration (Required)
variable "site_configs" {
  description = "List of multicast source site configurations (max 64 configurations)"
  type = list(object({
    source_ipv4_address = string
    group_ipv4_prefix   = string
  }))
  default = [
    {
      source_ipv4_address = "192.168.1.10"
      group_ipv4_prefix   = "224.1.1.0/24"
    },
    {
      source_ipv4_address = "192.168.1.20"
      group_ipv4_prefix   = "224.2.1.0/24"
    },
    {
      source_ipv4_address = "192.168.2.10"
      group_ipv4_prefix   = "232.1.1.0/24"
    }
  ]
  
  validation {
    condition     = length(var.site_configs) > 0 && length(var.site_configs) <= 64
    error_message = "Must specify between 1 and 64 site configurations."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", config.source_ipv4_address))
    ])
    error_message = "All source IPv4 addresses must be in valid IPv4 format."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : 
      alltrue([
        for octet in split(".", config.source_ipv4_address) : tonumber(octet) >= 0 && tonumber(octet) <= 255
      ])
    ])
    error_message = "All source IPv4 address octets must be between 0 and 255."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", config.group_ipv4_prefix))
    ])
    error_message = "All group IPv4 prefixes must be in valid CIDR format."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : 
      tonumber(split("/", config.group_ipv4_prefix)[1]) >= 4 && tonumber(split("/", config.group_ipv4_prefix)[1]) <= 32
    ])
    error_message = "All group IPv4 prefix subnet masks must be between /4 and /32."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : 
      tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) >= 224 && 
      tonumber(split(".", split("/", config.group_ipv4_prefix)[0])[0]) <= 239
    ])
    error_message = "All group IPv4 addresses must be in the multicast range (224.0.0.0 to 239.255.255.255)."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : 
      alltrue([
        for octet in split(".", split("/", config.group_ipv4_prefix)[0]) : tonumber(octet) >= 0 && tonumber(octet) <= 255
      ])
    ])
    error_message = "All group IPv4 address octets must be between 0 and 255."
  }
  
  validation {
    condition = length(var.site_configs) == length(distinct([
      for config in var.site_configs : "${config.source_ipv4_address}:${config.group_ipv4_prefix}"
    ]))
    error_message = "All site configuration combinations of source IPv4 address and group IPv4 prefix must be unique."
  }
  
  validation {
    condition = alltrue([
      for config in var.site_configs : 
      tonumber(split(".", config.source_ipv4_address)[0]) != 224 ||
      tonumber(split(".", config.source_ipv4_address)[0]) > 239
    ])
    error_message = "Source IPv4 addresses cannot be multicast addresses (224.0.0.0 to 239.255.255.255)."
  }
}