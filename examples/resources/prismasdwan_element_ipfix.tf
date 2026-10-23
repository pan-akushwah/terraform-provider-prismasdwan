# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ipfix"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# The element to configure. "element_shell_site" and "manual_device_shell" are example names; use your own.
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
