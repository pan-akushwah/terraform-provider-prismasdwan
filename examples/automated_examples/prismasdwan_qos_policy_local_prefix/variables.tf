# QoS Policy Local Prefix Basic Properties (Required)
variable "qos_policy_local_prefix_name" {
  description = "Name of the QoS policy local prefix"
  type        = string
  default     = "Enterprise-QoS-Local-Prefix"
  
  validation {
    condition     = length(var.qos_policy_local_prefix_name) > 0 && length(var.qos_policy_local_prefix_name) <= 128
    error_message = "QoS policy local prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the QoS policy local prefix (max 256 characters)"
  type        = string
  default     = "QoS policy local prefix for priority traffic classification and bandwidth allocation"
}

variable "tags" {
  description = "Tags for the QoS policy local prefix (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "qos", "local-prefix", "priority"]
}