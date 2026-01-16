# NAT Zone Basic Properties (Required)
variable "nat_zone_name" {
  description = "Name of the NAT zone"
  type        = string
  default     = "testing-zone"
  
  validation {
    condition     = length(var.nat_zone_name) <= 128
    error_message = "NAT zone name must not exceed 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the NAT zone"
  type        = string
  default     = "Corporate network NAT zone"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the NAT zone (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["nat", "zone", "internal"]
  
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

variable "default_for_public_interfaces" {
  description = "Whether this NAT zone is default for public interfaces"
  type        = bool
  default     = false
}