# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_tacacs_plus_server: Manages a Prisma SD-WAN Element Tacacs Plus Server.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_tacacs_plus_server/example,
# data_sources/element_tacacs_plus_server/filters.
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

resource "prismasdwan_element_tacacs_plus_server" "tacacs_plus_server" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  tacacs_plus_servers = [
    {
      server_ip   = null,
      server_port = "49"
      secret      = "some_secret"
      timeout     = "10"
      server_fqdn = "acme.com"
      server_ipv6 = null
    }
  ]
  tacacs_plus_profile_id = prismasdwan_tacacs_plus_profile.example_tacacs_profile_1.id # from the prismasdwan_tacacs_plus_profile example
  source_interface_id    = prismasdwan_resource_locator.element_port_2_id.result
  name                   = "Tf Managed Tacacs Server"
  description            = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = [
    "terraform", "example"
  ]
  authentication_protocol = "pap" # one of: chap, pap
  enabled                 = true
}

#
# Reading element tacacs plus server objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_tacacs_plus_server" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_tacacs_plus_server.tacacs_plus_server.name
  }
  depends_on = [prismasdwan_element_tacacs_plus_server.tacacs_plus_server]
}

# by id
data "prismasdwan_element_tacacs_plus_server" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_tacacs_plus_server.tacacs_plus_server.id
  }
  depends_on = [prismasdwan_element_tacacs_plus_server.tacacs_plus_server]
}

# by a reference: every object with this tacacs_plus_profile_id
data "prismasdwan_element_tacacs_plus_server" "find_by_tacacs_plus_profile_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "tacacs_plus_profile_id" = prismasdwan_element_tacacs_plus_server.tacacs_plus_server.tacacs_plus_profile_id
  }
  depends_on = [prismasdwan_element_tacacs_plus_server.tacacs_plus_server]
}

# by a reference: every object with this source_interface_id
data "prismasdwan_element_tacacs_plus_server" "find_by_source_interface_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "source_interface_id" = prismasdwan_element_tacacs_plus_server.tacacs_plus_server.source_interface_id
  }
  depends_on = [prismasdwan_element_tacacs_plus_server.tacacs_plus_server]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_element_tacacs_plus_server" "find_by_tags_member" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_element_tacacs_plus_server.tacacs_plus_server]
}

output "element_tacacs_plus_server_found" {
  value     = [for o in coalesce(data.prismasdwan_element_tacacs_plus_server.find_by_name.items, []) : o.id]
  sensitive = true
}
