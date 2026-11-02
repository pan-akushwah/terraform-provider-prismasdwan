# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_iot_device_id_config: Manages a Prisma SD-WAN Site Iot Device Id Config.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Every site already has exactly one device-id configuration, created with the site. This resource adopts it
#     (there is no create or delete): only x_parameters.site_id is needed.
#   - site_id is filled in from x_parameters and kept in state; the API never returns it.
#
# Tested end to end by the provider suite: resources/site_iot_device_id_config/example,
# resources/site_iot_device_id_config/regression_a5, data_sources/site_iot_device_id_config/filters.
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

resource "prismasdwan_site" "branch_site" {
  name                 = "tf iot device id branch site"
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


resource "prismasdwan_site_iot_device_id_config" "example" {
  # every site already has one device-id configuration; this manages it (there is no create or delete)
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  cfg_device_id_enabled = true
}

#
# Reading site iot device id config objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_iot_device_id_config" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  filters = {
    "id" = prismasdwan_site_iot_device_id_config.example.id
  }
  depends_on = [prismasdwan_site_iot_device_id_config.example]
}

output "site_iot_device_id_config_found" {
  value = [for o in coalesce(data.prismasdwan_site_iot_device_id_config.find_by_id.items, []) : o.id]
}
