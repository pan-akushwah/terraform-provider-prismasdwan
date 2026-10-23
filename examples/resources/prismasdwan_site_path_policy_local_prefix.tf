# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_path_policy_local_prefix: Manages a Prisma SD-WAN Site Path Policy Local Prefix.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_path_policy_local_prefix/example,
# data_sources/site_path_policy_local_prefix/filters.
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

resource "prismasdwan_site_path_policy_local_prefix" "example_path_policy_local_prefix" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  prefix_id = prismasdwan_path_local_prefix.test_np_path_local_2.id
  ipv4_prefixes = [
    "10.11.12.13/32"
  ]
}

#
# Reading site path policy local prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_path_policy_local_prefix" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "id" = prismasdwan_site_path_policy_local_prefix.example_path_policy_local_prefix.id
  }
  depends_on = [prismasdwan_site_path_policy_local_prefix.example_path_policy_local_prefix]
}

# by a reference: every object with this prefix_id
data "prismasdwan_site_path_policy_local_prefix" "find_by_prefix_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "prefix_id" = prismasdwan_site_path_policy_local_prefix.example_path_policy_local_prefix.prefix_id
  }
  depends_on = [prismasdwan_site_path_policy_local_prefix.example_path_policy_local_prefix]
}

# by a value in the ipv4_prefixes list (gjson query: <list>.#(=="value"))
data "prismasdwan_site_path_policy_local_prefix" "find_by_ipv4_prefixes_member" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "ipv4_prefixes.#(==\"10.11.12.13/32\")" = "10.11.12.13/32"
  }
  depends_on = [prismasdwan_site_path_policy_local_prefix.example_path_policy_local_prefix]
}

output "site_path_policy_local_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_site_path_policy_local_prefix.find_by_id.items, []) : o.id]
}
