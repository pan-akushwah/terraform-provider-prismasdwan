# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_prisma_sase_connection".
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

resource "prismasdwan_site_prisma_sase_connection" "example" {
  enabled_wan_interface_ids = ["<enabled_wan_interface_id>"]
  ipsec_tunnel_configs = {
    anti_replay                        = false
    copy_tos                           = false
    enable_gre_encapsulation           = false
    ike_key_exchange                   = "example_ike_key_exchange"
    prismaaccess_ike_crypto_profile_id = "<prismaaccess_ike_crypto_profile_id>"
    prismaaccess_ipsec_profile_id      = "<prismaaccess_ipsec_profile_id>"
    tunnel_monitoring                  = false
  }
  is_active                         = false
  is_enabled                        = false
  license_type                      = "example_license_type"
  prismaaccess_edge_location_config = ["example_prismaaccess_edge_location_config"]
  prismaaccess_qos_cir_mbps         = 10
  prismaaccess_qos_profile_id       = "<prismaaccess_qos_profile_id>"
  prismasase_connection_id          = "<prismasase_connection_id>"
  remote_network_groups = [{
    ipsec_tunnels = [{
      authentication = {
        branch_ike_identification       = "example_branch_ike_identification"
        prismaaccess_ike_identification = "example_prismaaccess_ike_identification"
        psk                             = "<secret>"
      }
      name = "example_name"
      routing = {
        branch_as_number        = "65000"
        branch_ip_address       = "10.0.0.1"
        prismaaccess_ip_address = "10.0.0.1"
      }
      routing_configs = {
        advertise_default_route                  = false
        bgp_secret                               = "<secret>"
        export_routes                            = false
        summarize_mobile_routes_before_advertise = false
      }
      wan_interface_id = "<wan_interface_id>"
    }]
    name     = "example_name"
    spn_name = ["example_spn"]
  }]
  routing_configs = {
    advertise_default_route                  = false
    bgp_secret                               = "<secret>"
    branch_as_number                         = "65000"
    deployment_mode                          = "example_deployment_mode"
    export_routes                            = false
    peering_type                             = "example_peering_type"
    summarize_mobile_routes_before_advertise = false
  }
  site_id = "<site_id>"
}
