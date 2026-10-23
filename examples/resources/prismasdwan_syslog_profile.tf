# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_syslog_profile: Manages a Prisma SD-WAN Syslog Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - Names may not contain hyphens (SYSLOGSERVER_PROFILE_INVALID_NAME); use underscores.
#
# Tested end to end by the provider suite: resources/syslog_profile/example, data_sources/syslog_profile/filters.
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

resource "prismasdwan_syslog_profile" "example_syslog_profile_1" {
  name                  = "example_syslogprofile_1"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["lorem"]
  protocol              = "tcp" # one of: tcp, udp, tls
  enable_flow_logging   = true
  remote_ca_certificate = null
  server_fqdn           = null
  server_ip             = "10.11.13.14"
  server_port           = 514
  severity_level        = "major" # one of: major, minor, critical
}

resource "prismasdwan_syslog_profile" "example_syslog_profile_2" {
  name                  = "example_syslogprofile_2"
  description           = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                  = ["lorem"]
  protocol              = "udp" # one of: tcp, udp, tls
  enable_flow_logging   = false
  remote_ca_certificate = null
  server_fqdn           = "google.com"
  server_ip             = null
  server_port           = 123
  severity_level        = "critical" # one of: major, minor, critical
}

#
# Reading syslog profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_syslog_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_syslog_profile.example_syslog_profile_1.name
  }
  depends_on = [prismasdwan_syslog_profile.example_syslog_profile_1]
}

# by id
data "prismasdwan_syslog_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_syslog_profile.example_syslog_profile_1.id
  }
  depends_on = [prismasdwan_syslog_profile.example_syslog_profile_1]
}

# by server_ip
data "prismasdwan_syslog_profile" "find_by_server_ip" {
  filters = {
    "server_ip" = prismasdwan_syslog_profile.example_syslog_profile_1.server_ip
  }
  depends_on = [prismasdwan_syslog_profile.example_syslog_profile_1]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_syslog_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"lorem\")" = "lorem"
  }
  depends_on = [prismasdwan_syslog_profile.example_syslog_profile_1]
}

output "syslog_profile_found" {
  value = [for o in coalesce(data.prismasdwan_syslog_profile.find_by_name.items, []) : o.id]
}
