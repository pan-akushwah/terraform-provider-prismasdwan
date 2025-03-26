# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "multicast_peer_group_profile"
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
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_multicast_peer_group_profile" "test_multicase_peer_group_profile_1" {
  name        = "tf managed profile 1"
  description = "lorem ipsum"
  tags        = ["ipsum", "lorem"]
  peer_sites = [
    {
      peer_site_id = prismasdwan_site.site_2.id
    }
  ]
  is_source_site_receiver = true
}