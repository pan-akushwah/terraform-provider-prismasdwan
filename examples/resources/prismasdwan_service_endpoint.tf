# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "service_endpoint"
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

resource "prismasdwan_service_endpoint" "service_endpoint_1" {
  name        = "tf managed service endpoint 1"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  type        = "non-cg-transit"
  # site_id = null
  admin_up = true
  service_link_peers = {
    ip_addresses = [
      "10.10.10.1"
    ],
    hostnames = [
      "something.com"
    ]
  }
  allow_enterprise_traffic = true
  liveliness_probe = {
    icmp_ping = [
      {
        ip_addresses = [
          "10.0.0.1"
        ],
        interval      = "10",
        failure_count = 3
      }
    ],
    #http                              = []
    use_tunnel_for_url_dns_resolution = false
  }
  sase_properties = {
    lqm_enabled = true
  }
  is_sase = true
  address = {
    city      = "Bengaluru"
    country   = "India"
    post_code = "560067"
    state     = "Karnataka"
    street    = null
    street2   = null
  }
  location = {
    longitude   = 80.24
    latitude    = 16.5
    description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  }
  disable_tunnel_reoptimization = true
}

resource "prismasdwan_service_endpoint" "service_endpoint_2" {
  name        = "tf managed service endpoint 2"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags        = ["lorem", "ipsum"]
  type        = "non-cg-transit"
  # site_id = null
  admin_up = true
  service_link_peers = {
    ip_addresses = [
      "10.10.10.1"
    ],
    hostnames = [
      "something.com"
    ]
  }
  allow_enterprise_traffic = true
  liveliness_probe = {
    http = [
      {
        url               = "http://httpbin.com"
        http_status_codes = [400]
        interval          = 10
        failure_count     = 3
      }
    ]
    use_tunnel_for_url_dns_resolution = false
  }
  sase_properties = {
    lqm_enabled = true
  }
  is_sase = true
  address = {
    city      = "Bengaluru"
    country   = "India"
    post_code = "560067"
    state     = "Karnataka"
    street    = null
    street2   = null
  }
  location = {
    longitude   = 79.5
    latitude    = 14.5
    description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  }
  disable_tunnel_reoptimization = true
}