# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_shell: Manages a Prisma SD-WAN Element Shell.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - A shell stands in for an ION device that isn't claimed yet; its configuration applies when the device is
#     assigned to it.
#   - site_id is needed in x_parameters and in the body; role must match the site's element_cluster_role. tenant_id
#     is filled in from the provider's scope.
#
# Tested end to end by the provider suite: resources/element_shell/example, data_sources/element_shell/filters.
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

resource "prismasdwan_site" "branch" {
  name                 = "example_shell_site"
  description          = "Managed by Terraform"
  admin_state          = "disabled"
  element_cluster_role = "SPOKE"
  address = {
    city    = "Santa Clara"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.9552
    latitude  = 37.3541
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

#
# An element shell is a placeholder for an ION device that hasn't been claimed yet: configure it now, and the
# configuration applies when the device is assigned to it. tenant_id is filled in from the provider's scope.
#
resource "prismasdwan_element_shell" "branch_ion" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  site_id          = prismasdwan_site.branch.id # also required in the body
  name             = "example_branch_ion"
  model_name       = "ion 3104v"
  software_version = "6.5.1-b5"
  role             = "SPOKE" # must match the site's element_cluster_role
}

#
# Reading element shell objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_shell" "find_by_name" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  filters = {
    "name" = prismasdwan_element_shell.branch_ion.name
  }
  depends_on = [prismasdwan_element_shell.branch_ion]
}

# by id
data "prismasdwan_element_shell" "find_by_id" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  filters = {
    "id" = prismasdwan_element_shell.branch_ion.id
  }
  depends_on = [prismasdwan_element_shell.branch_ion]
}

# by a reference: every object with this site_id
data "prismasdwan_element_shell" "find_by_site_id" {
  x_parameters = {
    site_id = prismasdwan_site.branch.id
  }
  filters = {
    "site_id" = prismasdwan_element_shell.branch_ion.site_id
  }
  depends_on = [prismasdwan_element_shell.branch_ion]
}

output "element_shell_found" {
  value = [for o in coalesce(data.prismasdwan_element_shell.find_by_name.items, []) : o.id]
}
