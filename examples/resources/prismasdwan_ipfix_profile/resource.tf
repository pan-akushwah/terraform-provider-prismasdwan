# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "ipfix_profile".
# This file is generated - do not edit by hand.
#
# Before using this example, configure the Prisma SD-WAN provider:
#
#   terraform {
#     required_providers {
#       prismasdwan = {
#         source  = "paloaltonetworks/prismasdwan"
#       }
#     }
#   }
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

resource "prismasdwan_ipfix_profile" "example" {
  collector_config = [{
    host = "Lorem-Ipsum"
    host_port = 1234
    ipfixcollectorcontext_id = "123456789"
    max_message_size = 1234
    protocol = "Lorem-Ipsum"
  }]
  description = "Lorem-Ipsum"
  export_cache_timeout = 1234
  filters = [{
    app_def_ids = ["Lorem-Ipsum"]
    dst_ports = [{
      end = 1234
      start = 1234
    }]
    dst_prefixes_id = "123456789"
    ipfixfiltercontext_ids = ["Lorem-Ipsum"]
    priority_traffic_types = ["Lorem-Ipsum"]
    protocols = ["Lorem-Ipsum"]
    rtp_transport_type = "Lorem-Ipsum"
    src_ports = [{
      end = 1234
      start = 1234
    }]
    src_prefixes_id = "123456789"
    wan_path_direction = "Lorem-Ipsum"
  }]
  ipfixtemplate_id = "123456789"
  name = "Lorem-Ipsum"
  sampler = {
    algorithm = "Lorem-Ipsum"
    time_interval = 1234
    time_spacing = 1234
  }
  tags = ["lorem"]
}
