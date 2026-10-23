# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_probe_config: Manages a Prisma SD-WAN Probe Config.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/probe_config/example, data_sources/probe_config/filters.
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

resource "prismasdwan_probe_config" "dns_icmp" {
  name        = "Terraform Managed ICMP Probe"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  endpoints = [
    {
      ipv4_address                    = "1.1.1.1"
      protocol                        = "icmp"
      probe_cycle_duration            = 10
      probe_count                     = 2
      path_types                      = ["direct", "vpn", "servicelink"]
      allow_insecure_https_connection = false
    }
  ]
}

resource "prismasdwan_probe_config" "dns_probe" {
  name        = "Terraform Managed DNS Probe"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  endpoints = [
    {
      fqdn                            = "acme.com"
      dns_server_ip                   = "8.8.8.8"
      protocol                        = "dns"
      probe_cycle_duration            = 10
      probe_count                     = 2
      path_types                      = ["direct", "vpn", "servicelink"]
      allow_insecure_https_connection = false
    }
  ]
}


resource "prismasdwan_probe_config" "http_ping" {
  name        = "Terraform Managed HTTP Probe"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  endpoints = [
    {
      fqdn                            = "acme.com"
      protocol                        = "http"
      probe_cycle_duration            = 10
      probe_count                     = 2
      path_types                      = ["direct", "vpn", "servicelink"]
      allow_insecure_https_connection = false
      http_response_codes             = [200, 400]
    }
  ]
}


resource "prismasdwan_probe_config" "https_ping" {
  name        = "Terraform Managed HTTPS Probe"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  enabled     = true
  endpoints = [
    {
      fqdn                            = "ping.com"
      protocol                        = "https"
      probe_cycle_duration            = 10
      probe_count                     = 2
      path_types                      = ["direct", "vpn", "servicelink"]
      allow_insecure_https_connection = false
    }
  ]
}

#
# Reading probe config objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_probe_config" "find_by_name" {
  filters = {
    "name" = prismasdwan_probe_config.dns_icmp.name
  }
  depends_on = [prismasdwan_probe_config.dns_icmp]
}

# by id
data "prismasdwan_probe_config" "find_by_id" {
  filters = {
    "id" = prismasdwan_probe_config.dns_icmp.id
  }
  depends_on = [prismasdwan_probe_config.dns_icmp]
}

output "probe_config_found" {
  value = [for o in coalesce(data.prismasdwan_probe_config.find_by_name.items, []) : o.id]
}
