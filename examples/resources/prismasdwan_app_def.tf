# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_app_def: Manages a Prisma SD-WAN App Def.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/app_def/example, data_sources/app_def/filters.
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

resource "prismasdwan_app_def" "test_app_003" {
  display_name                 = "Test_App_003"
  abbreviation                 = "tap03"
  domains                      = ["acme-domain-003.com"]
  path_affinity                = "none" # one of: none, weak, strict
  ingress_traffic_pct          = 50
  conn_idle_timeout            = 3600
  transfer_type                = "bulk"   # one of: transactional, bulk, rt-audio, rt-video
  app_type                     = "custom" # one of: custom
  session_timeout              = 0
  order_number                 = 1
  app_unreachability_detection = true
  network_scan_application     = true
  p_category                   = "collaboration" # one of: business-systems, collaboration, general-internet, media, networking, saas
}

#
# existing filter with a given name
data "prismasdwan_global_prefix_filter" "existing_filter" {
  filters = {
    name = "TestAppPrefixFilter"
  }
}

output "existing_filters" {
  value = length(data.prismasdwan_global_prefix_filter.existing_filter.items)
}

resource "prismasdwan_app_def" "test_app_002" {
  display_name                 = "Test_App_002"
  abbreviation                 = "tap02"
  path_affinity                = "strict" # one of: none, weak, strict
  ingress_traffic_pct          = 50
  conn_idle_timeout            = 3600
  transfer_type                = "transactional" # one of: transactional, bulk, rt-audio, rt-video
  app_type                     = "custom"        # one of: custom
  session_timeout              = 0
  order_number                 = 1
  app_unreachability_detection = true
  network_scan_application     = true
  p_category                   = "business-systems" # one of: business-systems, collaboration, general-internet, media, networking, saas

  tcp_rules = [
    {
      server_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      client_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      server_port = {
        start = "2500"
        end   = "2520"
      }
      client_port = {
        start = "2500"
        end   = "2501"
      }
    }
  ]
  udp_rules = [
    {
      udp_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      udp_port = {
        start = "2600"
        end   = "2620"
      }
    }
  ]

  ip_rules = [
    {
      protocol = "icmp"
      dest_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      src_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      dscp = {
        value = 0
      }
    },
    {
      protocol = "igmp"
      dest_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      src_filters = [
        data.prismasdwan_global_prefix_filter.existing_filter.items[0].id
      ]
      dscp = {
        value = 0
      }
    }
  ]
}

#
# Reading app def objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_app_def" "find_by_id" {
  filters = {
    "id" = prismasdwan_app_def.test_app_003.id
  }
  depends_on = [prismasdwan_app_def.test_app_003]
}

# by a value in the domains list (gjson query: <list>.#(=="value"))
data "prismasdwan_app_def" "find_by_domains_member" {
  filters = {
    "domains.#(==\"acme-domain-003.com\")" = "acme-domain-003.com"
  }
  depends_on = [prismasdwan_app_def.test_app_003]
}

output "app_def_found" {
  value = [for o in coalesce(data.prismasdwan_app_def.find_by_id.items, []) : o.id]
}
