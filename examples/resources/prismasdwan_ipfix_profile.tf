# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ipfix_profile"
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

resource "prismasdwan_ipfix_profile" "example_ipfix_profile" {
  name = "sample_ipfix_profile"
  description = "Created sample_ipfix_profile by Terraform"
  tags = ["example"]
  ipfixtemplate_id = prismasdwan_ipfix_template.example_ipfix_template.id
  collector_config = [
    {
      host = "10.0.0.1"
      host_port = 2000
      ipfixcollectorcontext_id = prismasdwan_ipfix_collector_context.example_collector_context.id
      max_message_size = 1800
      protocol = "tcp"
    }
  ]
  export_cache_timeout = 300
  filters = [{
    app_def_ids = ["1700028999966017496"]
    src_ports = [{
      start = 1000
      end = 2000
    }]
    dst_ports = [{
      start = 3001
      end = 4001
    }]
    dst_prefixes_id = prismasdwan_ipfix_global_prefix.example_ipfix_global.id
    ipfixfiltercontext_ids = [prismasdwan_ipfix_filter_context.example_filter_context.id]
    protocols = ["tcp","udp"]
    src_prefixes_id = prismasdwan_ipfix_local_prefix.example_ipfix_local.id
  }]
  sampler = {
    algorithm = "time_based"
    time_interval = 6
    time_spacing = 5
  }
}
