# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_bgp_config"
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

#
# find the site you want to work on
# alternatively, you can use `resource_locator`
#
# read all bgp configs which exists already on element
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

data "prismasdwan_element_bgp_config" "existing_bgp_config" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    // read all elements
  }
}

#
# create the bgp config, if does not exist
resource "prismasdwan_element_bgp_config" "single_bgp_config" {

  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
    # set the bgp_config_id as empty string if there is no config available
    bgp_config_id = length(data.prismasdwan_element_bgp_config.existing_bgp_config.items) == 0 ? "" : data.prismasdwan_element_bgp_config.existing_bgp_config.items[0].id
  }
  local_as_num           = "350"
  keepalive_time         = 30
  hold_time              = 90
  adv_interval           = 1
  peer_retry_time        = 120
  multi_hop_limit        = 1
  maximum_paths          = 1
  admin_distance         = 20
  graceful_restart       = false
  stalepath_time         = 121
  prefix_adv_type        = "aggregate-auto"
  prefix_adv_type_to_lan = "default"
  peer_auth_type         = "none"
}
