# Site Configuration (Required)
variable "site_name" {
  description = "Name of the site where the IPFix local prefix will be configured"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

# IPFix Local Prefix Configuration (Required)
variable "prefix_id" {
  description = "Unique identifier for the IPFix local prefix"
  type        = string
  default     = "ipfix-prefix-001"
  
  validation {
    condition     = length(var.prefix_id) > 0
    error_message = "Prefix ID is required and cannot be empty."
  }
}

# IPv4 Prefixes Configuration (Optional)
variable "ipv4_prefixes" {
  description = "List of IPv4 prefixes for IPFix local prefix configuration"
  type        = list(string)
  default     = ["192.168.1.0/24", "10.0.1.0/24"]
  
  validation {
    condition = var.ipv4_prefixes == null || alltrue([
      for prefix in var.ipv4_prefixes : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))
    ])
    error_message = "All IPv4 prefixes must be in valid CIDR format (e.g., 192.168.1.0/24)."
  }
  
  validation {
    condition = var.ipv4_prefixes == null || alltrue([
      for prefix in var.ipv4_prefixes : split("/", prefix)[1] != null && tonumber(split("/", prefix)[1]) >= 0 && tonumber(split("/", prefix)[1]) <= 32
    ])
    error_message = "All IPv4 prefixes must have valid subnet masks (0-32)."
  }
}

# Tags Configuration (Optional)
variable "tags" {
  description = "Tags for the IPFix local prefix configuration (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "ipfix", "monitoring"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = var.tags == null || alltrue([
      for tag in var.tags : length(tag) <= 128 && length(tag) > 0 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must be between 1 and 128 characters and cannot contain commas or whitespace."
  }
  
  validation {
    condition = var.tags == null || length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - duplicates are not allowed."
  }
}