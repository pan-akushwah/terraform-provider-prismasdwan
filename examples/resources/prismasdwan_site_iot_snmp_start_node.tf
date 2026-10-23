# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_iot_snmp_start_node: Manages a Prisma SD-WAN Site Iot Snmp Start Node.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, deviceid_config_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/site_iot_snmp_start_node/example,
# data_sources/site_iot_snmp_start_node/filters.
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
  name                 = "tf iot snmp start node branch site"
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

# Every site has exactly one device-id configuration
data "prismasdwan_site_iot_device_id_config" "existing" {
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_site_iot_snmp_start_node" "example" {
  x_parameters = {
    site_id            = prismasdwan_site.branch_site.id
    deviceid_config_id = data.prismasdwan_site_iot_device_id_config.existing.items[0].id
  }
  name         = "tf example snmp start node"
  description  = "Managed by Prisma SDWAN Terraform IaaC Provider"
  ipv4_address = "10.30.0.1"
  scope = [
    {
      ipv4_prefix = "10.30.0.0/24"
    }
  ]
}

#
# Reading site iot snmp start node objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_site_iot_snmp_start_node" "find_by_name" {
  x_parameters = {
    site_id            = prismasdwan_site.branch_site.id
    deviceid_config_id = data.prismasdwan_site_iot_device_id_config.existing.items[0].id
  }
  filters = {
    "name" = prismasdwan_site_iot_snmp_start_node.example.name
  }
  depends_on = [prismasdwan_site_iot_snmp_start_node.example]
}

# by id
data "prismasdwan_site_iot_snmp_start_node" "find_by_id" {
  x_parameters = {
    site_id            = prismasdwan_site.branch_site.id
    deviceid_config_id = data.prismasdwan_site_iot_device_id_config.existing.items[0].id
  }
  filters = {
    "id" = prismasdwan_site_iot_snmp_start_node.example.id
  }
  depends_on = [prismasdwan_site_iot_snmp_start_node.example]
}

# by ipv4_address
data "prismasdwan_site_iot_snmp_start_node" "find_by_ipv4_address" {
  x_parameters = {
    site_id            = prismasdwan_site.branch_site.id
    deviceid_config_id = data.prismasdwan_site_iot_device_id_config.existing.items[0].id
  }
  filters = {
    "ipv4_address" = prismasdwan_site_iot_snmp_start_node.example.ipv4_address
  }
  depends_on = [prismasdwan_site_iot_snmp_start_node.example]
}

output "site_iot_snmp_start_node_found" {
  value = [for o in coalesce(data.prismasdwan_site_iot_snmp_start_node.find_by_name.items, []) : o.id]
}
