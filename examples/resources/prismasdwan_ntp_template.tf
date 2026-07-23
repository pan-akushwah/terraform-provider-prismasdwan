# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ntp_template"
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

resource "prismasdwan_ntp_template" "example_ntp_template_1" {
  name        = "example_ntp_template_1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  default_template = true
  ntp_servers = [
  {
    host = "10.11.12.13"
    version = 4
    min_poll = 6
    max_poll = 10
  },
  {
    host = "10.11.12.14"
    version = 4
    min_poll = 6
    max_poll = 10
  }
]
}

resource "prismasdwan_ntp_template" "example_ntp_template_2" {
  name        = "example_ntp_template_2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem"]
  default_template = false
  ntp_servers = [
  {
    host = "0.cloudgenix.pool.ntp.org"
    version = 4
    min_poll = 4
    max_poll = 9
  },
  {
    host = "1.cloudgenix.pool.ntp.org"
    version = 4
    min_poll = 9
    max_poll = 10
  },
  {
    host = "time.nist.gov"
    version = 4
    min_poll = 4
    max_poll = 10
  },
  {
    host = "10.11.12.15"
    version = 4
    min_poll = 6
    max_poll = 10
  }
]
}
