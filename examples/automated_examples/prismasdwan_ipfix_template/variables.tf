# IPFIX Template Basic Properties (Required)
variable "template_name" {
  description = "Name of the IPFIX template"
  type        = string
  default     = "Terraformtesttemplate"
  
  validation {
    condition     = length(var.template_name) > 0 && length(var.template_name) <= 128
    error_message = "Template name must be between 1 and 128 characters."
  }
}

# Required: Flow Fields
variable "flow_fields" {
  description = "Flow fields for the IPFIX template (required, max 128 fields)"
  type        = list(string)
  default = [
    "TIME_STAMPS",
    "DST_IPV4_ADDRESS", 
    "DST_PORT",
    "SRC_IPV4_ADDRESS",
    "SRC_PORT", 
    "PROTOCOL",
    "CONNECTION_UNIFLOW_BYTES",
    "CONNECTION_UNIFLOW_PACKETS",
    "DSCP_LAST",
    "APP_DEF_ID",
    "APPLICATION_HOST"
  ]
  
  validation {
    condition     = length(var.flow_fields) > 0 && length(var.flow_fields) <= 128
    error_message = "Flow fields are required and maximum 128 fields are allowed."
  }
  
  validation {
    condition = alltrue([
      for field in var.flow_fields : contains([
        "INTERFACES", "TIME_STAMPS", "DST_IPV4_ADDRESS", "DST_PORT", 
        "SRC_IPV4_ADDRESS", "SRC_PORT", "PROTOCOL", "DSCP_MAP", "DSCP_LAST", 
        "QOS_QUEUE", "WAN_PATH", "APP_DEF_ID", "RTP_TRANSPORT_TYPE", 
        "TRANSPORT_TCP_WINDOWSIZE", "CONNECTION_UNIFLOW_BYTES", 
        "CONNECTION_UNIFLOW_PACKETS", "CONNECTION_BIFLOW_BYTES", 
        "CONNECTION_BIFLOW_PACKETS", "CONNECTION_RTT", "CONNECTION_NTT", 
        "CONNECTION_SRT", "APPLICATION_HOST", "CONNECTION_INIT", 
        "CONNECTION_XACT", "CONNECTION_UDPTRT", "MEDIA_CODEC", 
        "MEDIA_JITTER", "MEDIA_LOSS", "MEDIA_MOS", "TROUBLESHOOT_TCP", 
        "TROUBLESHOOT_DECISION_MAP"
      ], field)
    ])
    error_message = "All flow fields must be valid enum values."
  }
}

# Required: Options
variable "options" {
  description = "Options for the IPFIX template (required, max 8 options)"
  type        = list(string)
  default     = ["APP_DEF_ID_TABLE"]
  
  validation {
    condition     = length(var.options) >= 0 && length(var.options) <= 8
    error_message = "Maximum 8 options are allowed."
  }
  
  validation {
    condition = alltrue([
      for option in var.options : contains([
        "APP_DEF_ID_TABLE", "LINK_QUALITY_METRICS", "WAN_PATH_ID_TABLE", 
        "TYPE_INFO_FOR_IPFIX_IE", "DEVICE_IDENTIFICATION"
      ], option)
    ])
    error_message = "All options must be valid enum values."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the IPFIX template"
  type        = string
  default     = "This is managed by Terraform"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the IPFIX template (max 10 unique tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "ipfixtemplate"]
  
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
  
  validation {
    condition = length(var.tags) == length(distinct(var.tags))
    error_message = "Tags must be unique - no duplicates allowed."
  }
}

variable "generate_biflow" {
  description = "Whether to generate biflow"
  type        = bool
  default     = false
}

variable "template_export_timeout" {
  description = "Template export timeout in seconds (10-86400)"
  type        = number
  default     = 600
  
  validation {
    condition     = var.template_export_timeout >= 10 && var.template_export_timeout <= 86400
    error_message = "Template export timeout must be between 10 and 86400 seconds."
  }
}

variable "option_export_timeout" {
  description = "Option export timeout in seconds (10-86400)"
  type        = number
  default     = 600
  
  validation {
    condition     = var.option_export_timeout >= 10 && var.option_export_timeout <= 86400
    error_message = "Option export timeout must be between 10 and 86400 seconds."
  }
}