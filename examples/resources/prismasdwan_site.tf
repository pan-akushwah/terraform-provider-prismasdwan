# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site"
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

resource "prismasdwan_site" "site_1" {
  name = "tf site 1 example name"
  description = "example description text"
  tags = ["tag1", "tag2", "tag3"]
  admin_state = "disabled"
  address = {
    city = "Mysore"
    state = "Karnataka"
    country = "India"
  }
  location = {
    longitude = 78.5913
    latitude = 12.979101
  }
  element_cluster_role = "SPOKE"
  service_binding = prismasdwan_domain.test_domain.id
  network_policysetstack_id = prismasdwan_path_policy_stack.test_path_policy_stack.id
  priority_policysetstack_id = prismasdwan_qos_policy_stack.test_qos_policy_stack_1.id
  nat_policysetstack_id = prismasdwan_nat_policy_set_stack.test_nat_policy_set_stack.id
  security_policysetstack_id = prismasdwan_security_policy_stack.test_security_policy_stack.id
  perfmgmt_policysetstack_id = prismasdwan_performance_policy_stack.performance_policy_stack_1.id
  vrf_context_profile_id = prismasdwan_vrf_context_profile.test_vrf_context_profile_2.id
  branch_gateway = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled = false
  multicast_peer_group_id = prismasdwan_multicast_peer_group_profile.test_multicase_peer_group_profile_1.id
}


resource "prismasdwan_site" "site_2" {
  name = "tf site example"
  description = "Sample description for the site"
  tags = ["tag1", "tag2", "tag3"]
  admin_state = "disabled"
  address = {
    city = "Coimbatore"
    state = "Karnataka"
    country = "India"
  }
  location = {
    longitude = 80.5913
    latitude = 13.979101
  }
  element_cluster_role = "HUB"
  vrf_context_profile_id = prismasdwan_vrf_context_profile.test_vrf_context_profile_2.id
  branch_gateway = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled = false
}