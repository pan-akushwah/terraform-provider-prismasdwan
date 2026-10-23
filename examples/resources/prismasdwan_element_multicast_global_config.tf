# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_multicast_global_config"
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

#
# Every element has exactly one multicast global configuration. Look it up and manage it.
#
data "prismasdwan_element_multicast_global_config" "existing" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_element_multicast_global_config" "example" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
    config_id  = data.prismasdwan_element_multicast_global_config.existing.items[0].id
  }
  dr_priority            = 10
  bsm_enabled            = true
  spt_switchover_enabled = true
  igmp_protocol_parameters = {
    query_interval             = 125
    query_max_response_time    = 10
    last_member_query_count    = 2
    last_member_query_interval = 1
  }
  pim_protocol_parameters = {
    hello_interval      = 30
    hello_hold_time     = 105
    join_prune_interval = 60
  }
}
