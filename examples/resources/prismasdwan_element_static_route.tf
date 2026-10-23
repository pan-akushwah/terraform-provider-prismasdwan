# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_static_route: Manages a Prisma SD-WAN Element Static Route.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_static_route/example,
# data_sources/element_static_route/filters.
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
  address_family             = "ipv4" # one of: ipv4, ipv6
  destination_prefix         = "192.168.100.0/24"
  scope                      = "local" # one of: global, local
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

#
# Reading element static route objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_static_route" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_static_route.example.name
  }
  depends_on = [prismasdwan_element_static_route.example]
}

# by id
data "prismasdwan_element_static_route" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_static_route.example.id
  }
  depends_on = [prismasdwan_element_static_route.example]
}

# by a reference: every object with this vrf_context_id
data "prismasdwan_element_static_route" "find_by_vrf_context_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "vrf_context_id" = prismasdwan_element_static_route.example.vrf_context_id
  }
  depends_on = [prismasdwan_element_static_route.example]
}

# by destination_prefix
data "prismasdwan_element_static_route" "find_by_destination_prefix" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "destination_prefix" = prismasdwan_element_static_route.example.destination_prefix
  }
  depends_on = [prismasdwan_element_static_route.example]
}

output "element_static_route_found" {
  value = [for o in coalesce(data.prismasdwan_element_static_route.find_by_name.items, []) : o.id]
}
