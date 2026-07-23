# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_policy_rule"
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

resource "prismasdwan_path_policy_rule" "example_path_policy_rule" {
  // needed when a new policy set is created via terraform
  x_parameters = {
    policy_set_id = prismasdwan_path_policy_set.example_path_policy_set.id
  }
  name        = "example_test_path_policy_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example", "demo"]
  order_number       = 1024
  enabled            = true
  network_context_id = prismasdwan_network_context.example_network_context.id
  paths_allowed = {
    active_paths = [
      {
        label     = "public-internet"
        path_type = "direct"
      }
    ]
    backup_paths = [
      {
        label     = "private-mpls"
        path_type = "vpn"
      }
    ]
  }
}