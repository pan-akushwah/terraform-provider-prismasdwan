# Probe Profile Basic Properties (Required)
variable "probe_profile_name" {
  description = "Name of the probe profile (max 128 characters)"
  type        = string
  default     = "Enterprise-Probe-Profile"
  
  validation {
    condition     = length(var.probe_profile_name) > 0 && length(var.probe_profile_name) <= 128
    error_message = "Probe profile name must be between 1 and 128 characters."
  }
}

variable "probe_config_ids" {
  description = "List of probe configuration names to resolve to IDs (max 8, no duplicates)"
  type        = list(string)
  default     = [
    "CloudFlare-DNS-ICMP-Response",
    "Production-Network-Probe"
  ]
  
  validation {
    condition     = length(var.probe_config_ids) > 0 && length(var.probe_config_ids) <= 8
    error_message = "Must specify between 1 and 8 probe configuration names."
  }
  
  validation {
    condition     = length(var.probe_config_ids) == length(distinct(var.probe_config_ids))
    error_message = "Probe configuration names must be unique (no duplicates allowed)."
  }
  
  validation {
    condition = alltrue([
      for name in var.probe_config_ids : length(name) > 0
    ])
    error_message = "All probe configuration names must be non-empty."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the probe profile (max 256 characters)"
  type        = string
  default     = "Enterprise probe profile for network monitoring and diagnostics"
  
  validation {
    condition     = var.description == null || length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the probe profile (max 10 tags, max 128 chars each, no commas or whitespace)"
  type        = list(string)
  default     = ["terraform", "probe", "monitoring", "enterprise"]
  
  validation {
    condition     = var.tags == null || length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = var.tags == null || alltrue([
      for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
}