# IPFIX Global Prefix Basic Properties (Required)
variable "prefix_name" {
  description = "Name of the IPFIX global prefix"
  type        = string
  default     = "Terraformtest1"
  
  validation {
    condition     = length(var.prefix_name) > 0 && length(var.prefix_name) <= 128
    error_message = "Prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the IPFIX global prefix"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the IPFIX global prefix (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "test", "ipfix"]
  
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
    error_message = "Tags must be unique - no duplicates allowed."
  }
}

variable "ipv4_prefixes" {
  description = "List of IPv4 prefixes in CIDR notation (max unlimited according to schema)"
  type        = list(string)
  default     = ["1.1.1.0/24"]
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : can(cidrhost(prefix, 0))
    ])
    error_message = "All IPv4 prefixes must be valid CIDR notation (e.g., 1.1.1.0/24)."
  }
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : 
      tonumber(split("/", prefix)[1]) >= 0 && tonumber(split("/", prefix)[1]) <= 32
    ])
    error_message = "All IPv4 prefixes must have valid subnet masks (0-32)."
  }
}