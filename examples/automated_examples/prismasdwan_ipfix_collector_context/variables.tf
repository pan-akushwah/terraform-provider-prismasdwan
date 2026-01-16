# IPFIX Collector Context Basic Properties (Required)
variable "context_name" {
  description = "Name of the IPFIX collector context"
  type        = string
  default     = "Terraformtest1"
  
  validation {
    condition     = length(var.context_name) > 0 && length(var.context_name) <= 128
    error_message = "Context name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the IPFIX collector context"
  type        = string
  default     = "This is managed by tf template."
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}