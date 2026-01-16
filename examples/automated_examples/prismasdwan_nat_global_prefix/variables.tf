# NAT Global Prefix Basic Properties (Required)
variable "nat_global_prefix_name" {
  description = "Name of the NAT global prefix"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.nat_global_prefix_name) > 0 && length(var.nat_global_prefix_name) <= 128
    error_message = "NAT global prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the NAT global prefix (max 256 characters)"
  type        = string
  default     = "This is Managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the NAT global prefix (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["Terraform"]
  
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

variable "ipv4_prefixes" {
  description = "List of IPv4 prefixes in CIDR notation (no maximum size limit)"
  type        = list(string)
  default     = ["1.1.1.0/24"]
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : can(cidrhost(prefix, 0))
    ])
    error_message = "All IPv4 prefixes must be valid CIDR notation (e.g., 192.168.1.0/24)."
  }
  
  validation {
    condition = alltrue([
      for prefix in var.ipv4_prefixes : !startswith(prefix, "255.")
    ])
    error_message = "IPv4 prefixes cannot use broadcast addresses (starting with 255.)."
  }
}