# Network Context Basic Properties (Required)
variable "context_name" {
  description = "Name of the network context"
  type        = string
  default     = "TerraformNetworkContext"
  
  validation {
    condition     = length(var.context_name) > 0 && length(var.context_name) <= 128
    error_message = "Context name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the network context"
  type        = string
  default     = "Network context managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}
