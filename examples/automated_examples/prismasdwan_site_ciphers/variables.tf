variable "site_name" {
  description = "Name of the site to configure ciphers for"
  type        = string
  default     = "Branch-Site-01"
}

variable "controller_connection_cipher" {
  description = "Controller connection cipher"
  type        = string
  default     = "RSA-AES256-GCM-SHA384"
  
  validation {
    condition = contains(["RSA-AES256-GCM-SHA384", "RSA-AES128-GCM-SHA256"], var.controller_connection_cipher)
    error_message = "Controller connection cipher must be either 'RSA-AES256-GCM-SHA384' or 'RSA-AES128-GCM-SHA256'."
  }
}

variable "vpn_ciphers" {
  description = "List of VPN ciphers (max 4 ciphers)"
  type        = list(string)
  default     = ["AES-256-GCM", "AES-128-GCM"]
  
  validation {
    condition = length(var.vpn_ciphers) <= 4
    error_message = "Maximum 4 VPN ciphers are allowed."
  }
}