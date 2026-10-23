# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_iot_profile: Manages a Prisma SD-WAN Iot Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/iot_profile/example, data_sources/iot_profile/filters.
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

resource "prismasdwan_iot_profile" "iot_profile_1" {

  name                                     = "tf managed iot profile 1"
  description                              = "Managed by Prisma SDWAN Terraform IaaC Provider"
  snmp_discovery_enabled                   = true
  snmp_discovery_use_local_neighbours      = true
  snmp_discovery_network_refresh_frequency = 1440
  snmp_discovery_device_refresh_frequency  = 90
  snmp_version                             = "v3" # one of: v2, v3
  v3_config = {
    snmp_security_level   = "private",
    snmp_username         = "iot_user_name",
    snmp_auth_protocol    = "md5",
    snmp_auth_password    = base64encode("123456789"),
    snmp_privacy_password = base64encode("987654321"),
    snmp_privacy_protocol = "aes"
  }
}

#
# Reading iot profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_iot_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_iot_profile.iot_profile_1.name
  }
  depends_on = [prismasdwan_iot_profile.iot_profile_1]
}

# by id
data "prismasdwan_iot_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_iot_profile.iot_profile_1.id
  }
  depends_on = [prismasdwan_iot_profile.iot_profile_1]
}

output "iot_profile_found" {
  value     = [for o in coalesce(data.prismasdwan_iot_profile.find_by_name.items, []) : o.id]
  sensitive = true
}
