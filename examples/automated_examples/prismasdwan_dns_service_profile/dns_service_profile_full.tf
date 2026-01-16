resource "prismasdwan_dns_service_profile" "dns_service_profile_full" {
  # Required fields
  name        = var.dns_service_profile_name
  description = var.description
  tags        = var.tags
  
  # DNS forward configuration as object
  dns_forward_config = {
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
    send_to_all_dns_servers = var.send_to_all_dns_servers
    max_source_port        = var.max_source_port
    min_source_port        = var.min_source_port
  }
  
  # Cache configuration as object
  cache_config = {
    cache_size               = var.cache_size
    min_cache_ttl           = var.min_cache_ttl
    max_cache_ttl           = var.max_cache_ttl
    negative_cache_ttl      = var.negative_cache_ttl
    disable_negative_caching = var.disable_negative_caching
  }
  
  # Authoritative configuration as object (minimal)
  authoritative_config = {
    ttl = var.authoritative_ttl
  }
  
  # DNS response overrides as object (minimal)
  dns_response_overrides = {
    disable_private_ip_lookups = var.disable_private_ip_lookups
    local_ttl                  = var.local_ttl
    max_ttl                    = var.max_ttl
    ignore_ip_addresses        = []
    bogus_nx_domains          = []
  }
  
  # Simple boolean flags
  enable_dnssec_proxy       = var.enable_dnssec_proxy
  enable_dns_loop_detection = var.enable_dns_loop_detection
  enable_strict_domain_name = var.enable_strict_domain_name
  
  # Port configuration
  listen_port = var.listen_port
  
  # EDNS configuration
  edns_packet_max = var.edns_packet_max
  
  # Simple domain mappings
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
}
