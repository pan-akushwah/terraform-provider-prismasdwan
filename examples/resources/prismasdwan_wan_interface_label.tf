# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_wan_interface_label: Manages a Prisma SD-WAN Wan Interface Label.
#
# Required x_parameters (the parent's ids; the plan fails without them): wantinterface_label_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Labels are built in and can't be created or deleted. Managing one renames it for the whole tenant, and
#     destroying the resource does not restore it.
#
# Tested end to end by the provider suite: resources/wan_interface_label/example,
# data_sources/wan_interface_label/filters.
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

#
# Circuit labels are built in: every tenant has public-1 ... public-n and private-1 ... private-n. They can't be
# created or deleted; look them up and use their ids, for example as a site WAN interface's label_id.
#
resource "prismasdwan_resource_locator" "circuit_category_private_1" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "private-1"
}

resource "prismasdwan_resource_locator" "circuit_category_public_1" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "public-1"
}

#
# Managing a label renames it or changes its settings for the whole tenant, and destroying the resource does not
# restore the previous values:
#
# resource "prismasdwan_wan_interface_label" "public_1" {
#   x_parameters = {
#     wantinterface_label_id = prismasdwan_resource_locator.circuit_category_public_1.result
#   }
#   label                  = "public-1"
#   name                   = "Primary Internet"
#   description            = "Broadband internet circuits"
#   lqm_enabled            = true
#   ...
# }

#
# Reading labels with the data source
#
data "prismasdwan_wan_interface_label" "find_public_1" {
  filters = {
    label = "public-1"
  }
}

data "prismasdwan_wan_interface_label" "find_by_id" {
  filters = {
    id = prismasdwan_resource_locator.circuit_category_private_1.result
  }
}

output "labels" {
  value = {
    public_1  = [for l in coalesce(data.prismasdwan_wan_interface_label.find_public_1.items, []) : "${l.label}: ${l.name}"]
    private_1 = [for l in coalesce(data.prismasdwan_wan_interface_label.find_by_id.items, []) : "${l.label}: ${l.name}"]
  }
}
