# Site and Element Configuration (Required)
variable "site_name" {
  description = "Name of the site where the element is located"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

variable "element_name" {
  description = "Name of the element where the multicast RP will be configured"
  type        = string
  default     = "BR-SITE1-ELEM1"
  
  validation {
    condition     = length(var.element_name) > 0
    error_message = "Element name is required and cannot be empty."
  }
}

# Multicast RP Configuration (Required)
variable "rp_name" {
  description = "Name of the multicast Rendezvous Point (RP)"
  type        = string
  default     = "Corporate-RP-001"
  
  validation {
    condition     = length(var.rp_name) > 0 && length(var.rp_name) <= 128
    error_message = "RP name is required and must not exceed 128 characters."
  }
}

variable "ipv4_address" {
  description = "IPv4 address of the multicast Rendezvous Point"
  type        = string
  default     = "192.168.100.1"
  
  validation {
    condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.ipv4_address))
    error_message = "IPv4 address must be a valid IPv4 address format."
  }
  
  validation {
    condition = alltrue([
      for octet in split(".", var.ipv4_address) : tonumber(octet) >= 0 && tonumber(octet) <= 255
    ])
    error_message = "IPv4 address octets must be between 0 and 255."
  }
}

# Multicast Groups Configuration (Required)
variable "multicast_groups" {
  description = "List of multicast groups assigned to this RP (max 1024 groups)"
  type = list(object({
    name        = string
    ipv4_prefix = string
  }))
  default = [
    {
      name        = "video-streaming"
      ipv4_prefix = "224.1.1.0/24"
    },
    {
      name        = "audio-conference"
      ipv4_prefix = "224.2.1.0/24"
    }
  ]
  
  validation {
    condition     = length(var.multicast_groups) > 0 && length(var.multicast_groups) <= 1024
    error_message = "Must specify between 1 and 1024 multicast groups."
  }
  
  validation {
    condition = alltrue([
      for group in var.multicast_groups : length(group.name) > 0
    ])
    error_message = "All multicast group names must be non-empty."
  }
  
  validation {
    condition = alltrue([
      for group in var.multicast_groups : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", group.ipv4_prefix))
    ])
    error_message = "All multicast group IPv4 prefixes must be in valid CIDR format."
  }
  
  validation {
    condition = alltrue([
      for group in var.multicast_groups : 
      tonumber(split("/", group.ipv4_prefix)[1]) >= 4 && tonumber(split("/", group.ipv4_prefix)[1]) <= 32
    ])
    error_message = "All multicast group subnet masks must be between /4 and /32."
  }
  
  validation {
    condition = alltrue([
      for group in var.multicast_groups : 
      tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) >= 224 && 
      tonumber(split(".", split("/", group.ipv4_prefix)[0])[0]) <= 239
    ])
    error_message = "All multicast group addresses must be in the multicast range (224.0.0.0 to 239.255.255.255)."
  }
  
  validation {
    condition = length(var.multicast_groups) == length(distinct([for group in var.multicast_groups : group.name]))
    error_message = "Multicast group names must be unique."
  }
}

# Optional Configuration
variable "description" {
  description = "Description for the multicast RP configuration"
  type        = string
  default     = "Multicast Rendezvous Point for corporate video and audio streaming"
  
  validation {
    condition     = var.description == null || length(var.description) <= 1024
    error_message = "Description must not exceed 1024 characters."
  }
}

variable "tags" {
  description = "Tags for the multicast RP configuration (max 10 tags, max 1024 chars each)"
  type        = list(string)
  default     = ["terraform", "multicast", "rp", "video", "audio"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = var.tags == null || alltrue([
      for tag in var.tags : length(tag) <= 1024 && length(tag) > 0 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must be between 1 and 1024 characters and cannot contain commas or whitespace."
  }
  
  validation {
    condition = var.tags == null || length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - duplicates are not allowed."
  }
}