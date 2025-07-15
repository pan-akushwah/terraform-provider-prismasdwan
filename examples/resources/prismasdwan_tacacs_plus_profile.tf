# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "tacacs_plus_profile"
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

resource "prismasdwan_tacacs_plus_profile" "example_tacacs_profile_1" {
  name        = "example_tacacs_profile_1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  authentication_protocol = "chap"
  tacacs_plus_servers = [
  {
    server_ip = "10.11.12.14"
    server_port = 51
    secret = base64encode("abcd1234")
    timeout = 6
  }
]
}

resource "prismasdwan_tacacs_plus_profile" "example_tacacs_profile_2" {
  name        = "example_tacacs_profile_2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  authentication_protocol = "pap"
  tacacs_plus_servers = [
  {
    server_fqdn = "google.com"
    server_port = 50
    secret = base64encode("abcd1234")
    timeout = 2
  }
]
}
