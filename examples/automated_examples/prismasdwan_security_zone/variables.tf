# Security Zone Basic Properties (Required)
variable "zone_name" {
  description = "Name of the security zone"
  type        = string
  default     = "TerraformTest-SecurityZone"
  
  validation {
    condition     = length(var.zone_name) > 0 && length(var.zone_name) <= 128
    error_message = "Security zone name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the security zone (max 256 characters if provided)"
  type        = string
  default     = null
}

variable "tcp_allow_non_syn" {
  description = "Whether to allow TCP packets that are not SYN packets"
  type        = bool
  default     = null
}