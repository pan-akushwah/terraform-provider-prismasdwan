# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_vrf_context_profile: Manages a Prisma SD-WAN Vrf Context Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/vrf_context_profile/example,
# data_sources/vrf_context_profile/filters.
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

# A second VRF to leak routes from
resource "prismasdwan_vrf_context" "test_vrf_context_2" {
  name        = "example_vrf_context_2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
}

resource "prismasdwan_vrf_context_profile" "test_vrf_context_profile_1" {
  name                        = "example vrf context profile"
  description                 = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                        = ["tag1", "tag2"]
  default_vrf_context_profile = false
  vrf_context_ids = [
    prismasdwan_resource_locator.global_vrf_context.result,
    prismasdwan_vrf_context.test_vrf_context_1.id,
    prismasdwan_vrf_context.test_vrf_context_2.id
  ]
  vrf_context_route_leak_rules = [
    {
      name                = "rule001"
      description         = "Managed by Prisma SDWAN Terraform IaaC Provider"
      src_vrf_context_id  = prismasdwan_vrf_context.test_vrf_context_2.id
      dest_vrf_context_id = prismasdwan_vrf_context.test_vrf_context_1.id
      ipv4_prefixes = [
        "10.10.10.0/24"
      ]
    }
  ]
}

#
# Reading vrf context profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_vrf_context_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_vrf_context_profile.test_vrf_context_profile_1.name
  }
  depends_on = [prismasdwan_vrf_context_profile.test_vrf_context_profile_1]
}

# by id
data "prismasdwan_vrf_context_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_vrf_context_profile.test_vrf_context_profile_1.id
  }
  depends_on = [prismasdwan_vrf_context_profile.test_vrf_context_profile_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_vrf_context_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"tag1\")" = "tag1"
  }
  depends_on = [prismasdwan_vrf_context_profile.test_vrf_context_profile_1]
}

output "vrf_context_profile_found" {
  value = [for o in coalesce(data.prismasdwan_vrf_context_profile.find_by_name.items, []) : o.id]
}
