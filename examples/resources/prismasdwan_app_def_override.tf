# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_app_def_override: Manages a Prisma SD-WAN App Def Override.
#
# Required x_parameters (the parent's ids; the plan fails without them): appdef_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/app_def_override/example,
# data_sources/app_def_override/filters.
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
  path_affinity                = "strict" # one of: none, weak, strict
  p_category                   = "saas"   # one of: business-systems, collaboration, general-internet, media, networking, saas
}

#
# Reading app def override objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_app_def_override" "find_by_id" {
  x_parameters = {
    appdef_id = data.prismasdwan_app_def.app_def.items[0].id
  }
  filters = {
    "id" = prismasdwan_app_def_override.app_def_changes.id
  }
  depends_on = [prismasdwan_app_def_override.app_def_changes]
}

output "app_def_override_found" {
  value = [for o in coalesce(data.prismasdwan_app_def_override.find_by_id.items, []) : o.id]
}
