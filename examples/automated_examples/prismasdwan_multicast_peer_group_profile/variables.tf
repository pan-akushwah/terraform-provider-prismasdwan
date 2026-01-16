# Multicast Peer Group Profile Basic Properties (Required)
variable "multicast_peer_group_name" {
  description = "Name of the multicast peer group profile"
  type        = string
  default     = "Enterprise-Multicast-Peer-Group"
  
  validation {
    condition     = length(var.multicast_peer_group_name) > 0 && length(var.multicast_peer_group_name) <= 128
    error_message = "Multicast peer group name is required and must not exceed 128 characters."
  }
}

# Peer Sites Configuration (Required)
variable "peer_site_names" {
  description = "List of peer site names to include in the multicast peer group (at least one site required)"
  type        = list(string)
  default     = [
    "Branch-Office-1",
    "Branch-Office-2",
    "Data-Center-1",
    "Regional-Hub"
  ]
  
  validation {
    condition     = length(var.peer_site_names) > 0
    error_message = "At least one peer site must be specified."
  }
  
  validation {
    condition = alltrue([
      for site_name in var.peer_site_names : length(site_name) > 0
    ])
    error_message = "All peer site names must be non-empty."
  }
  
  validation {
    condition = length(var.peer_site_names) == length(distinct(var.peer_site_names))
    error_message = "All peer site names must be unique."
  }
  
  validation {
    condition     = length(var.peer_site_names) <= 100
    error_message = "Maximum 100 peer sites are allowed in a multicast peer group."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the multicast peer group profile"
  type        = string
  default     = "Enterprise multicast peer group for efficient content distribution and real-time communication"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the multicast peer group profile (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "multicast", "peer-group", "content-distribution", "real-time"]
  
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
  
  validation {
    condition = length(var.tags) == length(distinct(var.tags))
    error_message = "All tags must be unique."
  }
}

variable "is_source_site_receiver" {
  description = "Whether the source site can also be a receiver in the multicast group"
  type        = bool
  default     = false
  
  validation {
    condition = contains([true, false], var.is_source_site_receiver)
    error_message = "is_source_site_receiver must be either true or false."
  }
}