# Site LAN Network Details
output "site_lan_network_details" {
  description = "Complete site LAN network configuration details"
  value = {
    id = prismasdwan_site_lan_network.site_lan_network_full.id
    tfid = prismasdwan_site_lan_network.site_lan_network_full.tfid
    name = var.site_lan_network_name
    scope = var.scope
    site_id = prismasdwan_site_lan_network.site_lan_network_full.x_parameters.site_id
    description = var.description
    tags = var.tags
    x_etag = prismasdwan_site_lan_network.site_lan_network_full.x_etag
    x_schema = prismasdwan_site_lan_network.site_lan_network_full.x_schema
  }
}

# Primary Resource IDs
output "site_lan_network_id" {
  description = "Site LAN network ID"
  value = prismasdwan_site_lan_network.site_lan_network_full.id
}

output "site_lan_network_name" {
  description = "Site LAN network name"
  value = var.site_lan_network_name
}

output "site_lan_network_tfid" {
  description = "Site LAN network Terraform ID"
  value = prismasdwan_site_lan_network.site_lan_network_full.tfid
}

# Network Configuration
output "network_configuration" {
  description = "Network configuration details"
  value = {
    scope = var.scope
    ipv4_config = {
      prefixes = var.ipv4_prefixes
      default_routers = var.ipv4_default_routers
    }
    ipv6_config = length(var.ipv6_prefixes) > 0 ? {
      prefixes = var.ipv6_prefixes
      default_routers = var.ipv6_default_routers
    } : null
    site_id = prismasdwan_site_lan_network.site_lan_network_full.x_parameters.site_id
  }
}

# DHCP Server Configuration
output "dhcp_server_configuration" {
  description = "DHCP server configuration details"
  value = var.dhcp_server_enabled ? {
    enabled = true
    subnet = var.dhcp_server_subnet
    gateway = var.dhcp_server_gateway
    broadcast_address = var.dhcp_server_broadcast_address
    ip_ranges = var.dhcp_server_ip_ranges
    lease_times = {
      default = var.dhcp_server_default_lease_time
      maximum = var.dhcp_server_max_lease_time
    }
    dns_servers = var.dhcp_server_dns_servers
    domain_name = var.dhcp_server_domain_name
    description = var.dhcp_server_description
    tags = var.dhcp_server_tags
    static_mappings_count = length(var.dhcp_server_static_mappings)
    custom_options_count = length(var.dhcp_server_custom_options)
    disabled = var.dhcp_server_disabled
    network_context_id = var.dhcp_server_network_context_id
    source_interface = null
    server_ips = []
    server_count = 0
  } : {
    enabled = false
    subnet = null
    gateway = null
    broadcast_address = null
    ip_ranges = []
    lease_times = {
      default = null
      maximum = null
    }
    dns_servers = []
    domain_name = null
    description = null
    tags = []
    static_mappings_count = 0
    custom_options_count = 0
    disabled = null
    network_context_id = null
    source_interface = null
    server_ips = []
    server_count = 0
  }
}

# DHCP Static Mappings
output "dhcp_static_mappings" {
  description = "DHCP server static IP mappings"
  value = var.dhcp_server_enabled && length(var.dhcp_server_static_mappings) > 0 ? {
    mappings = [
      for mapping in var.dhcp_server_static_mappings : {
        name = mapping.name
        ip_address = mapping.ip_address
        mac_address = mapping.mac
      }
    ]
    total_count = length(var.dhcp_server_static_mappings)
  } : null
}

# DHCP Custom Options
output "dhcp_custom_options" {
  description = "DHCP server custom options"
  value = var.dhcp_server_enabled && length(var.dhcp_server_custom_options) > 0 ? {
    options = [
      for option in var.dhcp_server_custom_options : {
        definition = option.option_definition
        value = option.option_value
      }
    ]
    total_count = length(var.dhcp_server_custom_options)
  } : null
}

# DHCP Relay Configuration
output "dhcp_relay_configuration" {
  description = "DHCP relay configuration details"
  value = var.dhcp_relay_enabled ? {
    enabled = true
    source_interface = var.dhcp_relay_source_interface
    server_ips = var.dhcp_relay_server_ips
    server_count = length(var.dhcp_relay_server_ips)
    subnet = null
    gateway = null
    broadcast_address = null
    ip_ranges = []
    lease_times = {
      default = null
      maximum = null
    }
    dns_servers = []
    domain_name = null
    description = null
    tags = []
    static_mappings_count = 0
    custom_options_count = 0
    disabled = null
    network_context_id = null
  } : {
    enabled = false
    source_interface = null
    server_ips = []
    server_count = 0
    subnet = null
    gateway = null
    broadcast_address = null
    ip_ranges = []
    lease_times = {
      default = null
      maximum = null
    }
    dns_servers = []
    domain_name = null
    description = null
    tags = []
    static_mappings_count = 0
    custom_options_count = 0
    disabled = null
    network_context_id = null
  }
}

# Traffic Policy Configuration
output "traffic_policy_configuration" {
  description = "Traffic policy configuration details"
  value = {
    ingress_policy = {
      configured = var.ingress_traffic_policysetstack_name != null || var.ingress_traffic_policysetstack_id != null
      stack_name = var.ingress_traffic_policysetstack_name
      stack_id = var.ingress_traffic_policysetstack_id
    }
    egress_policy = {
      configured = var.egress_traffic_policysetstack_name != null || var.egress_traffic_policysetstack_id != null
      stack_name = var.egress_traffic_policysetstack_name
      stack_id = var.egress_traffic_policysetstack_id
    }
  }
}

# Resource Dependencies
output "resource_dependencies" {
  description = "Resource dependency details and IDs"
  value = {
    site = {
      name = var.site_name
      id = prismasdwan_site_lan_network.site_lan_network_full.x_parameters.site_id
      resolved_from_name = var.site_name != null && var.site_id == null
    }
  }
}

# Configuration Variables Summary
output "configuration_summary" {
  description = "Summary of all configuration variables provided"
  value = {
    basic_config = {
      name = var.site_lan_network_name
      scope = var.scope
      description = var.description
      tags = var.tags
    }
    
    network_config = {
      ipv4_prefixes = var.ipv4_prefixes
      ipv4_default_routers = var.ipv4_default_routers
      ipv6_prefixes = var.ipv6_prefixes
      ipv6_default_routers = var.ipv6_default_routers
    }
    
    dhcp_server_config = var.dhcp_server_enabled ? {
      enabled = true
      subnet = var.dhcp_server_subnet
      gateway = var.dhcp_server_gateway
      ip_ranges_count = length(var.dhcp_server_ip_ranges)
      static_mappings_count = length(var.dhcp_server_static_mappings)
      custom_options_count = length(var.dhcp_server_custom_options)
    } : {
      enabled = false
    }
    
    #dhcp_relay_config = var.dhcp_relay_enabled ? {
    #  enabled = true
    #  server_count = length(var.dhcp_relay_server_ips)
    #} : {
    #  enabled = false
    #}
    
    policy_config = {
      has_ingress_policy = var.ingress_traffic_policysetstack_name != null
      has_egress_policy = var.egress_traffic_policysetstack_name != null
    }
    
    extended_config = {
      has_extended_tags = length(var.extended_tags) > 0
      extended_tags_count = length(var.extended_tags)
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Deployment status and resource creation details"
  value = {
    deployed_at = timestamp()
    resource_type = "site_lan_network"
    resource_count = 1
    status = "success"
    
    resource_details = {
      id = prismasdwan_site_lan_network.site_lan_network_full.id
      tfid = prismasdwan_site_lan_network.site_lan_network_full.tfid
      name = var.site_lan_network_name
      scope = var.scope
      site_id = prismasdwan_site_lan_network.site_lan_network_full.x_parameters.site_id
    }
  }
}
