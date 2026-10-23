# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_iot_snmp_start_node"
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

# A minimal site for this example.
resource "prismasdwan_site" "branch_site" {
  name                 = "tf iot snmp start node branch site"
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

# Every site has exactly one device-id configuration
data "prismasdwan_site_iot_device_id_config" "existing" {
  x_parameters = {
    site_id = prismasdwan_site.branch_site.id
  }
  filters = {
    // read all (there is only one)
  }
}

resource "prismasdwan_site_iot_snmp_start_node" "example" {
  x_parameters = {
    site_id            = prismasdwan_site.branch_site.id
    deviceid_config_id = data.prismasdwan_site_iot_device_id_config.existing.items[0].id
  }
  name         = "tf example snmp start node"
  description  = "Managed by Prisma SDWAN Terraform IaaC Provider"
  ipv4_address = "10.30.0.1"
  scope = [
    {
      ipv4_prefix = "10.30.0.0/24"
    }
  ]
}
