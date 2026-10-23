# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_tacacs_plus_profile: Manages a Prisma SD-WAN Tacacs Plus Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Names may not contain hyphens; use underscores.
#
# Tested end to end by the provider suite: resources/tacacs_plus_profile/example,
# data_sources/tacacs_plus_profile/filters.
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

resource "prismasdwan_tacacs_plus_profile" "example_tacacs_profile_1" {
  name                    = "example_tacacs_profile_1"
  description             = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                    = ["lorem", "ipsum"]
  authentication_protocol = "chap" # one of: chap, pap
  tacacs_plus_servers = [
    {
      server_ip   = "10.11.12.14"
      server_port = 51
      secret      = base64encode("abcd1234")
      timeout     = 6
    }
  ]
}

resource "prismasdwan_tacacs_plus_profile" "example_tacacs_profile_2" {
  name                    = "example_tacacs_profile_2"
  description             = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                    = ["lorem", "ipsum"]
  authentication_protocol = "pap" # one of: chap, pap
  tacacs_plus_servers = [
    {
      server_fqdn = "google.com"
      server_port = 50
      secret      = base64encode("abcd1234")
      timeout     = 2
    }
  ]
}

#
# Reading tacacs plus profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_tacacs_plus_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_tacacs_plus_profile.example_tacacs_profile_1.name
  }
  depends_on = [prismasdwan_tacacs_plus_profile.example_tacacs_profile_1]
}

# by id
data "prismasdwan_tacacs_plus_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_tacacs_plus_profile.example_tacacs_profile_1.id
  }
  depends_on = [prismasdwan_tacacs_plus_profile.example_tacacs_profile_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_tacacs_plus_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"lorem\")" = "lorem"
  }
  depends_on = [prismasdwan_tacacs_plus_profile.example_tacacs_profile_1]
}

output "tacacs_plus_profile_found" {
  value     = [for o in coalesce(data.prismasdwan_tacacs_plus_profile.find_by_name.items, []) : o.id]
  sensitive = true
}
