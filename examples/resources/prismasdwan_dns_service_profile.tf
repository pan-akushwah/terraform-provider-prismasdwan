# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "dns_service_profile"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_dns_service_profile" "default_dns_service_profile" {
  authoritative_config = null
  cache_config         = null
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  dns_forward_config = {
    dns_servers = [
      {
        address_family            = "ipv4"
        dnsserver_ip              = "127.0.0.1"
        dnsserver_port            = null
        domain_names              = null
        forward_dnsservicerole_id = null
        ip_prefix                 = null
        source_port               = null
      },
    ]
    max_source_port         = null
    min_source_port         = 1024
    send_to_all_dns_servers = true
  }
  dns_queries_metadata      = null
  dns_rebind_config         = null
  dns_response_overrides    = null
  dnssec_config             = null
  domains_to_addresses      = null
  edns_packet_max           = 4096
  enable_dns_loop_detection = false
  enable_dnssec_proxy       = false
  enable_strict_domain_name = false
  listen_dnsservicerole_id  = null
  listen_port               = 53
  name                      = "Default DNSServiceProfile"
  tags                      = null
}