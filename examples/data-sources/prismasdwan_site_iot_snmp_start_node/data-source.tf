# Copyright Palo Alto Networks Inc. 2025
#
# Sample data source example for "site_iot_snmp_start_node".
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

data "prismasdwan_site_iot_snmp_start_node" "example" {
  # Path parameters that locate the parent object(s).
  x_parameters = {
    site_id = "123456789"
    deviceid_config_id = "123456789"
  }
  # Select an item by matching one or more of its attributes.
  filters = {
    name = "Lorem-Ipsum"
  }
}
