# Site DHCP Server Configuration Variables

# Site Configuration (Required)
variable "site_name" {
  description = "Name of the site where the DHCP server will be configured"
  type        = string
  default     = "Branch-Office-Site-01"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

# Required DHCP Configuration
variable "address_family" {
  description = "Address family for DHCP server (ipv4 or ipv6)"
  type        = string
  default     = "ipv4"
  
  validation {
    condition     = contains(["ipv4", "ipv6"], var.address_family)
    error_message = "Address family must be either ipv4 or ipv6."
  }
}

variable "subnet" {
  description = "Subnet for DHCP server (CIDR notation)"
  type        = string
  default     = "192.168.1.0/24"
  
  validation {
    condition     = can(cidrhost(var.subnet, 0))
    error_message = "Subnet must be a valid CIDR notation (e.g., 192.168.1.0/24)."
  }
}

variable "ip_ranges" {
  description = "IP address ranges for DHCP allocation"
  type = list(object({
    start_ip = string
    end_ip   = string
  }))
  default = [
    {
      start_ip = "192.168.1.1"
      end_ip   = "192.168.1.5"
    }
  ]
  
  validation {
    condition     = length(var.ip_ranges) >= 1
    error_message = "At least one IP range must be specified."
  }
}

# Basic Configuration
variable "disabled" {
  description = "Whether the DHCP server is disabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the DHCP server (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "dhcp", "server"]
  
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

variable "description" {
  description = "Description for the DHCP server"
  type        = string
  default     = "Terraform managed DHCP server for branch office"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

# Network Configuration
variable "gateway" {
  description = "Gateway IP address for DHCP clients"
  type        = string
  default     = "192.168.1.6"
}

variable "broadcast_address" {
  description = "Broadcast address for the subnet"
  type        = string
  default     = "192.168.1.255"
}

variable "domain_name" {
  description = "Domain name for DHCP clients"
  type        = string
  default     = null
  
  validation {
    condition     = var.domain_name == null || length(var.domain_name) <= 256
    error_message = "Domain name must not exceed 256 characters."
  }
}

variable "dns_servers" {
  description = "DNS servers for DHCP clients (max 3)"
  type        = list(string)
  default     = ["1.1.1.1"]
  
  validation {
    condition     = var.dns_servers == null || length(var.dns_servers) <= 3
    error_message = "Maximum 3 DNS servers are allowed."
  }
}

# Lease Time Configuration
variable "default_lease_time" {
  description = "Default lease time in seconds (300 to 4294967295)"
  type        = number
  default     = 43200
  
  validation {
    condition     = var.default_lease_time >= 300 && var.default_lease_time <= 4294967295
    error_message = "Default lease time must be between 300 and 4294967295 seconds."
  }
}

variable "max_lease_time" {
  description = "Maximum lease time in seconds (300 to 4294967295)"
  type        = number
  default     = 86400
  
  validation {
    condition     = var.max_lease_time >= 300 && var.max_lease_time <= 4294967295
    error_message = "Maximum lease time must be between 300 and 4294967295 seconds."
  }
}

# Context Configuration
variable "vrf_context_name" {
  description = "Name of the VRF context (alternative to vrf_context_id)"
  type        = string
  default     = null
}

variable "vrf_context_id" {
  description = "VRF context ID (used if vrf_context_name is not provided)"
  type        = string
  default     = "1732165509570014796"
}

variable "network_context_name" {
  description = "Name of the network context (alternative to network_context_id)"
  type        = string
  default     = null
}

variable "network_context_id" {
  description = "Network context ID (used if network_context_name is not provided)"
  type        = string
  default     = null
}

# Advanced Configuration
variable "static_mappings" {
  description = "Static IP address mappings for specific clients"
  type = list(object({
    name       = string
    ip_address = string
    mac        = optional(string)
    client_duid = optional(string)
  }))
  default = null
}

variable "custom_options" {
  description = "Custom DHCP options"
  type = list(object({
    option_definition = string
    option_value     = string
    vendor_class_identifier = optional(string)
  }))
  default = null
}

