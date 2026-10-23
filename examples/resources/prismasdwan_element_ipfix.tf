# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_ipfix: Manages a Prisma SD-WAN Element Ipfix.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_ipfix/example, data_sources/element_ipfix/filters.
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

resource "prismasdwan_element_ipfix" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name             = "TestProfile"
  ipfixtemplate_id = prismasdwan_ipfix_template.example_ipfix_template.id
  ipfixprofile_id  = prismasdwan_ipfix_profile.example_ipfix_profile.id

  collector_config = [{
    protocol                 = "udp"
    ipfixcollectorcontext_id = prismasdwan_ipfix_collector_context.example_collector_context.id
    host                     = "10.11.12.13"
    host_port                = 1011
    max_message_size         = 1372
  }]

  filters = [{
    dst_prefixes_id = prismasdwan_ipfix_global_prefix.example_ipfix_global.id
    src_prefixes_id = prismasdwan_ipfix_global_prefix.example_ipfix_global.id
    dst_ports = [{
      start = 130
      end   = 131
    }]
    src_ports = [{
      start = 120
      end   = 121
    }]
    protocols = ["tcp", "udp"]
  }]
}

#
# Reading element ipfix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_ipfix" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_ipfix.example.name
  }
  depends_on = [prismasdwan_element_ipfix.example]
}

# by id
data "prismasdwan_element_ipfix" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_ipfix.example.id
  }
  depends_on = [prismasdwan_element_ipfix.example]
}

# by a reference: every object with this ipfixtemplate_id
data "prismasdwan_element_ipfix" "find_by_ipfixtemplate_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "ipfixtemplate_id" = prismasdwan_element_ipfix.example.ipfixtemplate_id
  }
  depends_on = [prismasdwan_element_ipfix.example]
}

# by a reference: every object with this ipfixprofile_id
data "prismasdwan_element_ipfix" "find_by_ipfixprofile_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "ipfixprofile_id" = prismasdwan_element_ipfix.example.ipfixprofile_id
  }
  depends_on = [prismasdwan_element_ipfix.example]
}

output "element_ipfix_found" {
  value = [for o in coalesce(data.prismasdwan_element_ipfix.find_by_name.items, []) : o.id]
}
