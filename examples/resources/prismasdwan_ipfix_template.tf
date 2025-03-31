# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ipfix_template"
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

resource "prismasdwan_ipfix_template" "example_ipfix_template" {
  name = "example_template"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = [
    "lorem",
    "ipsum"
  ]
  flow_fields = [
    "TIME_STAMPS",
    "DST_IPV4_ADDRESS",
    "DST_PORT",
    "SRC_IPV4_ADDRESS",
    "SRC_PORT",
    "PROTOCOL",
    "CONNECTION_UNIFLOW_BYTES",
    "CONNECTION_UNIFLOW_PACKETS",
    "DSCP_LAST",
    "APPLICATION_HOST",
    "MEDIA_CODEC",
    "MEDIA_JITTER",
    "MEDIA_LOSS",
    "MEDIA_MOS",
    "RTP_TRANSPORT_TYPE"
  ]
  generate_biflow = false
  option_export_timeout = 700
  options = [
    "DEVICE_IDENTIFICATION"
  ]
  template_export_timeout = 750
}

