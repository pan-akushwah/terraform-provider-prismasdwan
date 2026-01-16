# Path Local Prefix Basic Properties (Required)
variable "path_local_prefix_name" {
  description = "Name of the path local prefix"
  type        = string
  default     = "Enterprise-Path-Local-Prefix"
  
  validation {
    condition     = length(var.path_local_prefix_name) > 0 && length(var.path_local_prefix_name) <= 128
    error_message = "Path local prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the path local prefix (max 256 characters)"
  type        = string
  default     = "Path local prefix for network policy routing and traffic classification"
}

variable "tags" {
  description = "Tags for the path local prefix (max 10 tags, max 128 chars each, no commas or whitespace)"
  type        = list(string)
  default     = ["terraform", "path", "local-prefix", "routing"]
}