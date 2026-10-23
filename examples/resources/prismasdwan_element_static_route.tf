# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_static_route"
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

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

resource "prismasdwan_element_static_route" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name                       = "tf example static route"
  description                = "Managed by Prisma SDWAN Terraform IaaC Provider"
  address_family             = "ipv4"
  destination_prefix         = "192.168.100.0/24"
  scope                      = "local"
  vrf_context_id             = prismasdwan_resource_locator.global_vrf_context.result
  nexthop_reachability_probe = false
  nexthops = [
    {
      nexthop_ip     = "10.0.0.1"
      admin_distance = 1
      self           = false
    }
  ]
}
