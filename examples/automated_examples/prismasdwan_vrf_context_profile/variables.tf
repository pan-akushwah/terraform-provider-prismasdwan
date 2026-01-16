variable "vrf_context_profile_name" {
  description = "Name of the VRF context profile"
  type        = string
  default     = "Enterprise-VRF-Context-Profile"
}

variable "description" {
  description = "Description for the VRF context profile"
  type        = string
  default     = "Enterprise VRF context profile for network segmentation"
}

variable "tags" {
  description = "Tags for the VRF context profile"
  type        = list(string)
  default     = ["terraform", "vrf-context", "enterprise"]
}

variable "default_vrf_context_profile" {
  description = "Whether this is a default VRF context profile"
  type        = bool
  default     = false
}

variable "vrf_context_names" {
  description = "List of VRF context names to resolve to IDs"
  type        = list(string)
  default     = ["default", "management"]
}
