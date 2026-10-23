# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_wan_network: Manages a Prisma SD-WAN Wan Network.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - provider_as_numbers applies to private WAN networks only. The API accepts it on a public network at create
#     time but rejects it on every later update (EXTRA_PROVIDER_ASNUM).
#
# Tested end to end by the provider suite: resources/wan_network/example, data_sources/wan_network/filters.
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

resource "prismasdwan_wan_network" "test_private_wan_network_1" {
  name                = "example_network"
  description         = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                = ["example", "network"]
  type                = "privatewan" # one of: publicwan, privatewan
  provider_as_numbers = [6575]
}

resource "prismasdwan_wan_network" "test_public_wan_network_1" {
  name        = "example_network"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["example", "network"]
  type        = "publicwan" # one of: publicwan, privatewan
}

#
# Reading wan network objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_wan_network" "find_by_name" {
  filters = {
    "name" = prismasdwan_wan_network.test_private_wan_network_1.name
  }
  depends_on = [prismasdwan_wan_network.test_private_wan_network_1]
}

# by id
data "prismasdwan_wan_network" "find_by_id" {
  filters = {
    "id" = prismasdwan_wan_network.test_private_wan_network_1.id
  }
  depends_on = [prismasdwan_wan_network.test_private_wan_network_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_wan_network" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_wan_network.test_private_wan_network_1]
}

output "wan_network_found" {
  value = [for o in coalesce(data.prismasdwan_wan_network.find_by_name.items, []) : o.id]
}
