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
    city      = "Santa Clara"
    country   = "United States"
    post_code = "95054"
    state     = "California"
    street    = "3000 Tannery Way"
    street2   = "Building A"
  }
  admin_state                     = "active"
  app_acceleration_enabled        = false
  branch_gateway                  = false
  description                     = "Managed by Terraform"
  element_cluster_role            = "SPOKE"
  element_system_limit_profile_id = "<element_system_limit_profile_id>"
  extended_tags = [{
    key        = "example_key"
    value      = "example_value"
    value_type = "example_value_type"
  }]
  location = {
    description = "Managed by Terraform"
    latitude    = 37.3541
    longitude   = -121.9552
  }
  multicast_peer_group_id                   = "<multicast_peer_group_id>"
  name                                      = "example_name"
  nat_policysetstack_id                     = "<nat_policysetstack_id>"
  policy_set_id                             = "<policy_set_id>"
  prefer_lan_default_over_wan_default_route = false
  security_policyset_id                     = "<security_policyset_id>"
  security_policysetstack_id                = "<security_policysetstack_id>"
  service_binding                           = "<domain_id>"
  sgi_config = {
    sgi_tag       = 10
    sgi_vendor_id = "SGI_VENDOR_ID_TYPE_8909"
  }
  tags = ["terraform"]
}
