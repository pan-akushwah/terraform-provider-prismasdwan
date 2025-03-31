# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "anynet_link"
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

resource "prismasdwan_resource_locator" "first_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "element_shell_site"
}

resource "prismasdwan_resource_locator" "second_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "tf site 1"
}

resource "prismasdwan_resource_locator" "first_site_wan_interface" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.first_site.result
  }
  resource_type           = "prismasdwan_site_wan_interface"
  resource_property       = "type"
  resource_property_value = "publicwan"
}

resource "prismasdwan_resource_locator" "second_site_wan_interface" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.second_site.result
  }
  resource_type           = "prismasdwan_site_wan_interface"
  resource_property       = "type"
  resource_property_value = "publicwan"
}

resource "prismasdwan_anynet_link" "manual_anynet_link" {
  name        = "Tf Managed Link 01"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = [
    "lorem", "ipsum"
  ]
  ep1_site_id          = prismasdwan_resource_locator.first_site.result
  ep1_wan_interface_id = prismasdwan_resource_locator.first_site_wan_interface.result
  ep2_site_id          = prismasdwan_resource_locator.second_site.result
  ep2_wan_interface_id = prismasdwan_resource_locator.second_site_wan_interface.result
  type                 = "MANUAL-PUBLIC"
  forced               = false
  admin_up             = true
  vpnlink_configuration = {
    keep_alive_failure_count = 25
    keep_alive_interval      = 200
  }
  ep1_hub_cluster_id = null
  ep2_hub_cluster_id = null
}
