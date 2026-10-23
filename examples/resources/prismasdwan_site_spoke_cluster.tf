# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_spoke_cluster: Manages a Prisma SD-WAN Site Spoke Cluster.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_spoke_cluster/example,
# data_sources/site_spoke_cluster/filters.
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

resource "prismasdwan_site_spoke_cluster" "site_spoke_cluster_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  name                   = "example_cluster_alpha"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                   = ["example", "cluster"]
  preempt                = true
  advertisement_interval = 0.25
}

#
# Reading site spoke cluster objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_site_spoke_cluster" "find_by_name" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "name" = prismasdwan_site_spoke_cluster.site_spoke_cluster_1.name
  }
  depends_on = [prismasdwan_site_spoke_cluster.site_spoke_cluster_1]
}

# by id
data "prismasdwan_site_spoke_cluster" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "id" = prismasdwan_site_spoke_cluster.site_spoke_cluster_1.id
  }
  depends_on = [prismasdwan_site_spoke_cluster.site_spoke_cluster_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_site_spoke_cluster" "find_by_tags_member" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_site_spoke_cluster.site_spoke_cluster_1]
}

output "site_spoke_cluster_found" {
  value = [for o in coalesce(data.prismasdwan_site_spoke_cluster.find_by_name.items, []) : o.id]
}
