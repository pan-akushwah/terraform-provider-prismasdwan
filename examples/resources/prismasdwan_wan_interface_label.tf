# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_wan_interface_label: Manages a Prisma SD-WAN Wan Interface Label.
#
# Required x_parameters (the parent's ids; the plan fails without them): wantinterface_label_id.
#
# This example creates the resource with the objects it depends on.
#
# Tested end to end by the provider suite: resources/wan_interface_label/example.
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
