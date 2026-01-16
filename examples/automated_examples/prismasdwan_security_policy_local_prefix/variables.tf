# Security Policy Local Prefix Basic Properties (Required)
variable "prefix_name" {
  description = "Name of the security policy local prefix"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.prefix_name) > 0 && length(var.prefix_name) <= 128
    error_message = "Security policy local prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the security policy local prefix"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the security policy local prefix (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = []
}