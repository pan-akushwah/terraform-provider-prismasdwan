# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_tacacs_plus_server".
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

resource "prismasdwan_element_tacacs_plus_server" "example" {
  authentication_protocol = "Lorem-Ipsum"
  description = "Lorem-Ipsum"
  enabled = true
  name = "Lorem-Ipsum"
  source_interface_id = "123456789"
  tacacs_plus_profile_id = "123456789"
  tacacs_plus_servers = [{
    secret = "base64(<secret-string>)"
    server_fqdn = "Lorem-Ipsum"
    server_ip = "Lorem-Ipsum"
    server_ipv6 = "Lorem-Ipsum"
    server_port = 1234
    timeout = 1234
  }]
  tags = ["lorem"]
}
