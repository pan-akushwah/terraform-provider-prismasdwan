# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_dns_service".
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

resource "prismasdwan_element_dns_service" "example" {
  cache_config = {
    cache_size = 10
  }
  description = "Managed by Terraform"
  dns_queries_metadata = {
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
  dnsservice_profile_id = "<dnsservice_profile_id>"
  dnsservicerole_bindings = [{
    dnsservicerole_id = "<dnsservicerole_id>"
    interfaces = [{
      interface_id = "<interface_id>"
      interface_ip = "10.0.0.1"
    }]
  }]
  domains_to_addresses = [{
    domain_names = ["example_domain_names"]
    ipv4_address = "10.0.0.1"
    ipv6_address = "2001:db8::1"
  }]
  domains_to_interfaces = [{
    domain_names = ["example_domain_names"]
    interface_id = "<interface_id>"
  }]
  enabled                    = true
  max_concurrent_dns_queries = 10
  name                       = "example_name"
  tags                       = ["terraform"]
}
