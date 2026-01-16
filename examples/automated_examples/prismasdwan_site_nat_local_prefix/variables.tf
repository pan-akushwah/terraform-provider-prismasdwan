# Site Configuration (Required)
variable "site_name" {
  description = "Name of the site where the NAT local prefix will be configured"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

# NAT Prefix Configuration (Required)
variable "prefix_id" {
  description = "Prefix ID for the NAT local prefix (required)"
  type        = string
  default     = "nat-local-prefix-001"
  
  validation {
    condition     = length(var.prefix_id) > 0
    error_message = "Prefix ID is required and cannot be empty."
  }
}

# IPv4 Prefixes Configuration (Optional)
variable "ipv4_prefixes" {
  description = "List of IPv4 prefixes in CIDR notation (e.g., 192.168.1.0/24)"
  type        = list(string)
  default     = [
    "192.168.100.0/24",
    "192.168.101.0/24",
    "10.10.10.0/24"
  ]
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", prefix))
    ])
    error_message = "All IPv4 prefixes must be in valid CIDR notation (e.g., 192.168.1.0/24)."
  }
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : 
      tonumber(split("/", prefix)[1]) >= 8 && tonumber(split("/", prefix)[1]) <= 32
    ])
    error_message = "Subnet mask must be between /8 and /32."
  }
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes :
      alltrue([
        for octet in split(".", split("/", prefix)[0]) :
        tonumber(octet) >= 0 && tonumber(octet) <= 255
      ])
    ])
    error_message = "All octets in IPv4 addresses must be between 0 and 255."
  }
}

# Tags Configuration (Optional)
variable "tags" {
  description = "Tags for the site NAT local prefix (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "nat", "local-prefix", "site-specific"]
  
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