# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "iot_profile".
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

resource "prismasdwan_iot_profile" "example" {
  description = "Lorem-Ipsum"
  disabled = true
  disabled_reason = "Lorem-Ipsum"
  inactive = true
  inactive_reason = "Lorem-Ipsum"
  name = "Lorem-Ipsum"
  region = "Lorem-Ipsum"
  snmp_discovery_device_refresh_frequency = 1234
  snmp_discovery_enabled = true
  snmp_discovery_network_refresh_frequency = 1234
  snmp_discovery_use_local_neighbours = true
  snmp_version = "Lorem-Ipsum"
  tags = ["lorem"]
  v2_config = {
    snmp_community_string = "Lorem-Ipsum"
  }
  v3_config = {
    snmp_auth_password = "base64(<secret-string>)"
    snmp_auth_password_encrypted = "base64(<secret-string>)"
    snmp_auth_protocol = "Lorem-Ipsum"
    snmp_privacy_password = "base64(<secret-string>)"
    snmp_privacy_password_encrypted = "base64(<secret-string>)"
    snmp_privacy_protocol = "Lorem-Ipsum"
    snmp_security_level = "Lorem-Ipsum"
    snmp_username = "Lorem-Ipsum"
  }
}
