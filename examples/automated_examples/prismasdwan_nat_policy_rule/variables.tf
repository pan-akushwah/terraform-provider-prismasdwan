# NAT Policy Set Configuration (Required for NAT Policy Rule)
variable "nat_policy_set_name" {
  description = "Name of the NAT policy set where the rule will be created (used for resource locator)"
  type        = string
  default     = "Enterprise-NAT-Policy-Set"
  
  validation {
    condition     = length(var.nat_policy_set_name) > 0
    error_message = "NAT policy set name is required and cannot be empty."
  }
}

# NAT Policy Rule Basic Properties (Required)
variable "nat_policy_rule_name" {
  description = "Name of the NAT policy rule"
  type        = string
  default     = "Enterprise-Source-NAT-Rule"
  
  validation {
    condition     = length(var.nat_policy_rule_name) > 0 && length(var.nat_policy_rule_name) <= 128
    error_message = "NAT policy rule name is required and must not exceed 128 characters."
  }
}
# NAT Actions (Required - 1 to 4 actions)
variable "nat_actions" {
  description = "List of NAT actions for the rule (1-4 actions max)"
  type = list(object({
    type         = string
    nat_pool_id  = optional(string)
    port         = optional(number)
    protocols    = optional(list(string))
  }))
  default = [
    {
      type = "SOURCE_NAT_DYNAMIC"
      nat_pool_id = null
      port = null
      protocols = null
    }
  ]
  
  validation {
    condition     = length(var.nat_actions) >= 1 && length(var.nat_actions) <= 4
    error_message = "Must specify between 1 and 4 NAT actions."
  }
  
  validation {
    condition = alltrue([
      for action in var.nat_actions : contains([
        "NO_NAT", "SOURCE_NAT_DYNAMIC", "SOURCE_NAT_STATIC", 
        "DESTINATION_NAT_DYNAMIC", "DESTINATION_NAT_STATIC", "ALG_DISABLE","no_nat"
      ], action.type)
    ])
    error_message = "Invalid NAT action type. Must be one of: NO_NAT, SOURCE_NAT_DYNAMIC, SOURCE_NAT_STATIC, DESTINATION_NAT_DYNAMIC, DESTINATION_NAT_STATIC, ALG_DISABLE."
  }
  
  validation {
    condition = alltrue([
      for action in var.nat_actions : 
      action.port == null || (action.port != null && action.port >= 1 && action.port <= 65535)
    ])
    error_message = "NAT action port must be between 1 and 65535."
  }
  
  validation {
    condition = alltrue([
      for action in var.nat_actions :
      action.protocols == null || (
        action.protocols != null &&
        length(action.protocols) <= 4 &&
        alltrue([
          for protocol in action.protocols : 
          contains(["sip", "ftp", "tftp", "pptp"], protocol)
        ])
      )
    ])
    error_message = "Invalid protocols for ALG_DISABLE. Supports max 4 protocols from: sip, ftp, tftp, pptp."
  }
}
# Optional Properties
variable "description" {
  description = "Description for the NAT policy rule"
  type        = string
  default     = "Enterprise NAT policy rule for outbound traffic source NAT"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the NAT policy rule (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "nat", "enterprise", "outbound"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
    ])
    error_message = "Each tag must not exceed 128 characters and cannot contain commas or whitespace."
  }
}

variable "enabled" {
  description = "Whether the NAT policy rule is enabled"
  type        = bool
  default     = true
}

variable "disabled" {
  description = "Whether the NAT policy rule is disabled"
  type        = bool
  default     = false
}

variable "disabled_reason" {
  description = "Reason for disabling the rule"
  type        = string
  default     = "just disabled"
  
  validation {
    condition     = var.disabled_reason == null || length(var.disabled_reason) <= 5000
    error_message = "Disabled reason must not exceed 5000 characters."
  }
}

variable "inactive" {
  description = "Whether the NAT policy rule is inactive"
  type        = bool
  default     = false
}

variable "inactive_reason" {
  description = "Reason for marking the rule as inactive"
  type        = string
  default     = "just disabled"
  
  validation {
    condition     = var.inactive_reason == null || length(var.inactive_reason) <= 5000
    error_message = "Inactive reason must not exceed 5000 characters."
  }
}

# Traffic Classification
variable "protocol" {
  description = "Protocol number (1-255)"
  type        = number
  default     = null
  
  validation {
    condition     = var.protocol == null || (var.protocol >= 1 && var.protocol <= 255)
    error_message = "Protocol must be between 1 and 255."
  }
}

variable "source_ports" {
  description = "Source port ranges (max 16 ranges)"
  type = list(object({
    from = number
    to   = number
  }))
  default = []
  
  validation {
    condition     = length(var.source_ports) <= 16
    error_message = "Maximum 16 source port ranges are allowed."
  }
  
  validation {
    condition = alltrue([
      for port_range in var.source_ports : 
      port_range.from >= 1 && port_range.from <= 65535 &&
      port_range.to >= 1 && port_range.to <= 65535 &&
      port_range.from <= port_range.to
    ])
    error_message = "Port ranges must be between 1-65535 and 'from' must be <= 'to'."
  }
}

variable "destination_ports" {
  description = "Destination port ranges (max 16 ranges)"
  type = list(object({
    from = number
    to   = number
  }))
  default = []
  
  validation {
    condition     = length(var.destination_ports) <= 16
    error_message = "Maximum 16 destination port ranges are allowed."
  }
  
  validation {
    condition = alltrue([
      for port_range in var.destination_ports : 
      port_range.from >= 1 && port_range.from <= 65535 &&
      port_range.to >= 1 && port_range.to <= 65535 &&
      port_range.from <= port_range.to
    ])
    error_message = "Port ranges must be between 1-65535 and 'from' must be <= 'to'."
  }
}
# Zone Configuration (Optional)
variable "source_zone_name" {
  description = "Name of source zone for the NAT rule (optional)"
  type        = string
  default     = "LAN-Zone"
  
  validation {
    condition     = var.source_zone_name == null || var.source_zone_name != ""
    error_message = "Source zone name must be non-empty if specified."
  }
}

variable "destination_zone_name" {
  description = "Name of destination zone for the NAT rule (optional)"
  type        = string
  default     = "WAN-Zone"
  
  validation {
    condition     = var.destination_zone_name == null || var.destination_zone_name != ""
    error_message = "Destination zone name must be non-empty if specified."
  }
}
# Prefix Configuration
variable "source_prefixes_name" {
  description = "Name of source prefix list to match"
  type        = string
  default     = null
}

variable "destination_prefixes_name" {
  description = "Name of destination prefix list to match"
  type        = string
  default     = null
}

# NAT Pool Names (for dynamic NAT actions)
variable "nat_pool_names" {
  description = "List of NAT pool names to be resolved to IDs for actions"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for name in var.nat_pool_names : length(name) > 0 && length(name) <= 128
    ])
    error_message = "NAT pool names must be non-empty and not exceed 128 characters."
  }
}