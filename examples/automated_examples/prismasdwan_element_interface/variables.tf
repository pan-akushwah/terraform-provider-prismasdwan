# Required Variables
variable "interface_name" {
  description = "Name of the interface"
  type        = string
  default     = "Enterprise-WAN-Interface"
  
  validation {
    condition     = length(var.interface_name) > 0 && length(var.interface_name) <= 128
    error_message = "Interface name must be between 1 and 128 characters."
  }
}

variable "interface_type" {
  description = "Type of interface (ethernet, loopback, sub_interface, etc.)"
  type        = string
  default     = "sub_interface"
  
  validation {
    condition = contains([
      "ethernet", "loopback", "sub_interface", "cellular", "pppoe"
    ], var.interface_type)
    error_message = "Interface type must be one of: ethernet, loopback, sub_interface, cellular, pppoe."
  }
}

variable "used_for" {
  description = "What the interface is used for (public, private, loopback)"
  type        = string
  default     = "public"
  
  validation {
    condition = contains(["public", "private", "loopback"], var.used_for)
    error_message = "Used_for must be one of: public, private, loopback."
  }
}

variable "scope" {
  description = "Scope of the interface (LOCAL, GLOBAL)"
  type        = string
  default     = "LOCAL"
  
  validation {
    condition = contains(["LOCAL", "GLOBAL","local","global"], var.scope)
    error_message = "Scope must be either LOCAL or GLOBAL."
  }
}

variable "peer_bypasspair_wan_port_type" {
  description = "Peer bypass pair WAN port type"
  type        = string
  default     = "none"
  
  validation {
    condition = contains(["none", "ethernet", "cellular"], var.peer_bypasspair_wan_port_type)
    error_message = "Peer bypass pair WAN port type must be one of: none, ethernet, cellular."
  }
}

# Site and Element References
variable "site_id" {
  description = "Site ID (use either this or site_name)"
  type        = string
  default     = null
}

variable "site_name" {
  description = "Site name (alternative to site_id)"
  type        = string
  default     = "HQ-Site-Chicago"
}

variable "element_id" {
  description = "Element ID (use either this or element_name)"
  type        = string
  default     = null
}

variable "element_name" {
  description = "Element name (alternative to element_id)"
  type        = string
  default     = "HQ-ION-Device-01"
}

# Optional Basic Properties
variable "description" {
  description = "Description for the interface"
  type        = string
  default     = "Enterprise WAN interface for primary connectivity"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the interface (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "enterprise", "wan", "managed"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
}

variable "admin_up" {
  description = "Administrative state of the interface (true = up, false = down)"
  type        = bool
  default     = true
}

variable "mtu" {
  description = "Maximum Transmission Unit (MTU) for the interface"
  type        = number
  default     = 1500
  
  validation {
    condition = var.mtu >= 68 && var.mtu <= 9000
    error_message = "MTU must be between 68 and 9000 bytes."
  }
}