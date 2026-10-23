# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_path_policy_set: Manages a Prisma SD-WAN Path Policy Set.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/path_policy_set/example, data_sources/path_policy_set/filters.
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

resource "prismasdwan_path_policy_set" "corporate_policy_set" {
  name                  = "corporate_main_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["corporate", "main", "policy"]
  defaultrule_policyset = false
}

resource "prismasdwan_path_policy_set" "branch_office_policy_set" {
  name                  = "branch_office_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["branch", "office", "policy"]
  defaultrule_policyset = false
}

resource "prismasdwan_path_policy_set" "cloud_policy_set" {
  name                  = "cloud_services_policy_set"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["cloud", "services", "policy"]
  defaultrule_policyset = false
}

#
# Reading path policy set objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_path_policy_set" "find_by_name" {
  filters = {
    "name" = prismasdwan_path_policy_set.corporate_policy_set.name
  }
  depends_on = [prismasdwan_path_policy_set.corporate_policy_set]
}

# by id
data "prismasdwan_path_policy_set" "find_by_id" {
  filters = {
    "id" = prismasdwan_path_policy_set.corporate_policy_set.id
  }
  depends_on = [prismasdwan_path_policy_set.corporate_policy_set]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_path_policy_set" "find_by_tags_member" {
  filters = {
    "tags.#(==\"corporate\")" = "corporate"
  }
  depends_on = [prismasdwan_path_policy_set.corporate_policy_set]
}

output "path_policy_set_found" {
  value = [for o in coalesce(data.prismasdwan_path_policy_set.find_by_name.items, []) : o.id]
}
