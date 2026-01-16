# Global Prefix Filter Basic Properties (Required)
variable "global_prefix_filter_name" {
  description = "Name of the global prefix filter"
  type        = string
  default     = "Default-Global-Prefix-Filter"
  
  validation {
    condition     = length(var.global_prefix_filter_name) > 0 && length(var.global_prefix_filter_name) <= 128
    error_message = "Global prefix filter name must be between 1 and 128 characters."
  }
}

# Required Filters Configuration
variable "filters" {
  description = "Array of filter objects with type and IP prefixes"
  type = list(object({
    type        = string
    ip_prefixes = list(string)
  }))
  default = [
    {
      type = "ipv4"
      ip_prefixes = [
        "10.0.0.0/8",
        "172.16.0.0/12",
        "192.168.0.0/16"
      ]
    }
  ]
  
  validation {
    condition = alltrue([
      for filter in var.filters : filter.type == "ipv4"
    ])
    error_message = "All filters must have type 'ipv4'."
  }
  
  validation {
    condition = alltrue([
      for filter in var.filters : length(filter.ip_prefixes) > 0
    ])
    error_message = "Each filter must have at least one IP prefix."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the global prefix filter"
  type        = string
  default     = "Global prefix filter for network route management and BGP prefix advertisement control"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}