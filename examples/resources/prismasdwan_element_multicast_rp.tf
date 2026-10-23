# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_multicast_rp: Manages a Prisma SD-WAN Element Multicast Rp.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_multicast_rp/example,
# data_sources/element_multicast_rp/filters.
#
# Provider configuration (see the provider documentation):
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

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

resource "prismasdwan_element_multicast_rp" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name         = "tf example multicast rp"
  description  = "Managed by Prisma SDWAN Terraform IaaC Provider"
  ipv4_address = "10.50.0.1"
  groups = [
    {
      name        = "example group"
      ipv4_prefix = "239.1.0.0/16"
    }
  ]
}

#
# Reading element multicast rp objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_multicast_rp" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_multicast_rp.example.name
  }
  depends_on = [prismasdwan_element_multicast_rp.example]
}

# by id
data "prismasdwan_element_multicast_rp" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_multicast_rp.example.id
  }
  depends_on = [prismasdwan_element_multicast_rp.example]
}

# by ipv4_address
data "prismasdwan_element_multicast_rp" "find_by_ipv4_address" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "ipv4_address" = prismasdwan_element_multicast_rp.example.ipv4_address
  }
  depends_on = [prismasdwan_element_multicast_rp.example]
}

output "element_multicast_rp_found" {
  value = [for o in coalesce(data.prismasdwan_element_multicast_rp.find_by_name.items, []) : o.id]
}
