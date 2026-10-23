# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_lan_network: Manages a Prisma SD-WAN Site Lan Network.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_lan_network/example,
# data_sources/site_lan_network/filters.
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

resource "prismasdwan_site" "site_1" {
  name                 = "tf site 1 for example"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "SPOKE"
  address = {
    city    = "San Jose"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.8863
    latitude  = 37.3382
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

# The built-in Global VRF
resource "prismasdwan_resource_locator" "default_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

resource "prismasdwan_site_lan_network" "site_lan_network_1" {
  # This is needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  name        = "example_lan_network"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example", "network"]
  ipv4_config = {
    prefixes = [
      "31.10.10.0/24"
    ]
  }
  scope          = "global" # one of: global, local
  vrf_context_id = prismasdwan_resource_locator.default_vrf_context.result
}

#
# Reading site lan network objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_site_lan_network" "find_by_name" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "name" = prismasdwan_site_lan_network.site_lan_network_1.name
  }
  depends_on = [prismasdwan_site_lan_network.site_lan_network_1]
}

# by id
data "prismasdwan_site_lan_network" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "id" = prismasdwan_site_lan_network.site_lan_network_1.id
  }
  depends_on = [prismasdwan_site_lan_network.site_lan_network_1]
}

# by a reference: every object with this vrf_context_id
data "prismasdwan_site_lan_network" "find_by_vrf_context_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "vrf_context_id" = prismasdwan_site_lan_network.site_lan_network_1.vrf_context_id
  }
  depends_on = [prismasdwan_site_lan_network.site_lan_network_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_site_lan_network" "find_by_tags_member" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_site_lan_network.site_lan_network_1]
}

output "site_lan_network_found" {
  value = [for o in coalesce(data.prismasdwan_site_lan_network.find_by_name.items, []) : o.id]
}
