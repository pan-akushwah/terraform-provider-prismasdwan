# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_security_policy_local_prefix: Manages a Prisma SD-WAN Security Policy Local Prefix.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/security_policy_local_prefix/example,
# data_sources/security_policy_local_prefix/filters.
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

resource "prismasdwan_security_policy_local_prefix" "test_security_local_prefix" {
  name        = "corporate_security_local_prefix"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["corporate", "security", "local"]
}

resource "prismasdwan_security_policy_local_prefix" "development_local_prefix" {
  name        = "dev_security_local_prefix"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["development", "security", "local"]
}

resource "prismasdwan_security_policy_local_prefix" "production_local_prefix" {
  name        = "prod_security_local_prefix"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["production", "security", "local"]
}

#
# Reading security policy local prefix objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_security_policy_local_prefix" "find_by_name" {
  filters = {
    "name" = prismasdwan_security_policy_local_prefix.test_security_local_prefix.name
  }
  depends_on = [prismasdwan_security_policy_local_prefix.test_security_local_prefix]
}

# by id
data "prismasdwan_security_policy_local_prefix" "find_by_id" {
  filters = {
    "id" = prismasdwan_security_policy_local_prefix.test_security_local_prefix.id
  }
  depends_on = [prismasdwan_security_policy_local_prefix.test_security_local_prefix]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_security_policy_local_prefix" "find_by_tags_member" {
  filters = {
    "tags.#(==\"corporate\")" = "corporate"
  }
  depends_on = [prismasdwan_security_policy_local_prefix.test_security_local_prefix]
}

output "security_policy_local_prefix_found" {
  value = [for o in coalesce(data.prismasdwan_security_policy_local_prefix.find_by_name.items, []) : o.id]
}
