# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_dhcp_server"
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
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_site_dhcp_server" "site_dhcp_server_1" {
  # This is needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  disabled = false
  description = "Example DHCP server configuration"
  subnet = "10.10.10.0/24"
  gateway = "10.10.10.253"
  broadcast_address = "10.10.10.255"
  domain_name = "example.com"
  dns_servers = [
    "10.10.10.2",
    "10.10.10.3",
    "10.10.10.4"
  ]
  default_lease_time = 43200
  max_lease_time = 86400
  ip_ranges = [
    {
      start_ip = "10.10.10.1"
      end_ip = "10.10.10.128"
    }
  ]
  static_mappings = [
    {
      name = "example_device"
      mac = "DB:F9:AF:1B:0D:3E"
      ip_address = "10.10.10.32"
    }
  ]
  address_family = "ipv4"
  vrf_context_id = prismasdwan_vrf_context.test_vrf_context_1.id
}
