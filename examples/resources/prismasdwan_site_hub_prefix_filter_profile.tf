# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_hub_prefix_filter_profile: Manages a Prisma SD-WAN Site Hub Prefix Filter Profile.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_hub_prefix_filter_profile/example,
# data_sources/site_hub_prefix_filter_profile/filters.
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

resource "prismasdwan_site" "dc_site" {
  name                 = "tf hub prefix filter dc site"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "HUB"
  address = {
    city    = "Santa Clara"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.9552
    latitude  = 37.3541
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

resource "prismasdwan_site_hub_prefix_filter_profile" "hub_prefix_filter_profile_1" {
  # Needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  name        = "tf managed hub prefix filter profile"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["terraform", "example"]
  path_prefix_filter_list = [
    {
      vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
      path_prefix_filters = [
        {
          "order" : 1,
          "permit" : true,
          "ipv4_prefix" : "10.10.10.0/24"
        },
        {
          "order" : 2,
          "permit" : false,
          "ipv4_prefix" : "13.13.13.0/24"
        }
      ]
    }
  ]
}

#
# Reading site hub prefix filter profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_site_hub_prefix_filter_profile" "find_by_name" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  filters = {
    "name" = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_1.name
  }
  depends_on = [prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_1]
}

# by id
data "prismasdwan_site_hub_prefix_filter_profile" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  filters = {
    "id" = prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_1.id
  }
  depends_on = [prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_site_hub_prefix_filter_profile" "find_by_tags_member" {
  x_parameters = {
    site_id = prismasdwan_site.dc_site.id
  }
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_site_hub_prefix_filter_profile.hub_prefix_filter_profile_1]
}

output "site_hub_prefix_filter_profile_found" {
  value = [for o in coalesce(data.prismasdwan_site_hub_prefix_filter_profile.find_by_name.items, []) : o.id]
}
