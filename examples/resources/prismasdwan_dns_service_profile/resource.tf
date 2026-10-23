# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "dns_service_profile".
# This file is generated - do not edit by hand.
#
# Before using this example, configure the Prisma SD-WAN provider:
#
#   terraform {
#     required_providers {
#       prismasdwan = {
#         source  = "paloaltonetworks/prismasdwan"
#       }
#     }
#   }
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

resource "prismasdwan_dns_service_profile" "example" {
  authoritative_config = {
    caa_records = [{
      flags = "Lorem-Ipsum"
      name = "Lorem-Ipsum"
      tag = "Lorem-Ipsum"
      value = "Lorem-Ipsum"
    }]
    cname_records = [{
      name = ["Lorem-Ipsum"]
      target = "Lorem-Ipsum"
      ttl = 1234
    }]
    dns_resource_records = [{
      hex_data = "Lorem-Ipsum"
      name = "Lorem-Ipsum"
      rr_number = 1234
    }]
    host_records = [{
      domain_names = ["Lorem-Ipsum"]
      ipv4_address = "Lorem-Ipsum"
      ipv6_address = "Lorem-Ipsum"
      ttl = 1234
    }]
    mx_host_records = [{
      hostname = "Lorem-Ipsum"
      mx_name = "Lorem-Ipsum"
      preference = 1234
    }]
    naptr_records = [{
      flags = "Lorem-Ipsum"
      name = "Lorem-Ipsum"
      order = 1234
      preference = 1234
      regexp = "Lorem-Ipsum"
      replacement = "Lorem-Ipsum"
      service = "Lorem-Ipsum"
    }]
    peers = ["Lorem-Ipsum"]
    ptr_records = [{
      name = "Lorem-Ipsum"
      target = "Lorem-Ipsum"
    }]
    secondary_servers = ["Lorem-Ipsum"]
    servers = [{
      dnsservicerole_id = "123456789"
      domain_name = "Lorem-Ipsum"
    }]
    soa = [{
      expiry = 1234
      host_master = "Lorem-Ipsum"
      refresh = 1234
      retry = 1234
      serial_number = 1234
    }]
    srv_hosts = [{
      domain_name = "Lorem-Ipsum"
      port = 1234
      priority = 1234
      protocol = "Lorem-Ipsum"
      service = "Lorem-Ipsum"
      target = 1234
      weight = 1234
    }]
    synth_domains = [{
      domain = "Lorem-Ipsum"
      end_ipaddress = "Lorem-Ipsum"
      ipaddress_prefix = "Lorem-Ipsum"
      prefix = "Lorem-Ipsum"
      start_ipaddress = "Lorem-Ipsum"
    }]
    ttl = 1234
    txt_records = [{
      domain_name = "Lorem-Ipsum"
      texts = ["Lorem-Ipsum"]
    }]
    zones = [{
      domain_name = "Lorem-Ipsum"
      exclude_prefix = ["Lorem-Ipsum"]
      include_prefix = ["Lorem-Ipsum"]
    }]
  }
  cache_config = {
    cache_size = 1234
    disable_negative_caching = true
    max_cache_ttl = 1234
    min_cache_ttl = 1234
    negative_cache_ttl = 1234
  }
  description = "Lorem-Ipsum"
  dns_forward_config = {
    dns_servers = [{
      address_family = "Lorem-Ipsum"
      dnsserver_ip = "Lorem-Ipsum"
      dnsserver_port = 1234
      domain_names = ["Lorem-Ipsum"]
      forward_dnsservicerole_id = "123456789"
      ip_prefix = "Lorem-Ipsum"
      source_port = 1234
    }]
    max_source_port = 1234
    min_source_port = 1234
    send_to_all_dns_servers = true
  }
  dns_queries_metadata = {
    add_client_mac = {
      mac_encoding_format = "Lorem-Ipsum"
    }
    add_customer_premises_equipment = {
      identifier_text = "Lorem-Ipsum"
      type = "Lorem-Ipsum"
    }
    add_subnets = [{
      ipv4_address = "Lorem-Ipsum"
      ipv4_prefix_length = 1234
      ipv6_address = "Lorem-Ipsum"
      ipv6_prefix_length = 1234
    }]
  }
  dns_rebind_config = {
    enable_localhost_rebind = true
    rebind_domains = ["Lorem-Ipsum"]
    stop_dns_rebind_privateip = true
  }
  dns_response_overrides = {
    aliases = [{
      mask = 1234
      original_end_ip = "Lorem-Ipsum"
      original_ip = "Lorem-Ipsum"
      original_start_ip = "Lorem-Ipsum"
      replace_ip = "Lorem-Ipsum"
    }]
    bogus_nx_domains = ["Lorem-Ipsum"]
    disable_private_ip_lookups = true
    ignore_ip_addresses = ["Lorem-Ipsum"]
    local_ttl = 1234
    max_ttl = 1234
  }
  dnssec_config = {
    disable_dnssec_timecheck = true
    dns_check_unsigned = true
    enabled = true
    trust_anchors = [{
      class = "Lorem-Ipsum"
      domain = "Lorem-Ipsum"
      key_digest = {
        algorithm = 1234
        digest = "Lorem-Ipsum"
        digest_type = 1234
        key_tag = 1234
      }
    }]
  }
  domains_to_addresses = [{
    domain_names = ["Lorem-Ipsum"]
    ipv4_address = "Lorem-Ipsum"
    ipv6_address = "Lorem-Ipsum"
  }]
  edns_packet_max = 1234
  enable_dns_loop_detection = true
  enable_dnssec_proxy = true
  enable_strict_domain_name = true
  listen_dnsservicerole_id = "123456789"
  listen_port = 1234
  name = "Lorem-Ipsum"
  tags = ["lorem"]
}
