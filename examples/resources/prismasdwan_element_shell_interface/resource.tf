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
    lan_network_id = "123456789"
    vlan_id = 1234
  }]
  authentication_config = {
    fallback_retry_count = 1234
    mode = "Lorem-Ipsum"
    reauthentication_timeout = 1234
  }
  bound_interfaces = ["Lorem-Ipsum"]
  bypass_pair = {
    lan = "Lorem-Ipsum"
    lan_state_propagation = true
    use_relay = true
    wan = "Lorem-Ipsum"
  }
  cellular_config = {
    apn_config = {
      apn = "Lorem-Ipsum"
      authentication = "Lorem-Ipsum"
      clear_password = true
      password = "base64(<secret-string>)"
      password_encrypted = "base64(<secret-string>)"
      user_name = "Lorem-Ipsum"
    }
    apnprofile_id = "123456789"
    auto_apn = true
    ip_address_type = "Lorem-Ipsum"
    parent_module_id = "123456789"
    parent_sim_slot_number = 1234
  }
  description = "Lorem-Ipsum"
  devicemgmt_policysetstack_id = "123456789"
  dhcp_relay = {
    enabled = true
    option_82 = {
      circuit_id = "123456789"
      enabled = true
      reforwarding_policy = "Lorem-Ipsum"
      remote_id = "123456789"
    }
    server_ips = ["Lorem-Ipsum"]
    source_interface = "Lorem-Ipsum"
  }
  ethernet_port = {
  }
  fec_mode = "Lorem-Ipsum"
  interface_profile_id = "123456789"
  ipfixcollectorcontext_id = "123456789"
  ipfixfiltercontext_id = "123456789"
  ipv4_config = {
    dhcp_config = {
      client_id = "123456789"
      hostname = "Lorem-Ipsum"
    }
    dns_v4_config = {
      name_servers = ["Lorem-Ipsum"]
      search = ["Lorem-Ipsum"]
    }
    routes = [{
      destination = "Lorem-Ipsum"
      via = "Lorem-Ipsum"
    }]
    static_config = {
      address = "Lorem-Ipsum"
    }
    type = "Lorem-Ipsum"
  }
  ipv6_config = {
    dhcp_config = {
      client_id = "123456789"
      hostname = "Lorem-Ipsum"
    }
    dns_v6_config = {
      name_servers = ["Lorem-Ipsum"]
      search = ["Lorem-Ipsum"]
    }
    routes = [{
      destination = "Lorem-Ipsum"
      via = "Lorem-Ipsum"
    }]
    static_config = {
      address = "Lorem-Ipsum"
      enable_prefix_distribution = true
    }
    type = "Lorem-Ipsum"
  }
  loopback_config = {
    binding_interface_id = "123456789"
  }
  mac_address = "Lorem-Ipsum"
  multicast_config = {
    dr_priority = 1234
    igmp_static_joins = [{
      igmp_static_grp_ipv4 = "Lorem-Ipsum"
      igmp_static_src_ipv4 = "Lorem-Ipsum"
    }]
    igmp_version = "Lorem-Ipsum"
    multicast_enabled = true
  }
  nat_address = "Lorem-Ipsum"
  nat_address_v6 = "Lorem-Ipsum"
  nat_pools = [{
    ipv4_ranges = [{
      end = "Lorem-Ipsum"
      start = "Lorem-Ipsum"
    }]
    nat_pool_id = "123456789"
  }]
  nat_zone_id = "123456789"
  network_context_id = "123456789"
  parent = "Lorem-Ipsum"
  port_channel_config = {
    lacp_enabled = true
    transmission_mode = "Lorem-Ipsum"
  }
  pppoe_config = {
    host_uniq = "Lorem-Ipsum"
    ip_address_type = "Lorem-Ipsum"
    password = "base64(<secret-string>)"
    reconnection_delay = 1234
    service_name = "Lorem-Ipsum"
    username = "Lorem-Ipsum"
  }
  scope = "Lorem-Ipsum"
  secondary_ip_configs = [{
    ipv4_address = "Lorem-Ipsum"
    scope = "Lorem-Ipsum"
  }]
  service_link_config = {
    gre_config = {
      csum = true
      keepalive_enable = true
      keepalive_fail_count = 1234
      keepalive_interval = 1234
    }
    ipsec_config = {
      authentication = {
        certificate = "Lorem-Ipsum"
        certificate_profile_id = "123456789"
        comment = "Lorem-Ipsum"
        ikev1_params = {
          xauth_id = "123456789"
          xauth_secret = "base64(<secret-string>)"
          xauth_secret_encrypted = "base64(<secret-string>)"
          xauth_secret_hash = "base64(<secret-string>)"
          xauth_type = "Lorem-Ipsum"
        }
        local_ca_certificate = "Lorem-Ipsum"
        local_id = "123456789"
        local_id_custom = "Lorem-Ipsum"
        local_pa_certificate_id = "123456789"
        pa_master_key_id = "123456789"
        passphrase = "base64(<secret-string>)"
        passphrase_encrypted = "base64(<secret-string>)"
        peer_id_check = "Lorem-Ipsum"
        permit_peer_id_mismatch = true
        ppk_config = {
          enabled = true
          key_enabled = true
          mode = "Lorem-Ipsum"
          ppk_key_id = "123456789"
          ppk_secret = "base64(<secret-string>)"
          ppk_secret_configured = true
          ppk_secret_encrypted = "base64(<secret-string>)"
          ppk_secret_hash = "base64(<secret-string>)"
        }
        private_key = "base64(<secret-string>)"
        private_key_encrypted = "base64(<secret-string>)"
        remote_ca_certificate = "Lorem-Ipsum"
        remote_id = "123456789"
        secret = "base64(<secret-string>)"
        secret_encrypted = "base64(<secret-string>)"
        secret_hash = "base64(<secret-string>)"
        strict_validation_peer_extended_key_use = true
        type = "Lorem-Ipsum"
      }
      ipsec_profile_id = "123456789"
    }
    last_parent = "Lorem-Ipsum"
    parent = "Lorem-Ipsum"
    passive_mode = {
      enable = true
    }
    peer = {
      hostname = "Lorem-Ipsum"
      ip_addresses = ["Lorem-Ipsum"]
    }
    service_endpoint_id = "123456789"
    type = "Lorem-Ipsum"
  }
  site_wan_interface_ids = ["Lorem-Ipsum"]
  static_arp_configs = [{
    ipv4_address = "Lorem-Ipsum"
    mac_address = "Lorem-Ipsum"
  }]
  sub_interface = {
    native_vlan = true
    vlan_id = 1234
  }
  switch_port_config = {
    access_vlan_id = 1234
    bpdu_guard_enabled = true
    forward_fast_enabled = true
    native_vlan_id = 1234
    root_guard_enabled = true
    storm_control_config = {
      broadcast_threshold = 1234
      multicast_threshold = 1234
      unicast_threshold = 1234
    }
    stp_port_cost = 1234
    stp_port_enabled = true
    stp_port_priority = 1234
    trunk_vlans = ["Lorem-Ipsum"]
    vlan_mode = "Lorem-Ipsum"
    voice_vlan_id = 1234
  }
  tags = ["lorem"]
  type = "Lorem-Ipsum"
  vlan_config = {
    mstp_instance = 1234
    vlan_id = 1234
    voice_enabled = true
  }
}
