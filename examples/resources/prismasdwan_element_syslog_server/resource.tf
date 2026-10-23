# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_syslog_server".
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

resource "prismasdwan_element_syslog_server" "example" {
  description = "Lorem-Ipsum"
  enable_dns_logging = true
  enable_flow_logging = true
  enable_threat_logging = true
  enable_url_logging = true
  enabled = true
  name = "Lorem-Ipsum"
  protocol = "Lorem-Ipsum"
  remote_ca_certificate = "Lorem-Ipsum"
  server_fqdn = "Lorem-Ipsum"
  server_ip = "Lorem-Ipsum"
  server_port = 1234
  severity_level = "Lorem-Ipsum"
  source_interface = "Lorem-Ipsum"
  syslog_profile_id = "123456789"
  tags = ["lorem"]
}
