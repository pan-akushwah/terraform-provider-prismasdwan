# Site Configuration (Required)
variable "site_name" {
  description = "Name of the site where the IoT device ID configuration will be applied"
  type        = string
  default     = "Branch-Office-Site"
  
  validation {
    condition     = length(var.site_name) > 0
    error_message = "Site name is required and cannot be empty."
  }
}

# IoT Device ID Configuration
variable "cfg_device_id_enabled" {
  description = "Enable or disable device ID configuration for IoT devices at the site"
  type        = bool
  default     = true
}