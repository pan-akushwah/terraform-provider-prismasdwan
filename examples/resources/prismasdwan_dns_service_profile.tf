# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_dns_service_profile: Manages a Prisma SD-WAN Dns Service Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Names may not contain hyphens; use underscores.
#
# Tested end to end by the provider suite: resources/dns_service_profile/example,
# data_sources/dns_service_profile/filters.
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

resource "prismasdwan_dns_service_profile" "default_dns_service_profile" {
  authoritative_config = null
  cache_config         = null
  description          = "Managed by Prisma SDWAN Terraform IaaC Provider"
  dns_forward_config = {
    dns_servers = [
      {
        address_family            = "ipv4"
        dnsserver_ip              = "127.0.0.1"
        dnsserver_port            = null
        domain_names              = null
        forward_dnsservicerole_id = null
        ip_prefix                 = null
        source_port               = null
      },
    ]
    max_source_port         = null
    min_source_port         = 1024
    send_to_all_dns_servers = true
  }
  dns_queries_metadata      = null
  dns_rebind_config         = null
  dns_response_overrides    = null
  dnssec_config             = null
  domains_to_addresses      = null
  edns_packet_max           = 4096
  enable_dns_loop_detection = false
  enable_dnssec_proxy       = false
  enable_strict_domain_name = false
  listen_dnsservicerole_id  = null
  listen_port               = 53
  name                      = "Default DNSServiceProfile"
  tags                      = null
}

#
# Reading dns service profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_dns_service_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_dns_service_profile.default_dns_service_profile.name
  }
  depends_on = [prismasdwan_dns_service_profile.default_dns_service_profile]
}

# by id
data "prismasdwan_dns_service_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_dns_service_profile.default_dns_service_profile.id
  }
  depends_on = [prismasdwan_dns_service_profile.default_dns_service_profile]
}

output "dns_service_profile_found" {
  value = [for o in coalesce(data.prismasdwan_dns_service_profile.find_by_name.items, []) : o.id]
}
