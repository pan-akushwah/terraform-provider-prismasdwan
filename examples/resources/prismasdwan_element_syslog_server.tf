# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_syslog_server: Manages a Prisma SD-WAN Element Syslog Server.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_syslog_server/example,
# data_sources/element_syslog_server/filters.
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

resource "prismasdwan_element_syslog_server" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name                  = "tf example syslog server"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled               = true
  server_ip             = "10.1.1.20"
  server_port           = 514
  protocol              = "udp"
  severity_level        = "major"
  enable_flow_logging   = false
  enable_threat_logging = false
  enable_url_logging    = false
  enable_dns_logging    = false
}

#
# Reading element syslog server objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_syslog_server" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_syslog_server.example.name
  }
  depends_on = [prismasdwan_element_syslog_server.example]
}

# by id
data "prismasdwan_element_syslog_server" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_syslog_server.example.id
  }
  depends_on = [prismasdwan_element_syslog_server.example]
}

# by server_ip
data "prismasdwan_element_syslog_server" "find_by_server_ip" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "server_ip" = prismasdwan_element_syslog_server.example.server_ip
  }
  depends_on = [prismasdwan_element_syslog_server.example]
}

output "element_syslog_server_found" {
  value = [for o in coalesce(data.prismasdwan_element_syslog_server.find_by_name.items, []) : o.id]
}
