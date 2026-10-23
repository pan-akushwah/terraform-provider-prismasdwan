# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_bgp_config: Manages a Prisma SD-WAN Element Bgp Config.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id, bgp_config_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Every element has exactly one BGP configuration; read its id with the data source. Destroying does not restore
#     previous values.
#
# Tested end to end by the provider suite: resources/element_bgp_config/example,
# data_sources/element_bgp_config/filters.
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

data "prismasdwan_element_bgp_config" "existing_bgp_config" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all elements
  }
}

#
# create the bgp config, if does not exist
resource "prismasdwan_element_bgp_config" "single_bgp_config" {

  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
    # set the bgp_config_id as empty string if there is no config available
    bgp_config_id = length(data.prismasdwan_element_bgp_config.existing_bgp_config.items) == 0 ? "" : data.prismasdwan_element_bgp_config.existing_bgp_config.items[0].id
  }
  local_as_num           = "350"
  keepalive_time         = 30
  hold_time              = 90
  adv_interval           = 1
  peer_retry_time        = 120
  multi_hop_limit        = 1
  maximum_paths          = 1
  admin_distance         = 20
  graceful_restart       = false
  stalepath_time         = 121
  prefix_adv_type        = "aggregate-auto"
  prefix_adv_type_to_lan = "default"
  peer_auth_type         = "none" # one of: md5, none
}

#
# Reading element bgp config objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_element_bgp_config" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result

    bgp_config_id = length(data.prismasdwan_element_bgp_config.existing_bgp_config.items) == 0 ? "" : data.prismasdwan_element_bgp_config.existing_bgp_config.items[0].id
  }
  filters = {
    "id" = prismasdwan_element_bgp_config.single_bgp_config.id
  }
  depends_on = [prismasdwan_element_bgp_config.single_bgp_config]
}

# by prefix_adv_type
data "prismasdwan_element_bgp_config" "find_by_prefix_adv_type" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result

    bgp_config_id = length(data.prismasdwan_element_bgp_config.existing_bgp_config.items) == 0 ? "" : data.prismasdwan_element_bgp_config.existing_bgp_config.items[0].id
  }
  filters = {
    "prefix_adv_type" = prismasdwan_element_bgp_config.single_bgp_config.prefix_adv_type
  }
  depends_on = [prismasdwan_element_bgp_config.single_bgp_config]
}

# by prefix_adv_type_to_lan
data "prismasdwan_element_bgp_config" "find_by_prefix_adv_type_to_lan" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result

    bgp_config_id = length(data.prismasdwan_element_bgp_config.existing_bgp_config.items) == 0 ? "" : data.prismasdwan_element_bgp_config.existing_bgp_config.items[0].id
  }
  filters = {
    "prefix_adv_type_to_lan" = prismasdwan_element_bgp_config.single_bgp_config.prefix_adv_type_to_lan
  }
  depends_on = [prismasdwan_element_bgp_config.single_bgp_config]
}

output "element_bgp_config_found" {
  value     = [for o in coalesce(data.prismasdwan_element_bgp_config.find_by_id.items, []) : o.id]
  sensitive = true
}
