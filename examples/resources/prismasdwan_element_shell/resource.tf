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
  cluster_id             = "<cluster_id>"
  cluster_insertion_mode = "example_cluster_insertion_mode"
  cluster_member_id      = "<cluster_member_id>"
  description            = "Managed by Terraform"
  device_profile_id      = "<device_profile_id>"
  hub_cluster_config = {
    intra_cluster_tunnel = {
      disabled          = false
      source_interfaces = ["example_source_interfaces"]
    }
    track = {
      hosts = [{
        address_v4     = "example_address_v4"
        address_v6     = "2001:db8::1"
        vrf_context_id = "<vrf_context_id>"
      }]
    }
  }
  led_config = {
    service_led_on = false
  }
  name                       = "example_name"
  nat_policysetstack_id      = "<nat_policysetstack_id>"
  network_policysetstack_id  = "<network_policysetstack_id>"
  priority_policysetstack_id = "<priority_policysetstack_id>"
  site_id                    = "<site_id>"
  spoke_ha_config = {
    cluster_id       = "<cluster_id>"
    enable           = true
    priority         = 1
    source_interface = "example_source_interface"
    track = {
      interfaces = [{
        interface_id    = "<interface_id>"
        reduce_priority = 1
      }]
      waninterfaces = [{
        reduce_priority  = 1
        wan_interface_id = "<wan_interface_id>"
      }]
    }
  }
  sw_obj = {
    location = "example_location"
    version  = "example_version"
  }
  switch_config = {
    default_vlan_id   = 100
    mstp_enabled      = false
    stp_aging_timer   = 30
    stp_forward_delay = 10
    stp_hello_time    = 10
    stp_max_age       = 10
    stp_mode          = "rstp"
    stp_priority      = 1
  }
  tags = ["terraform"]
}
