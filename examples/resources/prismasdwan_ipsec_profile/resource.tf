# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ipsec_profile".
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

resource "prismasdwan_ipsec_profile" "example" {
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
  description = "Managed by Terraform"
  dpd_delay   = 10
  dpd_enable  = false
  dpd_timeout = 30
  esp_group = {
    force_encapsulation = false
    lifesize = {
      units = "example_units"
      value = 10
    }
    lifetime       = 30
    lifetime_units = "example_lifetime_units"
    mode           = "tunnel"
    pqc_kem_config = {
      block_vulnerable_cipher = false
      enabled                 = true
      round_1_algorithms      = ["example_round_1_algorithms"]
      round_2_algorithms      = ["example_round_2_algorithms"]
      round_3_algorithms      = ["example_round_3_algorithms"]
      round_4_algorithms      = ["example_round_4_algorithms"]
      round_5_algorithms      = ["example_round_5_algorithms"]
      round_6_algorithms      = ["example_round_6_algorithms"]
      round_7_algorithms      = ["example_round_7_algorithms"]
    }
    proposals = [{
      dh_groups  = "modp768"
      encryption = "aes256gcm16"
      hash       = "sha256"
      prf        = "md5"
    }]
    responder_sase_proposals = {
      dh_group   = ["NONE"]
      encryption = ["NONE"]
      hash       = ["MD5"]
    }
  }
  ike_group = {
    aggressive              = false
    authentication_multiple = 10
    key_exchange            = "ikev1"
    lifetime                = 30
    lifetime_units          = "example_lifetime_units"
    port                    = 443
    pqc_kem_config = {
      block_vulnerable_cipher = false
      enabled                 = true
      round_1_algorithms      = ["example_round_1_algorithms"]
      round_2_algorithms      = ["example_round_2_algorithms"]
      round_3_algorithms      = ["example_round_3_algorithms"]
      round_4_algorithms      = ["example_round_4_algorithms"]
      round_5_algorithms      = ["example_round_5_algorithms"]
      round_6_algorithms      = ["example_round_6_algorithms"]
      round_7_algorithms      = ["example_round_7_algorithms"]
    }
    proposals = [{
      dh_groups  = "modp768"
      encryption = "aes256gcm16"
      hash       = "sha256"
      prf        = "md5"
    }]
    reauth = false
  }
  name     = "example_name"
  tags     = ["terraform"]
  used_for = "fabric_vpn"
}
