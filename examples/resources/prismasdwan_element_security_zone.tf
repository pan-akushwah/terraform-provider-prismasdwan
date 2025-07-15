# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_security_zone"
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
#    auth_url      = "https://auth.appsvc.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

resource "prismasdwan_resource_locator" "element_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "element_shell_site"
}

resource "prismasdwan_resource_locator" "element_shell" {
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

resource "prismasdwan_resource_locator" "dnsservice_profile_id" {
  resource_type           = "prismasdwan_dns_service_profile"
  resource_property       = "name"
  resource_property_value = "Default DNSServiceProfile"
}

resource "prismasdwan_resource_locator" "dnsservice_role_id" {
  resource_type           = "prismasdwan_dns_service_role"
  resource_property       = "name"
  resource_property_value = "TfManagedDNSServiceRole"
}

resource "prismasdwan_resource_locator" "element_port_1_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "1"
}

resource "prismasdwan_resource_locator" "element_port_2_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "2"
}

resource "prismasdwan_resource_locator" "element_port_3_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "3"
}

resource "prismasdwan_resource_locator" "wan_interface_id" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_site_wan_interface"
  resource_property       = "type"
  resource_property_value = "publicwan"
}

resource "prismasdwan_resource_locator" "vpn_wan_overlay_id" {
  resource_type           = "prismasdwan_wan_overlay"
  resource_property       = "name"
  resource_property_value = "VPN"
}

resource "prismasdwan_resource_locator" "security_zone_id" {
  resource_type           = "prismasdwan_security_zone"
  resource_property       = "name"
  resource_property_value = "existing security zone name"
}

resource "prismasdwan_element_security_zone" "security_zone" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  interface_ids = [
    prismasdwan_resource_locator.element_port_3_id.result,
    prismasdwan_resource_locator.element_port_2_id.result
  ]
  waninterface_ids = [
    prismasdwan_resource_locator.wan_interface_id.result
  ]
  wanoverlay_ids = [
    prismasdwan_resource_locator.vpn_wan_overlay_id.result
  ]
  zone_id        = prismasdwan_resource_locator.security_zone_id.result
  lannetwork_ids = []
}