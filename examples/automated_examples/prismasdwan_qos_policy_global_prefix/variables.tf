# QoS Policy Global Prefix Basic Properties (Required)
variable "qos_policy_global_prefix_name" {
  description = "Name of the QoS policy global prefix"
  type        = string
  default     = "Enterprise-QoS-Global-Prefix"
  
  validation {
    condition     = length(var.qos_policy_global_prefix_name) > 0 && length(var.qos_policy_global_prefix_name) <= 128
    error_message = "QoS policy global prefix name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the QoS policy global prefix (max 256 characters)"
  type        = string
  default     = "Global QoS policy prefix for enterprise-wide priority traffic classification and bandwidth allocation"
}

variable "tags" {
  description = "Tags for the QoS policy global prefix (max 10 tags, max 128 chars each, no commas or whitespace)"
  type        = list(string)
  default     = ["terraform", "qos", "global-prefix", "priority", "enterprise"]
}

# IPv4 Prefixes
variable "ipv4_prefixes" {
  description = "List of IPv4 prefixes in CIDR notation"
  type        = list(string)
  default     = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16"
  ]
}

# IPv6 Prefixes
variable "ipv6_prefixes" {
  description = "List of IPv6 prefixes in CIDR notation"
  type        = list(string)
  default     = [
    "2001:db8::/32",
    "fd00::/8"
  ]
}