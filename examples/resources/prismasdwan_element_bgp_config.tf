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
data "prismasdwan_site" "site_blr" {
  filters = {
    name = "Bangalore"
  }
}

#
# find the element you want to work on
# alternatively, you can use `resource_locator`
data "prismasdwan_element" "device_blr" {
  filters = {
    site_id = data.prismasdwan_site.site_blr.items[0].id
  }
}

#
# read all bgp configs which exists already on element
data "prismasdwan_element_bgp_config" "existing_bgp_config" {
  x_parameters = {
    site_id    = data.prismasdwan_site.site_blr.items[0].id
    element_id = data.prismasdwan_element.device_blr.items[0].id
  }
  filters = {
    // read all elements
  }
}

#
# create the bgp config, if does not exist
resource "prismasdwan_element_bgp_config" "single_bgp_config" {

  x_parameters = {
    site_id    = data.prismasdwan_site.all_sites.items[0].id
    element_id = data.prismasdwan_element.device_blr.items[0].id
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
