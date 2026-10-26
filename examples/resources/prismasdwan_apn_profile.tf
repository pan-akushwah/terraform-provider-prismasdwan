# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_apn_profile: Manages a Prisma SD-WAN Apn Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The API never returns passwords; the provider keeps the configured value encrypted in private state.
#
# Tested end to end by the provider suite: resources/apn_profile/example, data_sources/apn_profile/filters.
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

resource "prismasdwan_apn_profile" "example_apn_profile_1" {
  name           = "example_apnprofile_1"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags           = ["terraform"]
  apn            = "example-tf"
  authentication = "pap_or_chap" # one of: none, pap, chap, pap_or_chap
  clear_password = true
  password       = null
  user_name      = "example"
}

resource "prismasdwan_apn_profile" "example_apn_profile_2" {
  name           = "example_apnprofile_2"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags           = ["terraform"]
  apn            = "example-tf"
  authentication = "pap_or_chap" # one of: none, pap, chap, pap_or_chap
  clear_password = false
  password       = "example"
  user_name      = "example"
}

resource "prismasdwan_apn_profile" "example_apn_profile_3" {
  name           = "example_apnprofile_3"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags           = ["terraform"]
  apn            = "example-tf"
  authentication = "pap" # one of: none, pap, chap, pap_or_chap
  clear_password = false
  password       = "example"
  user_name      = "example"
}

resource "prismasdwan_apn_profile" "example_apn_profile_4" {
  name           = "example_apnprofile_4"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags           = ["terraform"]
  apn            = "example-tf"
  authentication = "chap" # one of: none, pap, chap, pap_or_chap
  clear_password = true
  password       = null
  user_name      = "example"
}

#
# Reading apn profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_apn_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_apn_profile.example_apn_profile_1.name
  }
  depends_on = [prismasdwan_apn_profile.example_apn_profile_1]
}

# by id
data "prismasdwan_apn_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_apn_profile.example_apn_profile_1.id
  }
  depends_on = [prismasdwan_apn_profile.example_apn_profile_1]
}

# by apn
data "prismasdwan_apn_profile" "find_by_apn" {
  filters = {
    "apn" = prismasdwan_apn_profile.example_apn_profile_1.apn
  }
  depends_on = [prismasdwan_apn_profile.example_apn_profile_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_apn_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_apn_profile.example_apn_profile_1]
}

output "apn_profile_found" {
  value     = [for o in coalesce(data.prismasdwan_apn_profile.find_by_name.items, []) : o.id]
  sensitive = true
}
