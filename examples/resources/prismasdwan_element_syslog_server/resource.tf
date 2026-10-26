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
  description           = "Managed by Terraform"
  enable_dns_logging    = false
  enable_flow_logging   = false
  enable_threat_logging = false
  enable_url_logging    = false
  enabled               = true
  name                  = "example_name"
  protocol              = "example_protocol"
  remote_ca_certificate = "example_remote_ca_certificate"
  server_fqdn           = "server.example.com"
  server_ip             = "10.0.0.1"
  server_port           = 443
  severity_level        = "example_severity_level"
  source_interface      = "example_source_interface"
  syslog_profile_id     = "<syslog_profile_id>"
  tags                  = ["terraform"]
}
