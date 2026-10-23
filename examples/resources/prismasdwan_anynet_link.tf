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
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# Two branch sites with a public WAN interface each, joined by the anynet link below.
# Each site needs its own location: the API treats sites at the same coordinates as duplicates.
resource "prismasdwan_site" "site_a" {
  name                 = "tf anynet site a"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  admin_state          = "disabled"
  element_cluster_role = "SPOKE"
  address = {
    city    = "San Jose"
    state   = "California"
    country = "United States"
  }
  location = {
    longitude = -121.8863
    latitude  = 37.3382
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

resource "prismasdwan_site" "site_b" {
  name                 = "tf anynet site b"
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
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

resource "prismasdwan_wan_network" "public_internet" {
  name        = "tf anynet public network"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  type        = "publicwan"
}

# public-1 is a built-in WAN interface label
resource "prismasdwan_resource_locator" "public_label" {
  resource_type           = "prismasdwan_wan_interface_label"
  resource_property       = "label"
  resource_property_value = "public-1"
}

resource "prismasdwan_site_wan_interface" "public_a" {
  x_parameters = {
    site_id = prismasdwan_site.site_a.id
  }
  name           = "tf anynet public interface a"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  type           = "publicwan"
  network_id     = prismasdwan_wan_network.public_internet.id
  link_bw_down   = 30
  link_bw_up     = 10
  bw_config_mode = "manual"
  label_id       = prismasdwan_resource_locator.public_label.result
}

resource "prismasdwan_site_wan_interface" "public_b" {
  x_parameters = {
    site_id = prismasdwan_site.site_b.id
  }
  name           = "tf anynet public interface b"
  description    = "Managed by Prisma SDWAN Terraform IaaC Provider"
  type           = "publicwan"
  network_id     = prismasdwan_wan_network.public_internet.id
  link_bw_down   = 30
  link_bw_up     = 10
  bw_config_mode = "manual"
  label_id       = prismasdwan_resource_locator.public_label.result
}

resource "prismasdwan_anynet_link" "manual_anynet_link" {
  name        = "Tf Managed Link 01"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = [
    "lorem", "ipsum"
  ]
  ep1_site_id          = prismasdwan_site.site_a.id
  ep1_wan_interface_id = prismasdwan_site_wan_interface.public_a.id
  ep2_site_id          = prismasdwan_site.site_b.id
  ep2_wan_interface_id = prismasdwan_site_wan_interface.public_b.id
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
