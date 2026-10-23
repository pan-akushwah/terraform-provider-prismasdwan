# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_probe_profile: Manages a Prisma SD-WAN Probe Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/probe_profile/example, data_sources/probe_profile/filters.
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

resource "prismasdwan_probe_profile" "development_probe_profile" {
  # Required fields
  name             = "development profile"
  probe_config_ids = [prismasdwan_probe_config.dns_icmp.id] # from the prismasdwan_probe_config example
  description      = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags             = ["development"]
}

#
# Reading probe profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_probe_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_probe_profile.development_probe_profile.name
  }
  depends_on = [prismasdwan_probe_profile.development_probe_profile]
}

# by id
data "prismasdwan_probe_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_probe_profile.development_probe_profile.id
  }
  depends_on = [prismasdwan_probe_profile.development_probe_profile]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_probe_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"development\")" = "development"
  }
  depends_on = [prismasdwan_probe_profile.development_probe_profile]
}

output "probe_profile_found" {
  value = [for o in coalesce(data.prismasdwan_probe_profile.find_by_name.items, []) : o.id]
}
