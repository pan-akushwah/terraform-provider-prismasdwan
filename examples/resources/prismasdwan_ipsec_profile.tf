# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_ipsec_profile: Manages a Prisma SD-WAN Ipsec Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - With aes256, use sha256 or sha512 for ESP; sha384 is rejected (CBC_ESP_PROPOSAL_HASH_INVALID).
#
# Tested end to end by the provider suite: resources/ipsec_profile/esp_hash_update, resources/ipsec_profile/example,
# data_sources/ipsec_profile/filters.
#
# Provider configuration (see the provider documentation):
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

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

#
# Reading ipsec profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_ipsec_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_ipsec_profile.prisma_access_profile.name
  }
  depends_on = [prismasdwan_ipsec_profile.prisma_access_profile]
}

# by id
data "prismasdwan_ipsec_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_ipsec_profile.prisma_access_profile.id
  }
  depends_on = [prismasdwan_ipsec_profile.prisma_access_profile]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipsec_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"prisma_access\")" = "prisma_access"
  }
  depends_on = [prismasdwan_ipsec_profile.prisma_access_profile]
}

output "ipsec_profile_found" {
  value     = [for o in coalesce(data.prismasdwan_ipsec_profile.find_by_name.items, []) : o.id]
  sensitive = true
}
