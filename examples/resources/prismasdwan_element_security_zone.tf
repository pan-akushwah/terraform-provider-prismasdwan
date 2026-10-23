# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_security_zone: Manages a Prisma SD-WAN Element Security Zone.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_security_zone/example,
# data_sources/element_security_zone/filters.
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

resource "prismasdwan_resource_locator" "dnsservice_profile_id" {
  resource_type           = "prismasdwan_dns_service_profile"
  resource_property       = "name"
  resource_property_value = "Default DNSServiceProfile"
}

resource "prismasdwan_resource_locator" "element_port_1_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "1"
}

resource "prismasdwan_resource_locator" "element_port_2_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "2"
}

resource "prismasdwan_resource_locator" "element_port_3_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "3"
}

resource "prismasdwan_resource_locator" "vpn_wan_overlay_id" {
  resource_type           = "prismasdwan_wan_overlay"
  resource_property       = "name"
  resource_property_value = "VPN"
}

resource "prismasdwan_element_security_zone" "security_zone" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  interface_ids = [
    prismasdwan_resource_locator.element_port_3_id.result,
    prismasdwan_resource_locator.element_port_2_id.result
  ]
  wanoverlay_ids = [
    prismasdwan_resource_locator.vpn_wan_overlay_id.result
  ]
  zone_id = prismasdwan_security_zone.dmz_zone.id # from the prismasdwan_security_zone example
}

#
# Reading element security zone objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_element_security_zone" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_security_zone.security_zone.id
  }
  depends_on = [prismasdwan_element_security_zone.security_zone]
}

# by a reference: every object with this zone_id
data "prismasdwan_element_security_zone" "find_by_zone_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "zone_id" = prismasdwan_element_security_zone.security_zone.zone_id
  }
  depends_on = [prismasdwan_element_security_zone.security_zone]
}

output "element_security_zone_found" {
  value = [for o in coalesce(data.prismasdwan_element_security_zone.find_by_id.items, []) : o.id]
}
