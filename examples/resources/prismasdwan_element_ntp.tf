# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ntp"
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

# The element to configure. "element_shell_site" and "manual_device_shell" are example names; use your own.
resource "prismasdwan_resource_locator" "element_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "element_shell_site"
}

resource "prismasdwan_resource_locator" "element_shell" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

#
# Every element has exactly one NTP configuration, named "default". Read it and manage it.
#
data "prismasdwan_element_ntp" "existing" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_element_ntp" "example" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    ntp_id     = data.prismasdwan_element_ntp.existing.items[0].id
  }
  name        = "default"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  ntp_servers = [
    {
      host     = "0.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    },
    {
      host     = "time.nist.gov"
      version  = 4
      min_poll = 9
      max_poll = 10
    }
  ]
}
