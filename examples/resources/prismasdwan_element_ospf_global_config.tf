# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_ospf_global_config: Manages a Prisma SD-WAN Element Ospf Global Config.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id, ospf_config_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Every element has exactly one OSPF global configuration; read its id with the data source. Destroying does not
#     restore previous values.
#
# Tested end to end by the provider suite: resources/element_ospf_global_config/example,
# data_sources/element_ospf_global_config/filters.
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
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

#
# Every element has exactly one OSPF global configuration. Look it up and manage it.
#
data "prismasdwan_element_ospf_global_config" "existing" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_element_ospf_global_config" "tf_element_ospf_global_config" {
  x_parameters = {
    site_id        = prismasdwan_resource_locator.element_site.result
    element_id     = prismasdwan_resource_locator.element_shell.result
    ospf_config_id = data.prismasdwan_element_ospf_global_config.existing.items[0].id
  }
  cost                   = 100
  dead_interval          = 40
  hello_interval         = 10
  md5_key_id             = 12
  md5_secret             = base64encode("garbage_pwd")
  prefix_adv_type_to_lan = "unaggregated"
  retransmit_interval    = 5
  router_id              = ""
  transmit_delay         = 1
}

#
# Reading element ospf global config objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_element_ospf_global_config" "find_by_id" {
  x_parameters = {
    site_id        = prismasdwan_resource_locator.element_site.result
    element_id     = prismasdwan_resource_locator.element_shell.result
    ospf_config_id = data.prismasdwan_element_ospf_global_config.existing.items[0].id
  }
  filters = {
    "id" = prismasdwan_element_ospf_global_config.tf_element_ospf_global_config.id
  }
  depends_on = [prismasdwan_element_ospf_global_config.tf_element_ospf_global_config]
}

# by prefix_adv_type_to_lan
data "prismasdwan_element_ospf_global_config" "find_by_prefix_adv_type_to_lan" {
  x_parameters = {
    site_id        = prismasdwan_resource_locator.element_site.result
    element_id     = prismasdwan_resource_locator.element_shell.result
    ospf_config_id = data.prismasdwan_element_ospf_global_config.existing.items[0].id
  }
  filters = {
    "prefix_adv_type_to_lan" = prismasdwan_element_ospf_global_config.tf_element_ospf_global_config.prefix_adv_type_to_lan
  }
  depends_on = [prismasdwan_element_ospf_global_config.tf_element_ospf_global_config]
}

output "element_ospf_global_config_found" {
  value     = [for o in coalesce(data.prismasdwan_element_ospf_global_config.find_by_id.items, []) : o.id]
  sensitive = true
}
