# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_ntp_template: Manages a Prisma SD-WAN Ntp Template.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - default_template = true replaces the tenant's default template, and a default template can't be deleted. Leave
#     it false unless you mean to change the tenant default.
#
# Tested end to end by the provider suite: resources/ntp_template/example, data_sources/ntp_template/filters.
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

resource "prismasdwan_ntp_template" "example_ntp_template_1" {
  name             = "example_ntp_template_1"
  description      = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags             = ["terraform"]
  default_template = false # true replaces the tenant default, which then cannot be deleted
  ntp_servers = [
    {
      host     = "10.11.12.13"
      version  = 4
      min_poll = 6
      max_poll = 10
    },
    {
      host     = "10.11.12.14"
      version  = 4
      min_poll = 6
      max_poll = 10
    }
  ]
}

resource "prismasdwan_ntp_template" "example_ntp_template_2" {
  name             = "example_ntp_template_2"
  description      = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags             = ["terraform"]
  default_template = false
  ntp_servers = [
    {
      host     = "0.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 4
      max_poll = 9
    },
    {
      host     = "1.cloudgenix.pool.ntp.org"
      version  = 4
      min_poll = 9
      max_poll = 10
    },
    {
      host     = "time.nist.gov"
      version  = 4
      min_poll = 4
      max_poll = 10
    },
    {
      host     = "10.11.12.15"
      version  = 4
      min_poll = 6
      max_poll = 10
    }
  ]
}

#
# Reading ntp template objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_ntp_template" "find_by_name" {
  filters = {
    "name" = prismasdwan_ntp_template.example_ntp_template_1.name
  }
  depends_on = [prismasdwan_ntp_template.example_ntp_template_1]
}

# by id
data "prismasdwan_ntp_template" "find_by_id" {
  filters = {
    "id" = prismasdwan_ntp_template.example_ntp_template_1.id
  }
  depends_on = [prismasdwan_ntp_template.example_ntp_template_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_ntp_template" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_ntp_template.example_ntp_template_1]
}

output "ntp_template_found" {
  value = [for o in coalesce(data.prismasdwan_ntp_template.find_by_name.items, []) : o.id]
}
