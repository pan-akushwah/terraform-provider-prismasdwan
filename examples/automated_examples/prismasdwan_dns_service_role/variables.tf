# DNS Service Role Basic Properties (Required)
variable "dns_service_role_name" {
  description = "Name of the DNS service role"
  type        = string
  default     = "CorpDNSService"
  
  validation {
    condition     = length(var.dns_service_role_name) <= 128
    error_message = "DNS service role name must not exceed 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the DNS service role"
  type        = string
  default     = "Branch DNS Service Role"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the DNS service role (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["Terraform-Managed"]
  
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