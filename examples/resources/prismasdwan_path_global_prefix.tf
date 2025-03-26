# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "path_global_prefix"
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

resource "prismasdwan_path_global_prefix" "example_1" {
  name          = "global_prefix_hq"
  description   = "Global prefix for headquarters"
  tags          = ["hq", "primary"]
  ipv4_prefixes = ["192.168.0.0/16", "172.16.0.0/12"]
  ipv6_prefixes = ["2001:db8::/32", "2001:db8:1::/48"]
}

resource "prismasdwan_path_global_prefix" "example_2" {
  name          = "branch_office_prefix"
  description   = "Global prefix for branch offices"
  tags          = ["branch", "remote"]
  ipv4_prefixes = ["10.0.0.0/8", "172.31.0.0/16"]
  ipv6_prefixes = ["fd00::/8"]
}

resource "prismasdwan_path_global_prefix" "example_3" {
  name          = "data_center_prefix"
  description   = "Global prefix for data centers"
  tags          = ["data_center", "high_security"]
  ipv4_prefixes = ["203.0.113.0/24", "198.51.100.0/24", "192.0.2.0/24"]
  ipv6_prefixes = ["2001:db8:2::/48", "2001:db8:3::/48"]
}
