# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_shell_interface"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# The element to configure. "element_shell_site" and "manual_device_shell" are example names; use your own.
resource "prismasdwan_resource_locator" "element_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "element_shell_site"
}

resource "prismasdwan_resource_locator" "element_shell" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

# The element shell whose ports are configured
resource "prismasdwan_resource_locator" "element_shell_object" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_shell"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

# The built-in Global VRF
resource "prismasdwan_resource_locator" "global_vrf_context" {
  resource_type           = "prismasdwan_vrf_context"
  resource_property       = "name"
  resource_property_value = "Global"
}

#
# Ports already exist on the shell: x_parameters.id adopts port "4" instead of creating an interface.
# Destroying the resource hands the port back unconfigured (used_for = none, DHCP).
#
resource "prismasdwan_resource_locator" "port_4" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
  }
  resource_type           = "prismasdwan_element_shell_interface"
  resource_property       = "name"
  resource_property_value = "4"
}

resource "prismasdwan_element_shell_interface" "lan_port" {
  x_parameters = {
    site_id          = prismasdwan_resource_locator.element_site.result
    element_shell_id = prismasdwan_resource_locator.element_shell_object.result
    id               = prismasdwan_resource_locator.port_4.result
  }
  name           = "4"
  type           = "port"
  admin_up       = true
  used_for       = "lan"
  scope          = "local"
  vrf_context_id = prismasdwan_resource_locator.global_vrf_context.result
  ipv4_config = {
    type          = "static"
    static_config = { address = "10.60.4.1/24" }
  }
  # the API fills these nested objects in; set them so plan and state agree
  ethernet_port = {
    full_duplex = false
    speed       = 0
  }
  multicast_config = {
    multicast_enabled = false
    igmp_version      = "IGMPV3"
    dr_priority       = 1
  }
}
