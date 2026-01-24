# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "app_def"
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

resource "prismasdwan_app_def" "example" {
  display_name                 = "tf_managed_app"
  path_affinity                = "weak"
  ingress_traffic_pct          = 50
  conn_idle_timeout            = 0
  transfer_type                = "transactional"
  app_type                     = "system"
  session_timeout              = 0
  order_number                 = 32768
  overrides_allowed            = false
  system_app_overridden        = false
  is_deprecated                = false
  app_unreachability_detection = true
  # look under docs/resources to check available values 
  p_category = "general-internet"
  # look under docs/resources to check available values 
  p_sub_category = "file-sharing"
  # look under docs/resources to check available values 
  supported_engines               = "panos-ml7"
  p_parent_id                     = ""
  supported_base_software_version = "6.4.1"
}
