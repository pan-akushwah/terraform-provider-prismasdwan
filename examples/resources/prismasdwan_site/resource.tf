# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site".
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

resource "prismasdwan_site" "example" {
  address = {
    city = "Lorem-Ipsum"
    country = "Lorem-Ipsum"
    post_code = "Lorem-Ipsum"
    state = "Lorem-Ipsum"
    street = "Lorem-Ipsum"
    street2 = "Lorem-Ipsum"
  }
  admin_state = "Lorem-Ipsum"
  app_acceleration_enabled = true
  branch_gateway = true
  description = "Lorem-Ipsum"
  element_cluster_role = "Lorem-Ipsum"
  element_system_limit_profile_id = "123456789"
  extended_tags = [{
    key = "Lorem-Ipsum"
    value = "Lorem-Ipsum"
    value_type = "Lorem-Ipsum"
  }]
  location = {
    description = "Lorem-Ipsum"
    latitude = 0.1234
    longitude = 0.1234
  }
  multicast_peer_group_id = "123456789"
  name = "Lorem-Ipsum"
  nat_policysetstack_id = "123456789"
  policy_set_id = "123456789"
  prefer_lan_default_over_wan_default_route = true
  security_policyset_id = "123456789"
  security_policysetstack_id = "123456789"
  service_binding = "Lorem-Ipsum"
  sgi_config = {
    sgi_tag = 1234
    sgi_vendor_id = "123456789"
  }
  tags = ["lorem"]
}
