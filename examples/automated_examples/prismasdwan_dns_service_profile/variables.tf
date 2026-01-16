# DNS Service Profile Basic Properties (Required)
variable "dns_service_profile_name" {
  description = "Name of the DNS service profile"
  type        = string
  default     = "Enterprise-DNS-Service-Profile"
  
  validation {
    condition     = length(var.dns_service_profile_name) > 0 && length(var.dns_service_profile_name) <= 128
    error_message = "DNS service profile name must be between 1 and 128 characters."
  }
}

variable "description" {
  description = "Description for the DNS service profile"
  type        = string
  default     = "Enterprise DNS service profile for comprehensive DNS resolution, caching, and security"
  
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description must not exceed 256 characters."
  }
}

variable "tags" {
  description = "Tags for the DNS service profile (max 10 tags, max 128 chars each)"
  type        = list(string)
  default     = ["terraform", "dns", "enterprise", "networking"]
  
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

# DNS Forward Configuration (Required)
variable "dns_servers" {
  description = "List of DNS servers for forwarding"
  type = list(object({
    dnsserver_ip              = string
    dnsserver_port           = optional(number, 53)
    timeout                  = optional(number, 5)
    secret                   = optional(string)
    address_family           = optional(string, "ipv4")
    source_port              = optional(number)
    forward_dnsservicerole_id = optional(string)
    domain_names             = optional(list(string))
    ip_prefix                = optional(string)
  }))
  default = [
    {
      dnsserver_ip   = "8.8.8.8"
      dnsserver_port = 53
      timeout        = 5
      address_family = "ipv4"
    },
    {
      dnsserver_ip   = "8.8.4.4"
      dnsserver_port = 53
      timeout        = 5
      address_family = "ipv4"
    }
  ]
  
  validation {
    condition = alltrue([
      for server in var.dns_servers : server.dnsserver_ip != null && server.dnsserver_ip != ""
    ])
    error_message = "All DNS servers must have a valid DNS server IP address."
  }
  
  validation {
    condition = alltrue([
      for server in var.dns_servers : server.dnsserver_port >= 1 && server.dnsserver_port <= 65535
    ])
    error_message = "DNS server port must be between 1 and 65535."
  }
  
  validation {
    condition = alltrue([
      for server in var.dns_servers : contains(["ipv4", "ipv6", "ipv4v6"], server.address_family)
    ])
    error_message = "Address family must be one of: ipv4, ipv6, ipv4v6."
  }
}

variable "send_to_all_dns_servers" {
  description = "Send DNS queries to all configured DNS servers"
  type        = bool
  default     = false
}

variable "max_source_port" {
  description = "Maximum source port for DNS queries"
  type        = number
  default     = 65535
  
  validation {
    condition     = var.max_source_port >= 1 && var.max_source_port <= 65535
    error_message = "Maximum source port must be between 1 and 65535."
  }
}

variable "min_source_port" {
  description = "Minimum source port for DNS queries"
  type        = number
  default     = 1024
  
  validation {
    condition     = var.min_source_port >= 1 && var.min_source_port <= 65535
    error_message = "Minimum source port must be between 1 and 65535."
  }
}

# Authoritative Configuration
variable "enable_authoritative_config" {
  description = "Enable authoritative DNS configuration"
  type        = bool
  default     = false
}

variable "authoritative_ttl" {
  description = "Default TTL for authoritative records"
  type        = number
  default     = 3600
  
  validation {
    condition     = var.authoritative_ttl >= 0
    error_message = "TTL must be a positive value."
  }
}

variable "host_records" {
  description = "Host records for authoritative DNS"
  type = list(object({
    domain_names = list(string)
    ipv4_address = optional(string)
    ipv6_address = optional(string)
    ttl          = optional(number)
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.host_records : length(record.domain_names) > 0
    ])
    error_message = "Each host record must have at least one domain name."
  }
}

variable "cname_records" {
  description = "CNAME records for authoritative DNS"
  type = list(object({
    name   = list(string)
    target = string
    ttl    = optional(number)
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.cname_records : length(record.name) > 0 && record.target != ""
    ])
    error_message = "Each CNAME record must have at least one name and a valid target."
  }
}

variable "mx_host_records" {
  description = "MX records for authoritative DNS"
  type = list(object({
    hostname   = string
    mx_name    = string
    preference = number
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.mx_host_records : record.hostname != "" && record.mx_name != "" && record.preference >= 0
    ])
    error_message = "Each MX record must have a valid hostname, MX name, and preference value."
  }
}

variable "txt_records" {
  description = "TXT records for authoritative DNS"
  type = list(object({
    domain_name = string
    texts       = list(string)
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.txt_records : record.domain_name != "" && length(record.texts) > 0
    ])
    error_message = "Each TXT record must have a valid domain name and at least one text value."
  }
}

variable "ptr_records" {
  description = "PTR records for authoritative DNS"
  type = list(object({
    name   = string
    target = string
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.ptr_records : record.name != "" && record.target != ""
    ])
    error_message = "Each PTR record must have a valid name and target."
  }
}

variable "srv_hosts" {
  description = "SRV records for authoritative DNS"
  type = list(object({
    service     = string
    protocol    = string
    domain_name = string
    port        = number
    priority    = number
    weight      = number
    target      = string
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.srv_hosts : 
      record.service != "" && record.protocol != "" && record.domain_name != "" && 
      record.port >= 1 && record.port <= 65535 && 
      record.priority >= 0 && record.weight >= 0 && record.target != ""
    ])
    error_message = "Each SRV record must have valid service, protocol, domain name, port (1-65535), priority, weight, and target."
  }
}

variable "authoritative_zones" {
  description = "Authoritative zones configuration"
  type = list(object({
    domain_name    = string
    include_prefix = optional(list(string))
    exclude_prefix = optional(list(string))
  }))
  default = []
  
  validation {
    condition = alltrue([
      for zone in var.authoritative_zones : zone.domain_name != ""
    ])
    error_message = "Each authoritative zone must have a valid domain name."
  }
}

variable "soa_records" {
  description = "SOA records for authoritative DNS"
  type = list(object({
    serial_number = number
    host_master   = string
    refresh       = number
    retry         = number
    expiry        = number
  }))
  default = []
  
  validation {
    condition = alltrue([
      for record in var.soa_records : 
      record.serial_number >= 0 && record.host_master != "" && 
      record.refresh > 0 && record.retry > 0 && record.expiry > 0
    ])
    error_message = "Each SOA record must have valid serial number, host master, and positive refresh, retry, and expiry values."
  }
}

variable "authoritative_peers" {
  description = "List of authoritative peers"
  type        = list(string)
  default     = []
}

variable "secondary_servers" {
  description = "List of secondary DNS servers"
  type        = list(string)
  default     = []
}

# Cache Configuration
variable "enable_cache_config" {
  description = "Enable DNS cache configuration"
  type        = bool
  default     = true
}

variable "cache_size" {
  description = "DNS cache size in MB"
  type        = number
  default     = 100
  
  validation {
    condition     = var.cache_size >= 1 && var.cache_size <= 1000
    error_message = "Cache size must be between 1 and 1000 MB."
  }
}

variable "min_cache_ttl" {
  description = "Minimum cache TTL in seconds"
  type        = number
  default     = 300
  
  validation {
    condition     = var.min_cache_ttl >= 0
    error_message = "Minimum cache TTL must be a positive value."
  }
}

variable "max_cache_ttl" {
  description = "Maximum cache TTL in seconds"
  type        = number
  default     = 86400
  
  validation {
    condition     = var.max_cache_ttl >= 0
    error_message = "Maximum cache TTL must be a positive value."
  }
}

variable "negative_cache_ttl" {
  description = "Negative cache TTL in seconds"
  type        = number
  default     = 3600
  
  validation {
    condition     = var.negative_cache_ttl >= 0
    error_message = "Negative cache TTL must be a positive value."
  }
}

variable "disable_negative_caching" {
  description = "Disable negative caching"
  type        = bool
  default     = false
}

# DNS Response Overrides
variable "enable_dns_response_overrides" {
  description = "Enable DNS response overrides"
  type        = bool
  default     = false
}

variable "disable_private_ip_lookups" {
  description = "Disable private IP lookups"
  type        = bool
  default     = false
}

variable "local_ttl" {
  description = "Local TTL for DNS responses"
  type        = number
  default     = 3600
  
  validation {
    condition     = var.local_ttl >= 0
    error_message = "Local TTL must be a positive value."
  }
}

variable "max_ttl" {
  description = "Maximum TTL for DNS responses"
  type        = number
  default     = 86400
  
  validation {
    condition     = var.max_ttl >= 0
    error_message = "Maximum TTL must be a positive value."
  }
}

variable "ignore_ip_addresses" {
  description = "IP addresses to ignore in DNS responses"
  type        = list(string)
  default     = []
}

variable "bogus_nx_domains" {
  description = "Domains to treat as NXDOMAIN"
  type        = list(string)
  default     = []
}

variable "dns_aliases" {
  description = "DNS aliases configuration"
  type = list(object({
    original_ip       = optional(string)
    original_start_ip = optional(string)
    original_end_ip   = optional(string)
    replace_ip        = string
    mask              = optional(string)
  }))
  default = []
  
  validation {
    condition = alltrue([
      for alias in var.dns_aliases : alias.replace_ip != ""
    ])
    error_message = "Each DNS alias must have a valid replacement IP address."
  }
}

# DNSSEC Configuration
variable "enable_dnssec" {
  description = "Enable DNSSEC configuration"
  type        = bool
  default     = false
}

variable "dnssec_enabled" {
  description = "Enable DNSSEC validation"
  type        = bool
  default     = false
}

variable "dns_check_unsigned" {
  description = "Check unsigned DNS responses"
  type        = bool
  default     = false
}

variable "disable_dnssec_timecheck" {
  description = "Disable DNSSEC time check"
  type        = bool
  default     = false
}

variable "trust_anchors" {
  description = "DNSSEC trust anchors"
  type = list(object({
    domain = string
    class  = string
    key_digest = optional(object({
      key_tag     = number
      algorithm   = number
      digest_type = number
      digest      = string
    }))
  }))
  default = []
  
  validation {
    condition = alltrue([
      for anchor in var.trust_anchors : anchor.domain != "" && anchor.class != ""
    ])
    error_message = "Each trust anchor must have a valid domain and class."
  }
}

# DNS Rebind Configuration
variable "enable_dns_rebind_config" {
  description = "Enable DNS rebind protection configuration"
  type        = bool
  default     = false
}

variable "enable_localhost_rebind" {
  description = "Enable localhost rebind protection"
  type        = bool
  default     = false
}

variable "stop_dns_rebind_privateip" {
  description = "Stop DNS rebind for private IP addresses"
  type        = bool
  default     = true
}

variable "rebind_domains" {
  description = "Domains to allow for rebind protection"
  type        = list(string)
  default     = []
}

# DNS Queries Metadata
variable "enable_dns_queries_metadata" {
  description = "Enable DNS queries metadata"
  type        = bool
  default     = false
}

variable "add_subnets" {
  description = "Subnets to add to DNS queries metadata"
  type = list(object({
    ipv4_address        = optional(string)
    ipv4_prefix_length  = optional(number)
    ipv6_address        = optional(string)
    ipv6_prefix_length  = optional(number)
  }))
  default = []
}

variable "add_customer_premises_equipment" {
  description = "Customer premises equipment to add to DNS queries metadata"
  type = object({
    type            = string
    identifier_text = string
  })
  default = null
  
  validation {
    condition = var.add_customer_premises_equipment == null || (
      var.add_customer_premises_equipment.type != "" && 
      var.add_customer_premises_equipment.identifier_text != ""
    )
    error_message = "Customer premises equipment must have valid type and identifier text."
  }
}

variable "add_client_mac" {
  description = "Client MAC configuration for DNS queries metadata"
  type = object({
    mac_encoding_format = string
  })
  default = null
  
  validation {
    condition = var.add_client_mac == null || var.add_client_mac.mac_encoding_format != ""
    error_message = "Client MAC must have a valid encoding format."
  }
}

# Domains to Addresses Mapping
variable "domains_to_addresses" {
  description = "Static domain to address mappings"
  type = list(object({
    domain_names = list(string)
    ipv4_address = optional(string)
    ipv6_address = optional(string)
  }))
  default = []
  
  validation {
    condition = alltrue([
      for mapping in var.domains_to_addresses : 
      length(mapping.domain_names) > 0 && 
      (mapping.ipv4_address != null || mapping.ipv6_address != null)
    ])
    error_message = "Each domain mapping must have at least one domain name and either IPv4 or IPv6 address."
  }
}

# Additional DNS Settings
variable "enable_dnssec_proxy" {
  description = "Enable DNSSEC proxy"
  type        = bool
  default     = false
}

variable "edns_packet_max" {
  description = "Maximum EDNS packet size"
  type        = number
  default     = 4096
  
  validation {
    condition     = var.edns_packet_max >= 512 && var.edns_packet_max <= 65535
    error_message = "EDNS packet max size must be between 512 and 65535."
  }
}

variable "enable_dns_loop_detection" {
  description = "Enable DNS loop detection"
  type        = bool
  default     = true
}

variable "enable_strict_domain_name" {
  description = "Enable strict domain name validation"
  type        = bool
  default     = false
}

variable "listen_port" {
  description = "Port for DNS service to listen on"
  type        = number
  default     = 53
  
  validation {
    condition     = var.listen_port >= 1 && var.listen_port <= 65535
    error_message = "Listen port must be between 1 and 65535."
  }
}

variable "listen_dnsservicerole_id" {
  description = "DNS service role ID for listening"
  type        = string
  default     = null
}