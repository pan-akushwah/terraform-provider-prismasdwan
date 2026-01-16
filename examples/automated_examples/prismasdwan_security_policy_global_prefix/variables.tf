# Security Policy Global Prefix Basic Properties (Required)
variable "prefix_name" {
  description = "Name of the security policy global prefix"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.prefix_name) > 0 && length(var.prefix_name) <= 128
    error_message = "Security policy global prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the security policy global prefix"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the security policy global prefix (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = []
}

variable "ipv4_prefixes" {
  description = "List of IPv4 prefixes in CIDR notation"
  type        = list(string)
  default     = ["1.1.1.0/24"]
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : can(cidrhost(prefix, 0))
    ])
    error_message = "All IPv4 prefixes must be valid CIDR notation (e.g., 192.168.1.0/24)."
  }
}

variable "ipv6_prefixes" {
  description = "List of IPv6 prefixes in CIDR notation"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for prefix in var.ipv6_prefixes : can(cidrhost(prefix, 0))
    ])
    error_message = "All IPv6 prefixes must be valid CIDR notation (e.g., 2001:db8::/32)."
  }
}