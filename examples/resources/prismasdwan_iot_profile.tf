# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "iot_profile"
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

resource "prismasdwan_iot_profile" "iot_profile_1" {

  name                                     = "tf managed iot profile 1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  snmp_discovery_enabled                   = true
  snmp_discovery_use_local_neighbours      = true
  snmp_discovery_network_refresh_frequency = 1440
  snmp_discovery_device_refresh_frequency  = 90
  snmp_version                             = "v3"
  v3_config = {
    snmp_security_level   = "private",
    snmp_username         = "iot_user_name",
    snmp_auth_protocol    = "md5",
    snmp_auth_password    = base64encode("123456789"),
    snmp_privacy_password = base64encode("987654321"),
    snmp_privacy_protocol = "aes"
  }
}
