# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "domain".
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

resource "prismasdwan_domain" "example" {
  description = "Managed by Terraform"
  is_default  = false
  name        = "example_name"
  service_bindings = [{
    service_endpoint_ids = ["<service_endpoint_id>"]
    service_label_id     = "<service_label_id>"
  }]
  tags = ["terraform"]
}
