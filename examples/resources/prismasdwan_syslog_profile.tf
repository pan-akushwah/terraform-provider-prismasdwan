# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "syslog_profile"
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

resource "prismasdwan_syslog_profile" "example_syslog_profile_1" {
  name        = "example_syslogprofile_1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  protocol = "tcp"
  enable_flow_logging = true
  remote_ca_certificate = null
  server_fqdn = null
  server_ip = "10.11.13.14"
  server_port = 514
  severity_level = "major"
}

resource "prismasdwan_syslog_profile" "example_syslog_profile_2" {
  name        = "example_syslogprofile_2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  protocol = "udp"
  enable_flow_logging = false
  remote_ca_certificate = null
  server_fqdn = "google.com"
  server_ip = null
  server_port = 123
  severity_level = "critical"
}