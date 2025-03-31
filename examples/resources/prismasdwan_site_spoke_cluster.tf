# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_spoke_cluster"
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

resource "prismasdwan_site_spoke_cluster" "site_spoke_cluster_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  name = "example_cluster_alpha"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["example", "cluster"]
  preempt = true
  advertisement_interval = 0.25
}
