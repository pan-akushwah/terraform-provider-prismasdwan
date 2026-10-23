# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_ipfix_profile: Manages a Prisma SD-WAN Ipfix Profile.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/ipfix_profile/example, data_sources/ipfix_profile/filters.
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

resource "prismasdwan_resource_locator" "icmp_app_def" {
  resource_type           = "prismasdwan_app_def"
  resource_property       = "display_name"
  resource_property_value = "icmp"
}

resource "prismasdwan_ipfix_profile" "example_ipfix_profile" {
  name             = "sample_ipfix_profile"
  description      = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags             = ["example"]
  ipfixtemplate_id = prismasdwan_ipfix_template.example_ipfix_template.id
  collector_config = [
    {
      host                     = "10.0.0.1"
      host_port                = 2000
      ipfixcollectorcontext_id = prismasdwan_ipfix_collector_context.example_collector_context.id
      max_message_size         = 1800
      protocol                 = "tcp"
    }
  ]
  export_cache_timeout = 300
  filters = [{
    app_def_ids = [prismasdwan_resource_locator.icmp_app_def.result]
    src_ports = [{
      start = 1000
      end   = 2000
    }]
    dst_ports = [{
      start = 3001
      end   = 4001
    }]
    dst_prefixes_id        = prismasdwan_ipfix_global_prefix.example_ipfix_global.id
    ipfixfiltercontext_ids = [prismasdwan_ipfix_filter_context.example_filter_context.id]
    protocols              = ["tcp", "udp"]
    src_prefixes_id        = prismasdwan_ipfix_local_prefix.example_ipfix_local.id
  }]
  sampler = {
    algorithm     = "time_based"
    time_interval = 6
    time_spacing  = 5
  }
}

#
# Reading ipfix profile objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_ipfix_profile" "find_by_name" {
  filters = {
    "name" = prismasdwan_ipfix_profile.example_ipfix_profile.name
  }
  depends_on = [prismasdwan_ipfix_profile.example_ipfix_profile]
}

# by id
data "prismasdwan_ipfix_profile" "find_by_id" {
  filters = {
    "id" = prismasdwan_ipfix_profile.example_ipfix_profile.id
  }
  depends_on = [prismasdwan_ipfix_profile.example_ipfix_profile]
}

# by a reference: every object with this ipfixtemplate_id
data "prismasdwan_ipfix_profile" "find_by_ipfixtemplate_id" {
  filters = {
    "ipfixtemplate_id" = prismasdwan_ipfix_profile.example_ipfix_profile.ipfixtemplate_id
  }
  depends_on = [prismasdwan_ipfix_profile.example_ipfix_profile]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_ipfix_profile" "find_by_tags_member" {
  filters = {
    "tags.#(==\"example\")" = "example"
  }
  depends_on = [prismasdwan_ipfix_profile.example_ipfix_profile]
}

output "ipfix_profile_found" {
  value = [for o in coalesce(data.prismasdwan_ipfix_profile.find_by_name.items, []) : o.id]
}
