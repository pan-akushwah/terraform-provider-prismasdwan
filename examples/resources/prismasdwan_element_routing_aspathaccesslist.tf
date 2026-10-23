# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_routing_aspathaccesslist: Manages a Prisma SD-WAN Element Routing Aspathaccesslist.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_routing_aspathaccesslist/example,
# data_sources/element_routing_aspathaccesslist/filters.
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

resource "prismasdwan_element_routing_aspathaccesslist" "example_routing_aspathaccesslist" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name           = "example_routing_aspathaccesslist"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags           = ["lorem", "ipsum"]
  auto_generated = false
  as_path_regex_list = [
    {
      order         = 1
      permit        = true
      as_path_regex = "^6602$"
    },
    {
      order         = 11
      permit        = true
      as_path_regex = "^765"
    },
    {
      order         = 21
      permit        = true
      as_path_regex = "^ab123"
    }
  ]
}

#
# Reading element routing aspathaccesslist objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_routing_aspathaccesslist" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist.name
  }
  depends_on = [prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist]
}

# by id
data "prismasdwan_element_routing_aspathaccesslist" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist.id
  }
  depends_on = [prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_element_routing_aspathaccesslist" "find_by_tags_member" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "tags.#(==\"lorem\")" = "lorem"
  }
  depends_on = [prismasdwan_element_routing_aspathaccesslist.example_routing_aspathaccesslist]
}

output "element_routing_aspathaccesslist_found" {
  value = [for o in coalesce(data.prismasdwan_element_routing_aspathaccesslist.find_by_name.items, []) : o.id]
}
