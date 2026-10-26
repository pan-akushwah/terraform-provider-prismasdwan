# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_ipfix_template: Manages a Prisma SD-WAN Ipfix Template.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - The API appends VRF_NAME to flow_fields; the provider ignores that addition.
#
# Tested end to end by the provider suite: resources/ipfix_template/example, data_sources/ipfix_template/filters.
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

resource "prismasdwan_ipfix_template" "example_ipfix_template" {
  name        = "example_template"
  description = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags = [
    "terraform",
    "example"
  ]
  flow_fields = [
    "TIME_STAMPS",
    "DST_IPV4_ADDRESS",
    "DST_PORT",
    "SRC_IPV4_ADDRESS",
    "SRC_PORT",
    "PROTOCOL",
    "CONNECTION_UNIFLOW_BYTES",
    "CONNECTION_UNIFLOW_PACKETS",
    "DSCP_LAST",
    "APPLICATION_HOST",
    "MEDIA_CODEC",
    "MEDIA_JITTER",
    "MEDIA_LOSS",
    "MEDIA_MOS",
    "RTP_TRANSPORT_TYPE"
  ]
  generate_biflow       = false
  option_export_timeout = 700
  options = [
    "DEVICE_IDENTIFICATION"
  ]
  template_export_timeout = 750
}

#
# Reading ipfix template objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_ipfix_template" "find_by_name" {
  filters = {
    "name" = prismasdwan_ipfix_template.example_ipfix_template.name
  }
  depends_on = [prismasdwan_ipfix_template.example_ipfix_template]
}

# by id
data "prismasdwan_ipfix_template" "find_by_id" {
  filters = {
    "id" = prismasdwan_ipfix_template.example_ipfix_template.id
  }
  depends_on = [prismasdwan_ipfix_template.example_ipfix_template]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipfix_template" "find_by_tags_member" {
  filters = {
    "tags.#(==\"terraform\")" = "terraform"
  }
  depends_on = [prismasdwan_ipfix_template.example_ipfix_template]
}

# by a value in the flow_fields list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipfix_template" "find_by_flow_fields_member" {
  filters = {
    "flow_fields.#(==\"TIME_STAMPS\")" = "TIME_STAMPS"
  }
  depends_on = [prismasdwan_ipfix_template.example_ipfix_template]
}

output "ipfix_template_found" {
  value = [for o in coalesce(data.prismasdwan_ipfix_template.find_by_name.items, []) : o.id]
}
