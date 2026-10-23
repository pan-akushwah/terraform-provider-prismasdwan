# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_cluster_member".
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

resource "prismasdwan_site_hub_cluster_member" "example" {
  headend1_site_ids = ["Lorem-Ipsum"]
  headend2_site_ids = ["Lorem-Ipsum"]
  hub_element_id = "123456789"
  load_factors = [{
    alarm_threshold = 1234
    allocated = 1234
    subscription_factor = 0.1234
    threshold = {
      critical_alarm = 1234
      major_alarm = 1234
      subscription_factor = 0.1234
    }
    type = "Lorem-Ipsum"
  }]
}
