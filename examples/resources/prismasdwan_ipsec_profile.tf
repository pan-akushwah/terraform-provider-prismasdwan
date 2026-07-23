# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ipsec_profile"
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
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# ============================================================================
# Example 1: Basic IPSec Profile with Pre-Shared Key (PSK)
# ============================================================================

# Example based on Prisma Access auto-generated IPSec profile
resource "prismasdwan_ipsec_profile" "prisma_access_profile" {
  # Required fields
  name = "Terraform_IPSEC-Profile"

  # Optional fields
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["prisma_access"]

  # Authentication configuration with custom IDs
  authentication = {
    type            = "none"
    local_id        = "custom"
    local_id_custom = "sdwan-tunnel@mycompany.com"
    remote_id       = "access-tunnel@mycompany.com"

    # IKEv1 parameters (even though we're using IKEv2, these params may be present)
    ikev1_params = {
      xauth_type = "none"
    }
  }

  # IKE (Phase 1) configuration with ECP384 (group20)
  ike_group = {
    key_exchange = "ikev2"
    lifetime     = 8 # 8 hours
    aggressive   = false
    reauth       = false
    port         = 500

    proposals = [{
      dh_groups  = "ecp384" # Elliptic Curve Prime 384-bit (group20)
      encryption = "aes256" # AES-256
      hash       = "sha512" # SHA-512
      prf        = "none"   # No separate PRF (using hash)
    }]
  }

  # ESP (Phase 2) configuration
  esp_group = {
    mode                = "tunnel"
    lifetime            = 1 # 1 hour
    force_encapsulation = false

    proposals = [{
      dh_groups  = "ecp384" # Perfect Forward Secrecy with ECP384
      encryption = "aes256" # AES-256
      hash       = "sha512" # SHA-512
      prf        = "none"
    }]
  }

  # Dead Peer Detection (DPD) configuration
  dpd_enable  = true
  dpd_delay   = 10
  dpd_timeout = 30
}
