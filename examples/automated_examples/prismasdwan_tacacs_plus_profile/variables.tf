# TACACS+ Profile Basic Properties (Required)
variable "tacacs_plus_profile_name" {
  description = "Name of the TACACS+ profile"
  type        = string
  default     = "Enterprise-TACACS-Profile"
  
  validation {
    condition     = length(var.tacacs_plus_profile_name) > 0 && length(var.tacacs_plus_profile_name) <= 128
    error_message = "TACACS+ profile name is required and must not exceed 128 characters."
  }
}

variable "authentication_protocol" {
  description = "Authentication protocol for TACACS+ (pap or chap)"
  type        = string
  default     = "pap"
  
  validation {
    condition     = contains(["pap", "chap"], var.authentication_protocol)
    error_message = "Authentication protocol must be either 'pap' or 'chap'."
  }
}

# TACACS+ Servers Configuration (Required - 1 to 4 servers)
variable "tacacs_plus_servers" {
  description = "List of TACACS+ servers (minimum 1, maximum 4 servers)"
  type = list(object({
    server_ip   = optional(string)
    server_ipv6 = optional(string)
    server_fqdn = optional(string)
    server_port = optional(number, 49)
    timeout     = optional(number, 5)
    secret      = string
  }))
  default = [
    {
      server_ip   = "192.168.100.10"
      server_port = 49
      timeout     = 5
      secret      = "tacacs-secret-key-001"
    },
    {
      server_fqdn = "tacacs-backup.company.com"
      server_port = 49
      timeout     = 10
      secret      = "tacacs-secret-key-002"
    }
  ]
  
  validation {
    condition     = length(var.tacacs_plus_servers) >= 1 && length(var.tacacs_plus_servers) <= 4
    error_message = "Must specify between 1 and 4 TACACS+ servers."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      (server.server_ip != null && server.server_ip != "") ||
      (server.server_ipv6 != null && server.server_ipv6 != "") ||
      (server.server_fqdn != null && server.server_fqdn != "")
    ])
    error_message = "Each TACACS+ server must have either server_ip, server_ipv6, or server_fqdn specified."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      server.secret != null && server.secret != ""
    ])
    error_message = "All TACACS+ servers must have a non-empty secret."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      server.server_port != null ? (server.server_port >= 1 && server.server_port <= 65535) : true
    ])
    error_message = "Server port must be between 1 and 65535."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      server.timeout != null ? (server.timeout >= 1 && server.timeout <= 60) : true
    ])
    error_message = "Timeout must be between 1 and 60 seconds."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      server.server_ip != null ? can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", server.server_ip)) : true
    ])
    error_message = "Server IP must be a valid IPv4 address."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      server.server_ipv6 != null ? can(regex("^([0-9a-fA-F:]+)$", server.server_ipv6)) : true
    ])
    error_message = "Server IPv6 must be a valid IPv6 address."
  }
  
  validation {
    condition = alltrue([
      for server in var.tacacs_plus_servers : 
      server.server_fqdn != null ? can(regex("^[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", server.server_fqdn)) : true
    ])
    error_message = "Server FQDN must be a valid domain name."
  }
}

# Optional Properties
variable "description" {
  description = "Description for the TACACS+ profile"
  type        = string
  default     = "Enterprise TACACS+ profile for centralized authentication, authorization, and accounting"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the TACACS+ profile (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "tacacs", "authentication", "enterprise", "aaa"]
  
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
    error_message = "All tags must be unique."
  }
}