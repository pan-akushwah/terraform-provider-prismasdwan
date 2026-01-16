# Site Basic Properties (Required)
variable "site_name" {
  description = "Name of the site"
  type        = string
  default     = "Enterprise-Branch-Site"
  
  validation {
    condition     = length(var.site_name) > 0 && length(var.site_name) <= 128
    error_message = "Site name must be between 1 and 128 characters."
  }
}

variable "element_cluster_role" {
  description = "Element cluster role for the site (required)"
  type        = string
  default     = "SPOKE"
  
  validation {
    condition = contains([
      "SPOKE", "HUB", "TRANSIT", "EDGE", "DC", "BRANCH", 
      "PRIMARY", "SECONDARY", "STANDALONE"
    ], var.element_cluster_role)
    error_message = "Invalid element cluster role. Must be a valid ElementClusterRole enum."
  }
}

variable "admin_state" {
  description = "Administrative state of the site (required)"
  type        = string
  default     = "active"
  
  validation {
    condition = contains([
      "active", "inactive", "disabled", "pending"
    ], var.admin_state)
    error_message = "Invalid admin state. Must be a valid SiteState enum."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the site"
  type        = string
  default     = "Enterprise branch site with SDWAN connectivity and security services"
  
  validation {
    condition     = length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the site (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "branch", "enterprise", "sdwan"]
  
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

# Extended Tags Configuration
variable "extended_tags" {
  description = "Extended tags for the site (max 10 extended tags)"
  type = list(object({
    key        = string
    value      = string
    value_type = optional(string)
  }))
  default = []
  
  validation {
    condition     = length(var.extended_tags) <= 10
    error_message = "Maximum 10 extended tags are allowed."
  }
}

# Site Configuration Flags
variable "app_acceleration_enabled" {
  description = "Whether application acceleration is enabled"
  type        = bool
  default     = true
}

variable "prefer_lan_default_over_wan_default_route" {
  description = "Whether to prefer LAN default over WAN default route"
  type        = bool
  default     = false
}

variable "branch_gateway" {
  description = "Whether this site acts as a branch gateway"
  type        = bool
  default     = false
}

# Policy Set Stack IDs (Resource Name Resolution)
variable "security_policysetstack_name" {
  description = "Name of security policy set stack to attach"
  type        = string
  default     = null
}

variable "security_policyset_name" {
  description = "Name of security policy set to attach"
  type        = string
  default     = null
}

variable "network_policysetstack_name" {
  description = "Name of network policy set stack to attach"
  type        = string
  default     = null
}

variable "nat_policysetstack_name" {
  description = "Name of NAT policy set stack to attach"
  type        = string
  default     = null
}

variable "priority_policysetstack_name" {
  description = "Name of priority policy set stack to attach"
  type        = string
  default     = null
}

variable "perfmgmt_policysetstack_name" {
  description = "Name of performance management policy set stack to attach"
  type        = string
  default     = null
}

variable "policy_set_name" {
  description = "Name of general policy set to attach"
  type        = string
  default     = null
}

# VRF and Multicast Configuration
variable "vrf_context_profile_name" {
  description = "Name of VRF context profile to attach"
  type        = string
  default     = null
}

variable "multicast_peer_group_name" {
  description = "Name of multicast peer group to attach"
  type        = string
  default     = null
}

variable "service_binding_name" {
  description = "Name of service binding to attach"
  type        = string
  default     = null
}
# SGI Configuration
variable "sgi_config" {
  description = "SGI configuration for the site"
  type = object({
    sgi_vendor_id = string
    sgi_tag       = number
  })
  default = null
  
  validation {
    condition = var.sgi_config == null ? true : (
      var.sgi_config.sgi_vendor_id == "SGI_VENDOR_ID_TYPE_8909" &&
      var.sgi_config.sgi_tag >= 1 && 
      var.sgi_config.sgi_tag <= 65533
    )
    error_message = "When provided, SGI vendor ID must be 'SGI_VENDOR_ID_TYPE_8909' and SGI tag must be between 1 and 65533."
  }
}
# Location Configuration
variable "location" {
  description = "Geographic location of the site"
  type = object({
    description = optional(string)
    latitude    = optional(number)
    longitude   = optional(number)
  })
  default = {
    description = "Enterprise Branch Office"
    latitude    = 37.7749
    longitude   = -122.4194
  }
  
  validation {
    condition = var.location == null || (
      (var.location.latitude == null || (var.location.latitude >= -90 && var.location.latitude <= 90)) &&
      (var.location.longitude == null || (var.location.longitude >= -180 && var.location.longitude <= 180))
    )
    error_message = "Latitude must be between -90 and 90, longitude must be between -180 and 180."
  }
}

# Address Configuration
variable "address" {
  description = "Physical address of the site"
  type = object({
    street    = optional(string)
    street2   = optional(string)
    city      = optional(string)
    state     = optional(string)
    post_code = optional(string)
    country   = optional(string)
  })
  default = {
    street    = "123 Business Avenue"
    city      = "San Francisco"
    state     = "CA"
    post_code = "94102"
    country   = "United States"
  }
  
  validation {
    condition = var.address == null || alltrue([
      for field, value in var.address : 
      value == null || length(value) <= 100
    ])
    error_message = "All address fields must not exceed 100 characters."
  }
}