# DNS Service Profile Configuration
dns_service_profile_name = "TerraformTest1"
description = "Production enterprise DNS service profile with comprehensive forwarding, caching, authoritative records, and security features"
tags = ["terraform", "dns", "enterprise", "production", "networking", "security"]

# DNS Forward Configuration
dns_servers = [
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
  },
  {
    dnsserver_ip   = "1.1.1.1"
    dnsserver_port = 53
    timeout        = 3
    address_family = "ipv4"
  }
]

send_to_all_dns_servers = false
max_source_port = 65535
min_source_port = 1024

# Cache Configuration
enable_cache_config = true
cache_size = 200
min_cache_ttl = 300
max_cache_ttl = 86400
negative_cache_ttl = 3600
disable_negative_caching = false

# DNS Response Overrides
enable_dns_response_overrides = true
disable_private_ip_lookups = false
local_ttl = 3600
max_ttl = 86400
ignore_ip_addresses = []
bogus_nx_domains = []

# Authoritative Configuration
enable_authoritative_config = true
authoritative_ttl = 3600

host_records = [
  {
    domain_names = ["mail.company.com"]
    ipv4_address = "192.168.1.100"
    ttl          = 3600
  },
  {
    domain_names = ["web.company.com", "www.company.com"]
    ipv4_address = "192.168.1.101"
    ttl          = 7200
  }
]

cname_records = [
  {
    name   = ["blog.company.com"]
    target = "web.company.com"
    ttl    = 3600
  }
]

mx_host_records = [
  {
    hostname   = "company.com"
    mx_name    = "mail.company.com"
    preference = 10
  }
]

txt_records = [
  {
    domain_name = "company.com"
    texts       = ["v=spf1 include:_spf.google.com ~all"]
  }
]

authoritative_zones = [
  {
    domain_name = "company.com"
  }
]

soa_records = [
  {
    serial_number = 2024012301
    host_master   = "admin.company.com"
    refresh       = 3600
    retry         = 1800
    expiry        = 604800
  }
]

authoritative_peers = []
secondary_servers = []

# DNSSEC Configuration
enable_dnssec = true
dnssec_enabled = true
dns_check_unsigned = false
disable_dnssec_timecheck = false

trust_anchors = [
  {
    domain = "."
    class  = "IN"
    key_digest = {
      key_tag     = 20326
      algorithm   = 8
      digest_type = 2
      digest      = "E06D44B80B8F1D39A95C0B0D7C65D08458E880409BBC683457104237C7F8EC8D"
    }
  }
]

# DNS Rebind Configuration
enable_dns_rebind_config = true
enable_localhost_rebind = false
stop_dns_rebind_privateip = true
rebind_domains = ["*.company.com"]

# DNS Queries Metadata
enable_dns_queries_metadata = false
add_subnets = []

add_customer_premises_equipment = {
  type            = "router"
  identifier_text = "enterprise-gateway"
}

add_client_mac = {
  mac_encoding_format = "hex-hyphen"
}

# Domains to Addresses Mapping
domains_to_addresses = [
  {
    domain_names = ["internal.company.com"]
    ipv4_address = "10.0.1.100"
  },
  {
    domain_names = ["backup.company.com"]
    ipv4_address = "10.0.1.200"
  }
]

# Additional DNS Settings
enable_dnssec_proxy = true
edns_packet_max = 4096
enable_dns_loop_detection = true
enable_strict_domain_name = false
listen_port = 53
listen_dnsservicerole_id = null