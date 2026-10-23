# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_service_endpoint: Manages a Prisma SD-WAN Service Endpoint.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/service_endpoint/example,
# data_sources/service_endpoint/filters.
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

resource "prismasdwan_service_endpoint" "service_endpoint_1" {
  name        = "tf managed service endpoint 1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  type        = "non-cg-transit" # one of: cg-transit, non-cg-transit, sase
  # site_id = null
  admin_up = true
  service_link_peers = {
    ip_addresses = [
      "10.10.10.1"
    ],
    hostnames = [
      "something.com"
    ]
  }
  allow_enterprise_traffic = true
  liveliness_probe = {
    icmp_ping = [
      {
        ip_addresses = [
          "10.0.0.1"
        ],
        interval      = "10",
        failure_count = 3
      }
    ],
    #http                              = []
    use_tunnel_for_url_dns_resolution = false
  }
  sase_properties = {
    lqm_enabled = true
  }
  is_sase = true
  address = {
    city      = "Bengaluru"
    country   = "India"
    post_code = "560067"
    state     = "Karnataka"
    street    = null
    street2   = null
  }
  location = {
    longitude   = 80.24
    latitude    = 16.5
    description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  }
  disable_tunnel_reoptimization = true
}

resource "prismasdwan_service_endpoint" "service_endpoint_2" {
  name        = "tf managed service endpoint 2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  type        = "non-cg-transit" # one of: cg-transit, non-cg-transit, sase
  # site_id = null
  admin_up = true
  service_link_peers = {
    ip_addresses = [
      "10.10.10.1"
    ],
    hostnames = [
      "something.com"
    ]
  }
  allow_enterprise_traffic = true
  liveliness_probe = {
    http = [
      {
        url               = "http://httpbin.com"
        http_status_codes = [400]
        interval          = 10
        failure_count     = 3
      }
    ]
    use_tunnel_for_url_dns_resolution = false
  }
  sase_properties = {
    lqm_enabled = true
  }
  is_sase = true
  address = {
    city      = "Bengaluru"
    country   = "India"
    post_code = "560067"
    state     = "Karnataka"
    street    = null
    street2   = null
  }
  location = {
    longitude   = 79.5
    latitude    = 14.5
    description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  }
  disable_tunnel_reoptimization = true
}

#
# Reading service endpoint objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_service_endpoint" "find_by_name" {
  filters = {
    "name" = prismasdwan_service_endpoint.service_endpoint_1.name
  }
  depends_on = [prismasdwan_service_endpoint.service_endpoint_1]
}

# by id
data "prismasdwan_service_endpoint" "find_by_id" {
  filters = {
    "id" = prismasdwan_service_endpoint.service_endpoint_1.id
  }
  depends_on = [prismasdwan_service_endpoint.service_endpoint_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_service_endpoint" "find_by_tags_member" {
  filters = {
    "tags.#(==\"lorem\")" = "lorem"
  }
  depends_on = [prismasdwan_service_endpoint.service_endpoint_1]
}

output "service_endpoint_found" {
  value = [for o in coalesce(data.prismasdwan_service_endpoint.find_by_name.items, []) : o.id]
}
