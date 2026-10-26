# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_routing_routemap: Manages a Prisma SD-WAN Element Routing Routemap.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_routing_routemap/example,
# data_sources/element_routing_routemap/filters.
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

resource "prismasdwan_element_routing_routemap" "example_routing_routemap" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name        = "example_routemap"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform", "example"]
  route_map_entries = [
    {
      order  = 10
      permit = true
      match = {
        as_path_id        = prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist.id
        ip_prefix_list_id = prismasdwan_element_routing_prefixlist.example_routing_prefixlist.id
        ip_next_hop_id    = prismasdwan_element_routing_prefixlist.example_routing_prefixlist.id
        community_list_id = prismasdwan_element_routing_ipcommunitylist.example_routing_ipcommunitylist.id
        tag               = 0
        metric            = null
      }
      set = {
        as_path_prepend    = "5"
        local_preference   = 0
        weight             = 1
        community          = null
        ip_next_hop        = "peer-address"
        ip_v6_next_hop     = null
        tag                = 0
        additive_community = false
        type               = null
        metric             = null
      }
      continue_entry = null
    }
  ]
  auto_generated = false
  used_for       = "bgp" # one of: bgp, ospf
}

#
# Reading element routing routemap objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_routing_routemap" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_routing_routemap.example_routing_routemap.name
  }
  depends_on = [prismasdwan_element_routing_routemap.example_routing_routemap]
}

# by id
data "prismasdwan_element_routing_routemap" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_routing_routemap.example_routing_routemap.id
  }
  depends_on = [prismasdwan_element_routing_routemap.example_routing_routemap]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_element_routing_routemap" "find_by_tags_member" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_element_routing_routemap.example_routing_routemap]
}

output "element_routing_routemap_found" {
  value = [for o in coalesce(data.prismasdwan_element_routing_routemap.find_by_name.items, []) : o.id]
}
