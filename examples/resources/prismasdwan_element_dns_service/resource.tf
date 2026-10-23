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
    cache_size = 1234
  }
  description = "Lorem-Ipsum"
  dns_queries_metadata = {
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
  dnsservice_profile_id = "123456789"
  dnsservicerole_bindings = [{
    dnsservicerole_id = "123456789"
    interfaces = [{
      interface_id = "123456789"
      interface_ip = "Lorem-Ipsum"
    }]
  }]
  domains_to_addresses = [{
    domain_names = ["Lorem-Ipsum"]
    ipv4_address = "Lorem-Ipsum"
    ipv6_address = "Lorem-Ipsum"
  }]
  domains_to_interfaces = [{
    domain_names = ["Lorem-Ipsum"]
    interface_id = "123456789"
  }]
  enabled = true
  max_concurrent_dns_queries = 1234
  name = "Lorem-Ipsum"
  tags = ["lorem"]
}
