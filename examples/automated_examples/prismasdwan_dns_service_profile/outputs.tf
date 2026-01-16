# DNS Service Profile Details
output "dns_service_profile_details" {
  description = "Details of the created DNS service profile"
  value = {
    id                     = prismasdwan_dns_service_profile.dns_service_profile_full.id
    name                   = prismasdwan_dns_service_profile.dns_service_profile_full.name
    description            = prismasdwan_dns_service_profile.dns_service_profile_full.description
    tags                   = prismasdwan_dns_service_profile.dns_service_profile_full.tags
    tfid                   = prismasdwan_dns_service_profile.dns_service_profile_full.tfid
    x_etag                 = prismasdwan_dns_service_profile.dns_service_profile_full.x_etag
    x_schema               = prismasdwan_dns_service_profile.dns_service_profile_full.x_schema
  }
}

# Individual outputs for easy access
output "dns_service_profile_id" {
  description = "ID of the created DNS service profile"
  value       = prismasdwan_dns_service_profile.dns_service_profile_full.id
}

output "dns_service_profile_name" {
  description = "Name of the created DNS service profile"
  value       = prismasdwan_dns_service_profile.dns_service_profile_full.name
}

output "dns_service_profile_tfid" {
  description = "Terraform ID of the DNS service profile"
  value       = prismasdwan_dns_service_profile.dns_service_profile_full.tfid
}

output "description" {
  description = "The description of the DNS service profile"
  value       = prismasdwan_dns_service_profile.dns_service_profile_full.description
}

output "tags" {
  description = "The tags of the DNS service profile"
  value       = prismasdwan_dns_service_profile.dns_service_profile_full.tags
}

# Configuration Analysis
output "configuration_analysis" {
  description = "Analysis of DNS service profile configuration"
  value = {
    dns_servers_configured = length(var.dns_servers)
    cache_enabled         = var.enable_cache_config
    cache_size            = var.cache_size
    authoritative_enabled = var.enable_authoritative_config
    dnssec_enabled       = var.enable_dnssec && var.dnssec_enabled
    rebind_protection    = var.enable_dns_rebind_config
    loop_detection       = var.enable_dns_loop_detection
    strict_validation    = var.enable_strict_domain_name
    
    performance_settings = {
      edns_packet_max = var.edns_packet_max
      listen_port     = var.listen_port
      source_port_range = "${var.min_source_port}-${var.max_source_port}"
      cache_ttl_range   = "${var.min_cache_ttl}-${var.max_cache_ttl}"
    }
    
    security_features = {
      dnssec_validation     = var.enable_dnssec && var.dnssec_enabled
      rebind_protection     = var.enable_dns_rebind_config && var.stop_dns_rebind_privateip
      private_ip_filtering  = var.disable_private_ip_lookups
      response_overrides    = var.enable_dns_response_overrides
    }
  }
}

# DNS Servers Analysis
output "dns_servers_analysis" {
  description = "Analysis of configured DNS servers"
  value = {
    total_servers = length(var.dns_servers)
    server_details = {
      for idx, server in var.dns_servers : "server_${idx + 1}" => {
        ip_address     = server.dnsserver_ip
        port          = server.dnsserver_port
        address_family = server.address_family
        timeout       = server.timeout
        server_type   = (
          can(regex("^8\\.8\\.", server.dnsserver_ip)) ? "google-dns" :
          can(regex("^1\\.1\\.", server.dnsserver_ip)) ? "cloudflare-dns" :
          can(regex("^9\\.9\\.", server.dnsserver_ip)) ? "quad9-dns" : "custom-dns"
        )
      }
    }
    
    redundancy_level = (
      length(var.dns_servers) >= 3 ? "high" :
      length(var.dns_servers) == 2 ? "basic" : "none"
    )
    
    ip_protocol_support = (
      length([for server in var.dns_servers : server if server.address_family == "ipv6" || server.address_family == "ipv4v6"]) > 0 ? 
      "ipv6-ready" : "ipv4-only"
    )
  }
}

# Tags Analysis
output "tags_analysis" {
  description = "Analysis of tags configuration"
  value = {
    total_tags = length(var.tags)
    tags_list  = var.tags
    tags_compliance = {
      within_limit     = length(var.tags) <= 10
      valid_format     = alltrue([for tag in var.tags : can(regex("^[^,\\s]+$", tag))])
      unique_tags      = length(var.tags) == length(distinct(var.tags))
      max_length_ok    = alltrue([for tag in var.tags : length(tag) <= 128])
    }
    
    tag_categories = {
      infrastructure_tags = length([for tag in var.tags : tag if contains(["terraform", "infrastructure", "automation"], tag)])
      service_tags       = length([for tag in var.tags : tag if contains(["dns", "networking", "service"], tag)])
      environment_tags   = length([for tag in var.tags : tag if contains(["production", "staging", "development"], tag)])
    }
  }
}

# Metadata Analysis - Fixed conditional types
output "metadata_analysis" {
  description = "Analysis of metadata configuration"
  value = {
    metadata_features = var.enable_dns_queries_metadata ? {
      metadata_enabled = true
      subnet_metadata = {
        subnets_count = length(var.add_subnets)
        ipv4_subnets = length([
          for subnet in var.add_subnets : subnet
          if subnet.ipv4_address != null
        ])
        ipv6_subnets = length([
          for subnet in var.add_subnets : subnet
          if subnet.ipv6_address != null
        ])
      }
      cpe_metadata = var.add_customer_premises_equipment != null ? {
        cpe_configured = true
        cpe_type = var.add_customer_premises_equipment.type
        cpe_identifier = var.add_customer_premises_equipment.identifier_text
      } : {
        cpe_configured = false
        cpe_type = null
        cpe_identifier = null
      }
      client_mac_metadata = var.add_client_mac != null ? {
        mac_tracking_enabled = true
        mac_encoding_format = var.add_client_mac.mac_encoding_format
      } : {
        mac_tracking_enabled = false
        mac_encoding_format = null
      }
    } : {
      metadata_enabled = false
      subnet_metadata = {
        subnets_count = 0
        ipv4_subnets = 0
        ipv6_subnets = 0
      }
      cpe_metadata = {
        cpe_configured = false
        cpe_type = null
        cpe_identifier = null
      }
      client_mac_metadata = {
        mac_tracking_enabled = false
        mac_encoding_format = null
      }
    }
  }
}

# Validation Status
output "validation_status" {
  description = "Validation status of the DNS configuration"
  value = {
    profile_name_valid = length(var.dns_service_profile_name) > 0 && length(var.dns_service_profile_name) <= 128
    description_valid  = length(var.description) <= 256
    tags_valid        = length(var.tags) <= 10 && alltrue([for tag in var.tags : length(tag) <= 128])
    dns_servers_valid = length(var.dns_servers) > 0
    port_ranges_valid = var.min_source_port <= var.max_source_port
    cache_config_valid = var.cache_size >= 1 && var.cache_size <= 1000
    edns_packet_valid = var.edns_packet_max >= 512 && var.edns_packet_max <= 65535
    listen_port_valid = var.listen_port >= 1 && var.listen_port <= 65535
    
    overall_status = (
      length(var.dns_service_profile_name) > 0 && 
      length(var.dns_servers) > 0 && 
      var.min_source_port <= var.max_source_port
    ) ? "valid" : "invalid"
  }
}

# Deployment Status
output "deployment_status" {
  description = "DNS service profile deployment status"
  value = {
    status                  = "success"
    deployed_at            = timestamp()
    resource_type          = "dns_service_profile"
    resource_count         = 1
    dns_servers_count      = length(var.dns_servers)
    cache_enabled          = var.enable_cache_config
    security_enabled       = var.enable_dnssec || var.enable_dns_rebind_config
    high_availability      = length(var.dns_servers) > 1
    service_ready          = true
  }
}
