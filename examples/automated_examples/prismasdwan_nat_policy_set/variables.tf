# NAT Policy Set Basic Properties (Required)
variable "nat_policy_set_name" {
  description = "Name of the NAT policy set"
  type        = string
  default     = "TerraformTest1"
  
  validation {
    condition     = length(var.nat_policy_set_name) > 0 && length(var.nat_policy_set_name) <= 128
    error_message = "NAT policy set name must be between 1 and 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the NAT policy set (max 256 characters)"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the NAT policy set (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform"]
  
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

# Policy Rule Ordering
variable "source_zone_policyrule_order" {
  description = "Source zone policy rule order (list of rule IDs)"
  type        = list(string)
  default     = null
}

variable "destination_zone_policyrule_order" {
  description = "Destination zone policy rule order (list of rule IDs)"
  type        = list(string)
  default     = null
}

# Clone Configuration
variable "clone_from" {
  description = "ID of NAT policy set to clone from (max 20 digits)"
  type        = string
  default     = null
  
  validation {
    condition = var.clone_from == null || can(regex("^\\d{1,20}$", var.clone_from))
    error_message = "Clone from ID must be a numeric string with max 20 digits."
  }
}

# Policy Rules (Optional - can be managed separately)
variable "policy_rules" {
  description = "List of NAT policy rules to include in the set"
  type = list(object({
    name = string
    description = optional(string)
    tags = optional(list(string))
    enabled = optional(bool, true)
    
    # Zone IDs
    source_zone_id = optional(string)
    destination_zone_id = optional(string)
    
    # Prefix IDs
    source_prefixes_id = optional(string)
    destination_prefixes_id = optional(string)
    
    # Protocol and ports
    protocol = optional(number)  # 1-255
    source_ports = optional(list(object({
      from = number  # 1-65535
      to   = number  # 1-65535
    })))
    destination_ports = optional(list(object({
      from = number  # 1-65535
      to   = number  # 1-65535
    })))
    
    # Actions (required, 1-4 actions)
    actions = list(object({
      type = string  # "NO_NAT", "SOURCE_NAT_DYNAMIC", etc.
      nat_pool_id = optional(string)
      port = optional(number)  # 1-65535
      protocols = optional(list(string))  # For ALG_DISABLE
    }))
  }))
  default = null
}

# Transient Fields
variable "update_order" {
  description = "Update order (transient field)"
  type        = bool
  default     = null
}

variable "send_to_element" {
  description = "Send to element (transient field)"
  type        = bool
  default     = null
}

variable "policy_req_version" {
  description = "Policy request version (JsonIgnore field)"
  type        = string
  default     = null
}
