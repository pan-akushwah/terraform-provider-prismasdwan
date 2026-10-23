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
  enabled_wan_interface_ids = ["Lorem-Ipsum"]
  ipsec_tunnel_configs = {
    anti_replay = true
    copy_tos = true
    enable_gre_encapsulation = true
    ike_key_exchange = "Lorem-Ipsum"
    prismaaccess_ike_crypto_profile_id = "123456789"
    prismaaccess_ipsec_profile_id = "123456789"
    tunnel_monitoring = true
  }
  is_active = true
  is_enabled = true
  license_type = "Lorem-Ipsum"
  prismaaccess_edge_location_config = ["Lorem-Ipsum"]
  prismaaccess_qos_cir_mbps = 1234
  prismaaccess_qos_profile_id = "123456789"
  prismasase_connection_id = "123456789"
  remote_network_groups = [{
    ipsec_tunnels = [{
      authentication = {
        branch_ike_identification = "Lorem-Ipsum"
        prismaaccess_ike_identification = "Lorem-Ipsum"
        psk = "base64(<secret-string>)"
      }
      name = "Lorem-Ipsum"
      routing = {
        branch_as_number = "Lorem-Ipsum"
        branch_ip_address = "Lorem-Ipsum"
        prismaaccess_ip_address = "Lorem-Ipsum"
      }
      routing_configs = {
        advertise_default_route = true
        bgp_secret = "base64(<secret-string>)"
        export_routes = true
        summarize_mobile_routes_before_advertise = true
      }
      wan_interface_id = "123456789"
    }]
    name = "Lorem-Ipsum"
    spn_name = ["Lorem-Ipsum"]
  }]
  routing_configs = {
    advertise_default_route = true
    bgp_secret = "base64(<secret-string>)"
    branch_as_number = "Lorem-Ipsum"
    deployment_mode = "Lorem-Ipsum"
    export_routes = true
    peering_type = "Lorem-Ipsum"
    summarize_mobile_routes_before_advertise = true
  }
  site_id = "123456789"
}
