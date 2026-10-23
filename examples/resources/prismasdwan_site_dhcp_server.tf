# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_dhcp_server: Manages a Prisma SD-WAN Site Dhcp Server.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - vrf_context_id must be in the site's VRF profile; a new site only has Global.
#
# Tested end to end by the provider suite: resources/site_dhcp_server/example,
# data_sources/site_dhcp_server/filters.
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

resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

resource "prismasdwan_site" "site_1" {
  name                 = "tf site 1 for example"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "SPOKE"
  address = {
    city    = "San Jose"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.8863
    latitude  = 37.3382
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

resource "prismasdwan_site_dhcp_server" "site_dhcp_server_1" {
  # This is needed for path parameters
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  disabled          = false
  description       = "Managed by Prisma SDWAN Terraform IaaC Provider"
  subnet            = "10.10.10.0/24"
  gateway           = "10.10.10.253"
  broadcast_address = "10.10.10.255"
  domain_name       = "example.com"
  dns_servers = [
    "10.10.10.2",
    "10.10.10.3",
    "10.10.10.4"
  ]
  default_lease_time = 43200
  max_lease_time     = 86400
  ip_ranges = [
    {
      start_ip = "10.10.10.1"
      end_ip   = "10.10.10.128"
    }
  ]
  static_mappings = [
    {
      name       = "example_device"
      mac        = "DB:F9:AF:1B:0D:3E"
      ip_address = "10.10.10.32"
    }
  ]
  address_family = "ipv4"                                                 # one of: ipv4, ipv6
  vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result # must be in the site's VRF profile
}

#
# Reading site dhcp server objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by id
data "prismasdwan_site_dhcp_server" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "id" = prismasdwan_site_dhcp_server.site_dhcp_server_1.id
  }
  depends_on = [prismasdwan_site_dhcp_server.site_dhcp_server_1]
}

# by a reference: every object with this vrf_context_id
data "prismasdwan_site_dhcp_server" "find_by_vrf_context_id" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "vrf_context_id" = prismasdwan_site_dhcp_server.site_dhcp_server_1.vrf_context_id
  }
  depends_on = [prismasdwan_site_dhcp_server.site_dhcp_server_1]
}

# by broadcast_address
data "prismasdwan_site_dhcp_server" "find_by_broadcast_address" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "broadcast_address" = prismasdwan_site_dhcp_server.site_dhcp_server_1.broadcast_address
  }
  depends_on = [prismasdwan_site_dhcp_server.site_dhcp_server_1]
}

# by a value in the dns_servers list (gjson query: <list>.#(=="value"))
data "prismasdwan_site_dhcp_server" "find_by_dns_servers_member" {
  x_parameters = {
    site_id = prismasdwan_site.site_1.id
  }
  filters = {
    "dns_servers.#(==\"10.10.10.2\")" = "10.10.10.2"
  }
  depends_on = [prismasdwan_site_dhcp_server.site_dhcp_server_1]
}

output "site_dhcp_server_found" {
  value = [for o in coalesce(data.prismasdwan_site_dhcp_server.find_by_id.items, []) : o.id]
}
