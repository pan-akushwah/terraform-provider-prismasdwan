# NAT Policy Pool Basic Properties (Required)
variable "nat_policy_pool_name" {
  description = "Name of the NAT policy pool"
  type        = string
  default     = "TerraformTest-NAT-Policy-Pool"
  
  validation {
    condition     = length(var.nat_policy_pool_name) > 0 && length(var.nat_policy_pool_name) <= 128
    error_message = "NAT policy pool name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the NAT policy pool (max 256 characters)"
  type        = string
  default     = "Terraform managed NAT policy pool for dynamic address translation"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the NAT policy pool (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "nat", "policy-pool", "managed"]
  
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