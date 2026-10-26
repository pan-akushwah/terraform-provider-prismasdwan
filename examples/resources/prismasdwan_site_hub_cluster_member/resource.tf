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
  headend1_site_ids = ["<headend1_site_id>"]
  headend2_site_ids = ["<headend2_site_id>"]
  hub_element_id    = "<hub_element_id>"
  load_factors = [{
    alarm_threshold     = 10
    allocated           = 10
    subscription_factor = 1.5
    threshold = {
      critical_alarm      = 10
      major_alarm         = 10
      subscription_factor = 1.5
    }
    type = "forwarding-capacity"
  }]
}
