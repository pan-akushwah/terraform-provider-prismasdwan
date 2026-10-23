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
  description = "Lorem-Ipsum"
  dpd_delay = 1234
  dpd_enable = true
  dpd_timeout = 1234
  esp_group = {
    force_encapsulation = true
    lifesize = {
      units = "Lorem-Ipsum"
      value = 1234
    }
    lifetime = 1234
    lifetime_units = "Lorem-Ipsum"
    mode = "Lorem-Ipsum"
    pqc_kem_config = {
      block_vulnerable_cipher = true
      enabled = true
      round_1_algorithms = ["Lorem-Ipsum"]
      round_2_algorithms = ["Lorem-Ipsum"]
      round_3_algorithms = ["Lorem-Ipsum"]
      round_4_algorithms = ["Lorem-Ipsum"]
      round_5_algorithms = ["Lorem-Ipsum"]
      round_6_algorithms = ["Lorem-Ipsum"]
      round_7_algorithms = ["Lorem-Ipsum"]
    }
    proposals = [{
      dh_groups = "Lorem-Ipsum"
      encryption = "Lorem-Ipsum"
      hash = "Lorem-Ipsum"
      prf = "Lorem-Ipsum"
    }]
    responder_sase_proposals = {
      dh_group = ["Lorem-Ipsum"]
      encryption = ["Lorem-Ipsum"]
      hash = ["Lorem-Ipsum"]
    }
  }
  ike_group = {
    aggressive = true
    authentication_multiple = 1234
    key_exchange = "Lorem-Ipsum"
    lifetime = 1234
    lifetime_units = "Lorem-Ipsum"
    port = 1234
    pqc_kem_config = {
      block_vulnerable_cipher = true
      enabled = true
      round_1_algorithms = ["Lorem-Ipsum"]
      round_2_algorithms = ["Lorem-Ipsum"]
      round_3_algorithms = ["Lorem-Ipsum"]
      round_4_algorithms = ["Lorem-Ipsum"]
      round_5_algorithms = ["Lorem-Ipsum"]
      round_6_algorithms = ["Lorem-Ipsum"]
      round_7_algorithms = ["Lorem-Ipsum"]
    }
    proposals = [{
      dh_groups = "Lorem-Ipsum"
      encryption = "Lorem-Ipsum"
      hash = "Lorem-Ipsum"
      prf = "Lorem-Ipsum"
    }]
    reauth = true
  }
  name = "Lorem-Ipsum"
  tags = ["lorem"]
  used_for = "Lorem-Ipsum"
}
