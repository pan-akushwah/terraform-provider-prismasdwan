# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "app_def_override"
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
# find an existing application definition
# you can use resource_locator as well
data "prismasdwan_app_def" "app_def" {
  filters = {
    display_name = "104apci-supervisory"
  }
}

resource "prismasdwan_app_def_override" "app_def_changes" {
  x_parameters = {
    appdef_id = data.prismasdwan_app_def.app_def.items[0].id
  }
  app_unreachability_detection = true
  override_default_ip_rules    = false
  override_default_tcp_rules   = false
  override_default_udp_rules   = false
  override_domains             = false
  overrides_disable            = false
  path_affinity                = "strict"
  p_category                   = "saas"
}
