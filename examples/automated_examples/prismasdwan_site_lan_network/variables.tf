# Site LAN Network Basic Properties (Required)
variable "site_lan_network_name" {
  description = "Name of the site LAN network"
  type        = string
  default     = "Corp-LAN-Network"
  
  validation {
    condition     = length(var.site_lan_network_name) > 0 && length(var.site_lan_network_name) <= 128
    error_message = "Site LAN network name is required and must not exceed 128 characters."
  }
}

variable "scope" {
  description = "Network scope (GLOBAL or LOCAL)"
  type        = string
  default     = "local"
  
  validation {
    condition     = contains(["GLOBAL", "LOCAL" ,"local","global"], var.scope)
    error_message = "Scope must be either 'GLOBAL' or 'LOCAL'."
  }
}

variable "site_id" {
  description = "Site ID where the LAN network will be created"
  type        = string
  default     = "Site1"
  
  validation {
    condition     = var.site_id != null && length(var.site_id) > 0
    error_message = "Site ID is required for site LAN network creation."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the site LAN network"
  type        = string
  default     = "Corporate LAN network for site connectivity and local services"
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the site LAN network (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "lan", "corporate", "site-network"]
  
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

# VRF and Network Context
variable "vrf_context_id" {
  description = "VRF Context ID for the LAN network"
  type        = string
  default     = null
}

variable "network_context_id" {
  description = "Network Context ID for the LAN network"
  type        = string
  default     = null
  
  validation {
    condition = var.network_context_id == null || can(regex("^[0-9]+$", var.network_context_id))
    error_message = "Network Context ID must be a valid numeric string."
  }
}

# IPv4 Configuration
variable "ipv4_prefixes" {
  description = "IPv4 prefixes for the LAN network"
  type        = list(string)
  default     = ["192.168.1.0/24"]
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : can(cidrhost(prefix, 0))
    ])
    error_message = "All IPv4 prefixes must be valid CIDR notation."
  }
}

variable "ipv4_default_routers" {
  description = "IPv4 default routers for the LAN network"
  type        = list(string)
  default     = ["192.168.1.1"]
  
  validation {
    condition = alltrue([
      for router in var.ipv4_default_routers : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\/[0-9]{1,2})?$", router))
    ])
    error_message = "All default routers must be valid IPv4 addresses or CIDR notation."
  }
}

# IPv6 Configuration
variable "ipv6_prefixes" {
  description = "IPv6 prefixes for the LAN network"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for prefix in var.ipv6_prefixes : can(regex("^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}(/[0-9]{1,3})?$", prefix))
    ])
    error_message = "All IPv6 prefixes must be valid IPv6 CIDR notation."
  }
}

variable "ipv6_default_routers" {
  description = "IPv6 default routers for the LAN network"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for router in var.ipv6_default_routers : can(regex("^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}(/[0-9]{1,3})?$", router))
    ])
    error_message = "All IPv6 default routers must be valid IPv6 addresses or CIDR notation."
  }
}

# DHCP Server Configuration
variable "dhcp_server_enabled" {
  description = "Enable DHCP server for this LAN network"
  type        = bool
  default     = true
}

variable "dhcp_server_subnet" {
  description = "DHCP server subnet"
  type        = string
  default     = "192.168.1.0/24"
  
  validation {
    condition = var.dhcp_server_subnet == null || can(cidrhost(var.dhcp_server_subnet, 0))
    error_message = "DHCP server subnet must be valid CIDR notation."
  }
}

variable "dhcp_server_gateway" {
  description = "DHCP server gateway IP"
  type        = string
  default     = "192.168.1.1"
  
  validation {
    condition = var.dhcp_server_gateway == null || can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.dhcp_server_gateway))
    error_message = "DHCP server gateway must be a valid IPv4 address."
  }
}

variable "dhcp_server_broadcast_address" {
  description = "DHCP server broadcast address"
  type        = string
  default     = null
  
  validation {
    condition = var.dhcp_server_broadcast_address == null || can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.dhcp_server_broadcast_address))
    error_message = "DHCP server broadcast address must be a valid IPv4 address."
  }
}

variable "dhcp_server_ip_ranges" {
  description = "DHCP server IP ranges"
  type = list(object({
    start_ip = string
    end_ip   = string
  }))
  default = [
    {
      start_ip = "192.168.1.100"
      end_ip   = "192.168.1.200"
    }
  ]
  
  validation {
    condition = length(var.dhcp_server_ip_ranges) >= 1
    error_message = "At least one IP range must be provided for DHCP server."
  }
  
  validation {
    condition = alltrue([
      for range in var.dhcp_server_ip_ranges : 
      can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", range.start_ip)) &&
      can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", range.end_ip))
    ])
    error_message = "All IP range start and end addresses must be valid IPv4 addresses."
  }
}

variable "dhcp_server_default_lease_time" {
  description = "DHCP server default lease time in seconds (300 to 4294967295)"
  type        = number
  default     = 86400
  
  validation {
    condition     = var.dhcp_server_default_lease_time >= 300 && var.dhcp_server_default_lease_time <= 4294967295
    error_message = "Default lease time must be between 300 and 4294967295 seconds."
  }
}

variable "dhcp_server_max_lease_time" {
  description = "DHCP server maximum lease time in seconds (300 to 4294967295)"
  type        = number
  default     = 604800
  
  validation {
    condition     = var.dhcp_server_max_lease_time >= 300 && var.dhcp_server_max_lease_time <= 4294967295
    error_message = "Maximum lease time must be between 300 and 4294967295 seconds."
  }
}

variable "dhcp_server_dns_servers" {
  description = "DHCP server DNS servers (max 3)"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
  
  validation {
    condition     = length(var.dhcp_server_dns_servers) <= 3
    error_message = "Maximum 3 DNS servers are allowed."
  }
  
  validation {
    condition = alltrue([
      for dns in var.dhcp_server_dns_servers : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", dns))
    ])
    error_message = "All DNS servers must be valid IPv4 addresses."
  }
}

variable "dhcp_server_domain_name" {
  description = "DHCP server domain name"
  type        = string
  default     = "corp.local"
  
  validation {
    condition     = length(var.dhcp_server_domain_name) <= 256
    error_message = "Domain name must not exceed 256 characters."
  }
}

variable "dhcp_server_disabled" {
  description = "Disable DHCP server"
  type        = bool
  default     = false
}

variable "dhcp_server_description" {
  description = "DHCP server description"
  type        = string
  default     = "DHCP server for corporate LAN network"
  
  validation {
    condition     = length(var.dhcp_server_description) <= 256
    error_message = "DHCP server description must not exceed 256 characters."
  }
}

variable "dhcp_server_tags" {
  description = "DHCP server tags (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["dhcp", "corporate"]
  
  validation {
    condition     = length(var.dhcp_server_tags) <= 10
    error_message = "Maximum 10 DHCP server tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.dhcp_server_tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each DHCP server tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
}

variable "dhcp_server_network_context_id" {
  description = "DHCP server network context ID"
  type        = string
  default     = null
  
  validation {
    condition = var.dhcp_server_network_context_id == null || can(regex("^[0-9]+$", var.dhcp_server_network_context_id))
    error_message = "DHCP server network context ID must be a valid numeric string."
  }
}

# DHCP Server Static Mappings
variable "dhcp_server_static_mappings" {
  description = "DHCP server static IP to MAC address mappings"
  type = list(object({
    name       = string
    ip_address = string
    mac        = optional(string)
  }))
  default = []
  
    validation {
    condition = alltrue([
      for mapping in var.dhcp_server_static_mappings : 
      length(mapping.name) > 0 && length(mapping.name) <= 256 &&
      can(regex("^[a-zA-Z0-9]+(([a-zA-Z0-9\\-_])|(\\.[a-zA-Z0-9\\-]))*\\.?$", mapping.name)) &&
      can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", mapping.ip_address))
    ])
    error_message = "Static mapping names must be valid (1-256 chars, alphanumeric with hyphens/underscores) and IP addresses must be valid IPv4."
  }

  
  validation {
    condition = alltrue([
      for mapping in var.dhcp_server_static_mappings : 
      mapping.mac == null || can(regex("^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$", mapping.mac))
    ])
    error_message = "MAC addresses must be in format XX:XX:XX:XX:XX:XX."
  }
}

# DHCP Server Custom Options
variable "dhcp_server_custom_options" {
  description = "DHCP server custom options"
  type = list(object({
    option_definition = string
    option_value     = string
  }))
  default = []
  
  validation {
    condition = alltrue([
      for option in var.dhcp_server_custom_options : 
      length(option.option_definition) > 0 && length(option.option_definition) <= 1024 &&
      length(option.option_value) > 0 && length(option.option_value) <= 8192
    ])
    error_message = "Custom option definitions must be 1-1024 chars and values must be 1-8192 chars."
  }
}

# DHCP Relay Configuration
variable "dhcp_relay_enabled" {
  description = "Enable DHCP relay for this LAN network"
  type        = bool
  default     = false
}

variable "dhcp_relay_source_interface" {
  description = "DHCP relay source interface"
  type        = string
  default     = 1
  
  validation {
    condition = var.dhcp_relay_source_interface == null || length(var.dhcp_relay_source_interface) <= 256
    error_message = "DHCP relay source interface name must not exceed 256 characters."
  }
}

variable "dhcp_relay_server_ips" {
  description = "DHCP relay server IP addresses"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for ip in var.dhcp_relay_server_ips : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "All DHCP relay server IPs must be valid IPv4 addresses."
  }
}

# Network Policy Configuration
variable "ingress_traffic_policysetstack_id" {
  description = "Ingress traffic policy set stack ID"
  type        = string
  default     = null
}

variable "egress_traffic_policysetstack_id" {
  description = "Egress traffic policy set stack ID"
  type        = string
  default     = null
}

# Resource Dependencies (using names that will be resolved to IDs)
variable "site_name" {
  description = "Site name to resolve to site_id (alternative to direct site_id)"
  type        = string
  default     = null
}

variable "vrf_context_profile_name" {
  description = "VRF context profile name to resolve to ID"
  type        = string
  default     = null
}

variable "network_context_name" {
  description = "Network context name to resolve to ID"
  type        = string
  default     = null
}

variable "ingress_traffic_policysetstack_name" {
  description = "Ingress traffic policy set stack name to resolve to ID"
  type        = string
  default     = null
}

variable "egress_traffic_policysetstack_name" {
  description = "Egress traffic policy set stack name to resolve to ID"
  type        = string
  default     = null
}

# Extended Tags Configuration
variable "extended_tags" {
  description = "Extended tags for the site LAN network (max 10 tags)"
  type = list(object({
    key        = string
    value      = string
    value_type = string
  }))
  default = []
  
  validation {
    condition     = length(var.extended_tags) <= 10
    error_message = "Maximum 10 extended tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for etag in var.extended_tags : 
      length(etag.key) > 0 && length(etag.key) <= 128 &&
      length(etag.value) <= 256 &&
      contains(["STRING", "NUMBER", "BOOLEAN"], etag.value_type)
    ])
    error_message = "Extended tag keys must be 1-128 chars, values max 256 chars, and value_type must be STRING, NUMBER, or BOOLEAN."
  }
}
