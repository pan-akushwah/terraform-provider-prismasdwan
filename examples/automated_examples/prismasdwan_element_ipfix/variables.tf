# Site and Element Configuration (Required)
variable "site_name" {
  description = "Name of the site where the element is located"
  type        = string
  
  validation {
    condition     = length(var.site_name) > 0 && length(var.site_name) <= 128
    error_message = "Site name must be between 1 and 128 characters."
  }
}

variable "element_name" {
  description = "Name of the element to configure IPFIX on"
  type        = string
  
  validation {
    condition     = length(var.element_name) > 0 && length(var.element_name) <= 128
    error_message = "Element name must be between 1 and 128 characters."
  }
}

# IPFIX Configuration Basic Properties (Required)
variable "ipfix_config_name" {
  description = "Name of the IPFIX configuration"
  type        = string
  
  validation {
    condition     = length(var.ipfix_config_name) > 0 && length(var.ipfix_config_name) <= 128
    error_message = "IPFIX configuration name must be between 1 and 128 characters."
  }
}

variable "ipfixprofile_name" {
  description = "Name of the IPFIX profile to use"
  type        = string
  
  validation {
    condition     = length(var.ipfixprofile_name) > 0
    error_message = "IPFIX profile name is required."
  }
}

# Optional IPFIX Template
variable "ipfixtemplate_name" {
  description = "Name of the IPFIX template to use (optional)"
  type        = string
  default     = ""
  
  validation {
    condition     = length(var.ipfixtemplate_name) <= 128
    error_message = "IPFIX template name must not exceed 128 characters."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the IPFIX configuration"
  type        = string
  default     = "Element IPFIX configuration for flow monitoring and analysis"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the IPFIX configuration (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "ipfix", "monitoring", "flow-analysis"]
  
  validation {
    condition     = length(var.tags) <= 10
    error_message = "Maximum 10 tags are allowed."
  }
  
  validation {
    condition = alltrue([
      for tag in var.tags : length(tag) <= 128 && length(tag) > 0
    ])
    error_message = "Each tag must be between 1 and 128 characters."
  }
}

# Export Configuration
variable "export_cache_timeout" {
  description = "Cache timeout for exporting flow records (10-600 seconds)"
  type        = number
  default     = 60
  
  validation {
    condition     = var.export_cache_timeout >= 10 && var.export_cache_timeout <= 600
    error_message = "Export cache timeout must be between 10 and 600 seconds."
  }
}

# Sampling Configuration
variable "sampler_algorithm" {
  description = "Sampling algorithm to use ('time_based' or 'none')"
  type        = string
  default     = "time_based"
  
  validation {
    condition     = contains(["time_based", "none"], var.sampler_algorithm)
    error_message = "Sampler algorithm must be either 'time_based' or 'none'."
  }
}

variable "sampler_time_interval" {
  description = "Time interval for sampling in seconds (1-3600, used when algorithm is 'time_based')"
  type        = number
  default     = 60
  
  validation {
    condition     = var.sampler_time_interval >= 1 && var.sampler_time_interval <= 3600
    error_message = "Sampler time interval must be between 1 and 3600 seconds."
  }
}

variable "sampler_time_spacing" {
  description = "Time spacing for sampling in seconds (1-3600, used when algorithm is 'time_based')"
  type        = number
  default     = 10
  
  validation {
    condition     = var.sampler_time_spacing >= 1 && var.sampler_time_spacing <= 3600
    error_message = "Sampler time spacing must be between 1 and 3600 seconds."
  }
}

# Collector Configuration (1-4 collectors supported)
variable "collector_configs" {
  description = "List of collector configurations (1-4 collectors max)"
  type = list(object({
    host                     = string
    host_port               = number
    protocol                = string
    max_message_size        = number
    ipfixcollectorcontext_name = string
  }))
  
  validation {
    condition     = length(var.collector_configs) >= 1 && length(var.collector_configs) <= 4
    error_message = "Must specify between 1 and 4 collectors."
  }
  
  validation {
    condition = alltrue([
      for collector in var.collector_configs : 
      length(collector.host) > 0 && 
      collector.host_port >= 1 && collector.host_port <= 65535 &&
      contains(["udp", "tcp"], collector.protocol) &&
      collector.max_message_size >= 512 && collector.max_message_size <= 65535
    ])
    error_message = "Each collector must have valid host, port (1-65535), protocol (udp/tcp), and message size (512-65535)."
  }
}

# Filter Configuration - Filter 1 (Enable/Disable)
variable "enable_filter_1" {
  description = "Enable or disable filter 1"
  type        = bool
  default     = false
}

# Filter 1 - WAN Path Direction
variable "filter_1_wan_path_direction" {
  description = "WAN path direction for filter 1 ('ingress', 'egress', or null for both)"
  type        = string
  default     = null
  
  validation {
    condition     = var.filter_1_wan_path_direction == null || contains(["ingress", "egress"], var.filter_1_wan_path_direction)
    error_message = "WAN path direction must be 'ingress', 'egress', or null."
  }
}

# Filter 1 - RTP Transport Type
variable "filter_1_rtp_transport_type" {
  description = "RTP transport type for filter 1"
  type        = string
  default     = null
  
  validation {
    condition     = var.filter_1_rtp_transport_type == null || length(var.filter_1_rtp_transport_type) <= 64
    error_message = "RTP transport type must not exceed 64 characters."
  }
}

# Filter 1 - Application Definitions
variable "app_def_name_1" {
  description = "Name of first application definition for filter 1"
  type        = string
  default     = ""
}

variable "app_def_name_2" {
  description = "Name of second application definition for filter 1"
  type        = string
  default     = ""
}

variable "app_def_name_3" {
  description = "Name of third application definition for filter 1"
  type        = string
  default     = ""
}

# Filter 1 - Priority Traffic Types
variable "filter_1_priority_traffic_types" {
  description = "List of priority traffic types for filter 1"
  type        = list(string)
  default     = []
  
  validation {
    condition     = length(var.filter_1_priority_traffic_types) <= 10
    error_message = "Maximum 10 priority traffic types allowed."
  }
}

# Filter 1 - Protocols
variable "filter_1_protocols" {
  description = "List of protocols for filter 1 (e.g., ['tcp', 'udp', 'icmp'])"
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for protocol in var.filter_1_protocols : 
      contains(["tcp", "udp", "icmp", "esp", "ah", "gre", "ipv6", "ospf", "pim"], lower(protocol))
    ])
    error_message = "Protocols must be valid network protocols (tcp, udp, icmp, esp, ah, gre, ipv6, ospf, pim)."
  }
}

# Filter 1 - Prefix Filters
variable "src_prefix_filter_name" {
  description = "Name of source prefix filter list for filter 1"
  type        = string
  default     = ""
}

variable "dst_prefix_filter_name" {
  description = "Name of destination prefix filter list for filter 1"
  type        = string
  default     = ""
}

# Filter 1 - IPFIX Filter Contexts
variable "ipfix_filter_context_name_1" {
  description = "Name of first IPFIX filter context for filter 1"
  type        = string
  default     = ""
}

variable "ipfix_filter_context_name_2" {
  description = "Name of second IPFIX filter context for filter 1"
  type        = string
  default     = ""
}

# Filter 1 - Source Port Configuration
variable "filter_1_enable_src_ports" {
  description = "Enable source port filtering for filter 1"
  type        = bool
  default     = false
}

variable "filter_1_src_port_start" {
  description = "Start of source port range for filter 1 (1-65535)"
  type        = number
  default     = 1
  
  validation {
    condition     = var.filter_1_src_port_start >= 1 && var.filter_1_src_port_start <= 65535
    error_message = "Source port start must be between 1 and 65535."
  }
}

variable "filter_1_src_port_end" {
  description = "End of source port range for filter 1 (1-65535)"
  type        = number
  default     = 65535
  
  validation {
    condition     = var.filter_1_src_port_end >= 1 && var.filter_1_src_port_end <= 65535
    error_message = "Source port end must be between 1 and 65535."
  }
}

# Filter 1 - Destination Port Configuration
variable "filter_1_enable_dst_ports" {
  description = "Enable destination port filtering for filter 1"
  type        = bool
  default     = false
}

variable "filter_1_dst_port_start" {
  description = "Start of destination port range for filter 1 (1-65535)"
  type        = number
  default     = 1
  
  validation {
    condition     = var.filter_1_dst_port_start >= 1 && var.filter_1_dst_port_start <= 65535
    error_message = "Destination port start must be between 1 and 65535."
  }
}

variable "filter_1_dst_port_end" {
  description = "End of destination port range for filter 1 (1-65535)"
  type        = number
  default     = 65535
  
  validation {
    condition     = var.filter_1_dst_port_end >= 1 && var.filter_1_dst_port_end <= 65535
    error_message = "Destination port end must be between 1 and 65535."
  }
}

# Cross-validation for port ranges
variable "validate_port_ranges" {
  description = "Internal variable for port range validation"
  type        = bool
  default     = true
  
  validation {
    condition = !var.filter_1_enable_src_ports || var.filter_1_src_port_start <= var.filter_1_src_port_end
    error_message = "Source port start must be less than or equal to source port end."
  }
  
  validation {
    condition = !var.filter_1_enable_dst_ports || var.filter_1_dst_port_start <= var.filter_1_dst_port_end
    error_message = "Destination port start must be less than or equal to destination port end."
  }
}

# Sampling validation
variable "validate_sampling_config" {
  description = "Internal variable for sampling configuration validation"
  type        = bool
  default     = true
  
  validation {
    condition = var.sampler_algorithm != "time_based" || var.sampler_time_spacing <= var.sampler_time_interval
    error_message = "When using time_based sampling, time_spacing must be less than or equal to time_interval."
  }
}
