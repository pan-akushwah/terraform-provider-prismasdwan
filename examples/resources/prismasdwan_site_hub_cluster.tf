# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "site_hub_cluster"
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
  resource_property_value = "tf branch site 2"
}

resource "prismasdwan_resource_locator" "second_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "tf branch site 1"
}

resource "prismasdwan_resource_locator" "dc_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "tf data center"
}

resource "prismasdwan_resource_locator" "dc_element_or_shell" {
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "dc element or shell"
}


#
# Creates an empty DC Hub Cluster
#
resource "prismasdwan_site_hub_cluster" "empty_dc_hub_cluster" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.dc_site.result
  }
  name                       = "tf managed empty hub cluster 01"
  default_cluster            = false
  description                = "Managed by Terraform Provider IaaC"
  tags                       = ["lorem", "ipsum"]
  site_count_alarm_threshold = null
  peer_sites                 = null
  elements                   = null
}

#
# Creates a Hub Cluster with 2 Sites
#
resource "prismasdwan_site_hub_cluster" "non_empty_dc_hub_cluster" {
  x_parameters = {
    site_id = prismasdwan_resource_locator.dc_site.result
  }
  name                       = "tf managed empty hub cluster 01"
  default_cluster            = false
  description                = "Managed by Terraform Provider IaaC"
  tags                       = ["lorem", "ipsum"]
  site_count_alarm_threshold = 20
  peer_sites = [
    prismasdwan_resource_locator.first_site.result,
    prismasdwan_resource_locator.second_site.result
  ]
  elements = [
    {
      locked         = false
      hub_element_id = prismasdwan_resource_locator.dc_element_or_shell.result
    }
  ]
}
