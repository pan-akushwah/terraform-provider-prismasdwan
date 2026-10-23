# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_routing_ipcommunitylist"
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

resource "prismasdwan_element_routing_ipcommunitylist" "example_routing_ipcommunitylist" {
 x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
 }
 name = "1"
 description = "Managed by Prisma SDWAN Terraform IaaC Provider"
 tags = ["lorem", "ipsum"]
 auto_generated = false
 community_list = [
 {
    permit = false
    community_str = "no-export"
 },
 {
    permit = true
    community_str = "internet"
 },
 {
    permit = true
    community_str = "local-AS"
 }
]
}
