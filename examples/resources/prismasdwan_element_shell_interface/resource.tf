# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_shell_interface".
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

resource "prismasdwan_element_shell_interface" "example" {
  admin_up = true
  attached_lan_networks = [{
    lan_network_id = "<lan_network_id>"
    vlan_id        = 100
  }]
  authentication_config = {
    fallback_retry_count     = 3
    mode                     = "none"
    reauthentication_timeout = 30
  }
  bound_interfaces = ["example_bound_interfaces"]
  bypass_pair = {
    lan                   = "example_lan"
    lan_state_propagation = false
    use_relay             = false
    wan                   = "example_wan"
  }
  cellular_config = {
    apn_config = {
      apn                = "example_apn"
      authentication     = "none"
      clear_password     = false
      password           = "<secret>"
      password_encrypted = "<secret>"
      user_name          = "example_user"
    }
    apnprofile_id          = "<apnprofile_id>"
    auto_apn               = false
    ip_address_type        = "ipv4"
    parent_module_id       = "<parent_module_id>"
    parent_sim_slot_number = 10
  }
  description                  = "Managed by Terraform"
  devicemgmt_policysetstack_id = "<devicemgmt_policysetstack_id>"
  dhcp_relay = {
    enabled = true
    option_82 = {
      circuit_id          = "<circuit_id>"
      enabled             = true
      reforwarding_policy = "replace"
      remote_id           = "<remote_id>"
    }
    server_ips       = ["example_server_ips"]
    source_interface = "example_source_interface"
  }
  ethernet_port = {
  }
  fec_mode                 = "auto"
  interface_profile_id     = "<interface_profile_id>"
  ipfixcollectorcontext_id = "<ipfixcollectorcontext_id>"
  ipfixfiltercontext_id    = "<ipfixfiltercontext_id>"
  ipv4_config = {
    dhcp_config = {
      client_id = "<client_id>"
      hostname  = "server.example.com"
    }
    dns_v4_config = {
      name_servers = ["example_name_servers"]
      search       = ["example_search"]
    }
    routes = [{
      destination = "example_destination"
      via         = "example_via"
    }]
    static_config = {
      address = "10.0.0.1"
    }
    type = "example_type"
  }
  ipv6_config = {
    dhcp_config = {
      client_id = "<client_id>"
      hostname  = "server.example.com"
    }
    dns_v6_config = {
      name_servers = ["example_name_servers"]
      search       = ["example_search"]
    }
    routes = [{
      destination = "example_destination"
      via         = "example_via"
    }]
    static_config = {
      address                    = "10.0.0.1"
      enable_prefix_distribution = false
    }
    type = "example_type"
  }
  loopback_config = {
    binding_interface_id = "<binding_interface_id>"
  }
  mac_address = "00:11:22:33:44:55"
  multicast_config = {
    dr_priority = 1
    igmp_static_joins = [{
      igmp_static_grp_ipv4 = "10.0.0.1"
      igmp_static_src_ipv4 = "10.0.0.1"
    }]
    igmp_version      = "IGMPV2"
    multicast_enabled = false
  }
  nat_address    = "10.0.0.1"
  nat_address_v6 = "2001:db8::1"
  nat_pools = [{
    ipv4_ranges = [{
      end   = "example_end"
      start = "example_start"
    }]
    nat_pool_id = "<nat_pool_id>"
  }]
  nat_zone_id        = "<nat_zone_id>"
  network_context_id = "<network_context_id>"
  parent             = "example_parent"
  port_channel_config = {
    lacp_enabled      = false
    transmission_mode = "Slow"
  }
  pppoe_config = {
    host_uniq          = "example_host_uniq"
    ip_address_type    = "example_ip_address_type"
    password           = "<secret>"
    reconnection_delay = 10
    service_name       = "example_service"
    username           = "example_username"
  }
  scope = "local"
  secondary_ip_configs = [{
    ipv4_address = "10.0.0.1"
    scope        = "example_scope"
  }]
  service_link_config = {
    gre_config = {
      csum                 = false
      keepalive_enable     = false
      keepalive_fail_count = 3
      keepalive_interval   = 30
    }
    ipsec_config = {
      authentication = {
        certificate            = "example_certificate"
        certificate_profile_id = "<certificate_profile_id>"
        comment                = "example_comment"
        ikev1_params = {
          xauth_id               = "<xauth_id>"
          xauth_secret           = "<secret>"
          xauth_secret_encrypted = "<secret>"
          xauth_secret_hash      = "<secret>"
          xauth_type             = "none"
        }
        local_ca_certificate    = "example_local_ca_certificate"
        local_id                = "local_ip"
        local_id_custom         = "example_local_id_custom"
        local_pa_certificate_id = "<local_pa_certificate_id>"
        pa_master_key_id        = "<pa_master_key_id>"
        passphrase              = "<secret>"
        passphrase_encrypted    = "<secret>"
        peer_id_check           = "EXACT"
        permit_peer_id_mismatch = false
        ppk_config = {
          enabled               = true
          key_enabled           = false
          mode                  = "preferred"
          ppk_key_id            = "<ppk_key_id>"
          ppk_secret            = "<secret>"
          ppk_secret_configured = false
          ppk_secret_encrypted  = "<secret>"
          ppk_secret_hash       = "<secret>"
        }
        private_key                             = "<secret>"
        private_key_encrypted                   = "<secret>"
        remote_ca_certificate                   = "example_remote_ca_certificate"
        remote_id                               = "<remote_id>"
        secret                                  = "<secret>"
        secret_encrypted                        = "<secret>"
        secret_hash                             = "<secret>"
        strict_validation_peer_extended_key_use = false
        type                                    = "none"
      }
      ipsec_profile_id = "<ipsec_profile_id>"
    }
    last_parent = "example_last_parent"
    parent      = "example_parent"
    passive_mode = {
      enable = true
    }
    peer = {
      hostname     = "server.example.com"
      ip_addresses = ["example_ip_addresses"]
    }
    service_endpoint_id = "<service_endpoint_id>"
    type                = "ipsec"
  }
  site_wan_interface_ids = ["<site_wan_interface_id>"]
  static_arp_configs = [{
    ipv4_address = "10.0.0.1"
    mac_address  = "00:11:22:33:44:55"
  }]
  sub_interface = {
    native_vlan = false
    vlan_id     = 100
  }
  switch_port_config = {
    access_vlan_id       = 100
    bpdu_guard_enabled   = false
    forward_fast_enabled = false
    native_vlan_id       = 100
    root_guard_enabled   = false
    storm_control_config = {
      broadcast_threshold = 64
      multicast_threshold = 64
      unicast_threshold   = 64
    }
    stp_port_cost     = 443
    stp_port_enabled  = false
    stp_port_priority = 240
    trunk_vlans       = ["example_trunk_vlans"]
    vlan_mode         = "access"
    voice_vlan_id     = 100
  }
  tags = ["terraform"]
  type = "service_link"
  vlan_config = {
    mstp_instance = 10
    vlan_id       = 100
    voice_enabled = false
  }
}
