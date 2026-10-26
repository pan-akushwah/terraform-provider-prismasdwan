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
  description                              = "Managed by Terraform"
  disabled                                 = false
  disabled_reason                          = "example_disabled_reason"
  inactive                                 = false
  inactive_reason                          = "example_inactive_reason"
  name                                     = "example_name"
  region                                   = "example_region"
  snmp_discovery_device_refresh_frequency  = 30
  snmp_discovery_enabled                   = false
  snmp_discovery_network_refresh_frequency = 10
  snmp_discovery_use_local_neighbours      = false
  snmp_version                             = "v2"
  tags                                     = ["terraform"]
  v2_config = {
    snmp_community_string = "example_snmp_community_string"
  }
  v3_config = {
    snmp_auth_password              = "<secret>"
    snmp_auth_password_encrypted    = "<secret>"
    snmp_auth_protocol              = "none"
    snmp_privacy_password           = "<secret>"
    snmp_privacy_password_encrypted = "<secret>"
    snmp_privacy_protocol           = "none"
    snmp_security_level             = "noauth"
    snmp_username                   = "example_snmp_username"
  }
}
