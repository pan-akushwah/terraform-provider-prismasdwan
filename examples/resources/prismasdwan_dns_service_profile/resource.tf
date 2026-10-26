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
      flags = "example_flags"
      name  = "example_name"
      tag   = "example_tag"
      value = "example_value"
    }]
    cname_records = [{
      name   = ["example_name"]
      target = "example_target"
      ttl    = 10
    }]
    dns_resource_records = [{
      hex_data  = "example_hex_data"
      name      = "example_name"
      rr_number = 10
    }]
    host_records = [{
      domain_names = ["example_domain_names"]
      ipv4_address = "10.0.0.1"
      ipv6_address = "2001:db8::1"
      ttl          = 10
    }]
    mx_host_records = [{
      hostname   = "server.example.com"
      mx_name    = "example_mx"
      preference = 10
    }]
    naptr_records = [{
      flags       = "example_flags"
      name        = "example_name"
      order       = 1
      preference  = 10
      regexp      = "example_regexp"
      replacement = "example_replacement"
      service     = "example_service"
    }]
    peers = ["example_peers"]
    ptr_records = [{
      name   = "example_name"
      target = "example_target"
    }]
    secondary_servers = ["example_secondary_servers"]
    servers = [{
      dnsservicerole_id = "<dnsservicerole_id>"
      domain_name       = "example.com"
    }]
    soa = [{
      expiry        = 10
      host_master   = "example_host_master"
      refresh       = 10
      retry         = 3
      serial_number = 10
    }]
    srv_hosts = [{
      domain_name = "example.com"
      port        = 443
      priority    = 1
      protocol    = "example_protocol"
      service     = "example_service"
      target      = 10
      weight      = 10
    }]
    synth_domains = [{
      domain           = "example.com"
      end_ipaddress    = "example_end_ipaddress"
      ipaddress_prefix = "10.10.0.0/16"
      prefix           = "10.10.0.0/16"
      start_ipaddress  = "example_start_ipaddress"
    }]
    ttl = 10
    txt_records = [{
      domain_name = "example.com"
      texts       = ["example_texts"]
    }]
    zones = [{
      domain_name    = "example.com"
      exclude_prefix = ["10.10.0.0/16"]
      include_prefix = ["10.10.0.0/16"]
    }]
  }
  cache_config = {
    cache_size               = 10
    disable_negative_caching = false
    max_cache_ttl            = 10
    min_cache_ttl            = 10
    negative_cache_ttl       = 10
  }
  description = "Managed by Terraform"
  dns_forward_config = {
    dns_servers = [{
      address_family            = "ipv4"
      dnsserver_ip              = "10.0.0.1"
      dnsserver_port            = 443
      domain_names              = ["example_domain_names"]
      forward_dnsservicerole_id = "<forward_dnsservicerole_id>"
      ip_prefix                 = "10.10.0.0/16"
      source_port               = 443
    }]
    max_source_port         = 443
    min_source_port         = 443
    send_to_all_dns_servers = false
  }
  dns_queries_metadata = {
    add_client_mac = {
      mac_encoding_format = "base64"
    }
    add_customer_premises_equipment = {
      identifier_text = "example_identifier_text"
      type            = "text"
    }
    add_subnets = [{
      ipv4_address       = "10.0.0.1"
      ipv4_prefix_length = 10
      ipv6_address       = "2001:db8::1"
      ipv6_prefix_length = 10
    }]
  }
  dns_rebind_config = {
    enable_localhost_rebind   = false
    rebind_domains            = ["example_rebind_domains"]
    stop_dns_rebind_privateip = false
  }
  dns_response_overrides = {
    aliases = [{
      mask              = 10
      original_end_ip   = "10.0.0.1"
      original_ip       = "10.0.0.1"
      original_start_ip = "10.0.0.1"
      replace_ip        = "10.0.0.1"
    }]
    bogus_nx_domains           = ["example_bogus_nx_domains"]
    disable_private_ip_lookups = false
    ignore_ip_addresses        = ["example_ignore_ip_addresses"]
    local_ttl                  = 10
    max_ttl                    = 10
  }
  dnssec_config = {
    disable_dnssec_timecheck = false
    dns_check_unsigned       = false
    enabled                  = true
    trust_anchors = [{
      class  = "example_class"
      domain = "example.com"
      key_digest = {
        algorithm   = 10
        digest      = "example_digest"
        digest_type = 10
        key_tag     = 10
      }
    }]
  }
  domains_to_addresses = [{
    domain_names = ["example_domain_names"]
    ipv4_address = "10.0.0.1"
    ipv6_address = "2001:db8::1"
  }]
  edns_packet_max           = 10
  enable_dns_loop_detection = false
  enable_dnssec_proxy       = false
  enable_strict_domain_name = false
  listen_dnsservicerole_id  = "<listen_dnsservicerole_id>"
  listen_port               = 443
  name                      = "example_name"
  tags                      = ["terraform"]
}
