# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_shell".
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

resource "prismasdwan_element_shell" "example" {
  cluster_id = "123456789"
  cluster_insertion_mode = "Lorem-Ipsum"
  cluster_member_id = "123456789"
  description = "Lorem-Ipsum"
  device_profile_id = "123456789"
  hub_cluster_config = {
    intra_cluster_tunnel = {
      disabled = true
      source_interfaces = ["Lorem-Ipsum"]
    }
    track = {
      hosts = [{
        address_v4 = "Lorem-Ipsum"
        address_v6 = "Lorem-Ipsum"
        vrf_context_id = "123456789"
      }]
    }
  }
  led_config = {
    service_led_on = true
  }
  name = "Lorem-Ipsum"
  nat_policysetstack_id = "123456789"
  network_policysetstack_id = "123456789"
  priority_policysetstack_id = "123456789"
  site_id = "123456789"
  spoke_ha_config = {
    cluster_id = "123456789"
    enable = true
    priority = 1234
    source_interface = "Lorem-Ipsum"
    track = {
      interfaces = [{
        interface_id = "123456789"
        reduce_priority = 1234
      }]
      waninterfaces = [{
        reduce_priority = 1234
        wan_interface_id = "123456789"
      }]
    }
  }
  sw_obj = {
    location = "Lorem-Ipsum"
    version = "Lorem-Ipsum"
  }
  switch_config = {
    default_vlan_id = 1234
    mstp_enabled = true
    stp_aging_timer = 1234
    stp_forward_delay = 1234
    stp_hello_time = 1234
    stp_max_age = 1234
    stp_mode = "Lorem-Ipsum"
    stp_priority = 1234
  }
  tags = ["lorem"]
}
