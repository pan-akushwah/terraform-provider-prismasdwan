# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_bgp_peer: Manages a Prisma SD-WAN Element Bgp Peer.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - x_parameters with site_id and element_id is required; the plan fails without it.
#
# Tested end to end by the provider suite: resources/element_bgp_peer/example,
# data_sources/element_bgp_peer/filters.
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

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

resource "prismasdwan_element_bgp_peer" "bgp_peer" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  advertise_default_route = false
  allow_v4_prefixes       = true
  allow_v6_prefixes       = false
  bgp_config = {
    adv_interval                 = 1
    hold_time                    = 45
    keepalive_time               = 15
    local_as_num                 = "350"
    md5_secret                   = null # sensitive
    md5_secret_internal_key_name = null
    multi_hop_limit              = 1
    peer_auth_type               = "none"
    peer_retry_time              = 120
  }
  description       = "Managed by Prisma SDWAN Terraform IaaC Provider"
  name              = "AUTO-PRISMA_IPSEC-Tunnel_us-southeast_2"
  peer_ip           = "172.16.0.111"
  peer_ip_v6        = null
  peer_type         = "classic"
  remote_as_num     = "65534"
  route_aggregation = null
  route_map_in_id   = null
  route_map_out_id  = null
  router_id         = null
  scope             = "global" # one of: GLOBAL, LOCAL
  shutdown          = false
  tags              = ["AUTO-PRISMA_MANAGED"]
  update_source     = "172.16.0.110"
  update_source_v6  = null
  vrf_context_id    = prismasdwan_resource_locator.global_vrf_context.result
}

#
# Reading element bgp peer objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_bgp_peer" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_bgp_peer.bgp_peer.name
  }
  depends_on = [prismasdwan_element_bgp_peer.bgp_peer]
}

# by id
data "prismasdwan_element_bgp_peer" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_bgp_peer.bgp_peer.id
  }
  depends_on = [prismasdwan_element_bgp_peer.bgp_peer]
}

# by a reference: every object with this vrf_context_id
data "prismasdwan_element_bgp_peer" "find_by_vrf_context_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "vrf_context_id" = prismasdwan_element_bgp_peer.bgp_peer.vrf_context_id
  }
  depends_on = [prismasdwan_element_bgp_peer.bgp_peer]
}

# by peer_ip
data "prismasdwan_element_bgp_peer" "find_by_peer_ip" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "peer_ip" = prismasdwan_element_bgp_peer.bgp_peer.peer_ip
  }
  depends_on = [prismasdwan_element_bgp_peer.bgp_peer]
}

# by peer_type
data "prismasdwan_element_bgp_peer" "find_by_peer_type" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "peer_type" = prismasdwan_element_bgp_peer.bgp_peer.peer_type
  }
  depends_on = [prismasdwan_element_bgp_peer.bgp_peer]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_element_bgp_peer" "find_by_tags_member" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "tags.#(==\"AUTO-PRISMA_MANAGED\")" = "AUTO-PRISMA_MANAGED"
  }
  depends_on = [prismasdwan_element_bgp_peer.bgp_peer]
}

output "element_bgp_peer_found" {
  value     = [for o in coalesce(data.prismasdwan_element_bgp_peer.find_by_name.items, []) : o.id]
  sensitive = true
}
