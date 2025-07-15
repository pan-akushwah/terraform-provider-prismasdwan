# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "nat_policy_rule"
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

resource "prismasdwan_nat_policy_rule" "test_nat_policy_rule_1" {
  # This is needed for path parameters
  x_parameters = {
    nat_policy_set_id = prismasdwan_nat_policy_set.test_nat_policy_set.id
  }
  name = "example_test_nat_rule"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = ["sample", "tags"]
  source_ports = [
    {
      to = 512
      from = 256
    },
    {
      to = 1024
      from = 513
    }
  ]
  destination_ports = [
    {
      to = 120
      from = 111
    },
    {
      to = 300
      from = 200
    }
  ]
  protocol = 6
  actions = [
    {
      type = "source_nat_dynamic"
      nat_pool_id = prismasdwan_nat_policy_pool.test_nat_policy_pool.id
    },
    {
      type = "destination_nat_dynamic"
      nat_pool_id = prismasdwan_nat_policy_pool.test_nat_policy_pool.id
      port = 520
    },
    {
      type = "source_nat_static"
      nat_pool_id = prismasdwan_nat_policy_pool.test_nat_policy_pool.id
    },
    {
      type = "destination_nat_static"
      nat_pool_id = prismasdwan_nat_policy_pool.test_nat_policy_pool.id
      port = 235
    }
  ]
  source_prefixes_id = prismasdwan_nat_local_prefix.test_nat_local_prefix_01.id
  destination_prefixes_id = prismasdwan_nat_local_prefix.test_nat_local_prefix_02.id
  source_zone_id = prismasdwan_nat_zone.test_nat_zone.id
  enabled = true
}

