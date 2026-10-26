# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site_wan_interface: Manages a Prisma SD-WAN Site Wan Interface.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - type must match the WAN network's type (publicwan or privatewan).
#   - Circuit labels (public-1, private-1, ...) are built in: look them up by label.
#   - The API defaults cost to 128 and bfd_mode to aggressive when they are not set.
#
# Tested end to end by the provider suite: resources/site_wan_interface/example,
# data_sources/site_wan_interface/filters.
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

resource "prismasdwan_site" "branch" {
  name                 = "example_wan_site"
  description          = "Managed by Terraform"
  admin_state          = "disabled"
  element_cluster_role = "SPOKE"
  address = {
    city    = "Santa Clara"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.9552
    latitude  = 37.3541
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

# WAN networks describe the transport (the internet provider, the MPLS provider)
resource "prismasdwan_wan_network" "internet" {
  name        = "example_internet"
  description = "Broadband internet"
  type        = "publicwan"
}

resource "prismasdwan_wan_network" "mpls" {
  name                = "example_mpls"
  description         = "MPLS provider"
  type                = "privatewan"
  provider_as_numbers = [65010] # private WAN networks only
}

# Circuit labels are built in: public-1 ... public-n and private-1 ... private-n
resource "prismasdwan_resource_locator" "public_1" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "public-1"
}

resource "prismasdwan_resource_locator" "private_1" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "private-1"
}

# The site's circuits
resource "prismasdwan_site_wan_interface" "internet" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  name           = "example_internet_circuit"
  description    = "100/20 Mbps broadband"
  type           = "publicwan" # must match the WAN network's type
  network_id     = prismasdwan_wan_network.internet.id
  label_id       = prismasdwan_resource_locator.public_1.result
  bw_config_mode = "manual" # manual: use link_bw_down/up as entered
  link_bw_down   = 100      # Mbps
  link_bw_up     = 20       # Mbps
}

resource "prismasdwan_site_wan_interface" "mpls" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  name           = "example_mpls_circuit"
  description    = "50 Mbps MPLS"
  type           = "privatewan" # one of: PUBLIC_WAN, PRIVATE_WAN
  network_id     = prismasdwan_wan_network.mpls.id
  label_id       = prismasdwan_resource_locator.private_1.result
  bw_config_mode = "manual" # one of: auto, manual, manual_bwm_disabled
  link_bw_down   = 50
  link_bw_up     = 50
  lqm_enabled    = true # link quality monitoring
}

#
# Reading circuits back with the data source (circuits are listed per site)
#
data "prismasdwan_site_wan_interface" "find_public" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  filters = {
    type = "publicwan"
  }
  depends_on = [prismasdwan_site_wan_interface.internet, prismasdwan_site_wan_interface.mpls]
}

data "prismasdwan_site_wan_interface" "find_on_mpls_network" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  filters = {
    network_id = prismasdwan_wan_network.mpls.id # a reference id
  }
  depends_on = [prismasdwan_site_wan_interface.mpls]
}

output "site_circuits" {
  value = {
    public = [for c in coalesce(data.prismasdwan_site_wan_interface.find_public.items, []) : c.name]
    mpls   = [for c in coalesce(data.prismasdwan_site_wan_interface.find_on_mpls_network.items, []) : c.name]
  }
}
