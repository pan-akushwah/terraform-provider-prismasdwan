# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ipfix".
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

resource "prismasdwan_element_ipfix" "example" {
  collector_config = [{
    host                     = "server.example.com"
    host_port                = 443
    ipfixcollectorcontext_id = "<ipfixcollectorcontext_id>"
    max_message_size         = 10
    protocol                 = "udp"
  }]
  description          = "Managed by Terraform"
  export_cache_timeout = 443
  filters = [{
    app_def_ids = ["<app_def_id>"]
    dst_ports = [{
      end   = 10
      start = 10
    }]
    dst_prefixes_id        = "<dst_prefixes_id>"
    ipfixfiltercontext_ids = ["<ipfixfiltercontext_id>"]
    priority_traffic_types = ["P1_Video"]
    protocols              = ["udp"]
    rtp_transport_type     = "audio"
    src_ports = [{
      end   = 10
      start = 10
    }]
    src_prefixes_id    = "<src_prefixes_id>"
    wan_path_direction = "lan_to_wan"
  }]
  ipfixprofile_id  = "<ipfixprofile_id>"
  ipfixtemplate_id = "<ipfixtemplate_id>"
  name             = "example_name"
  sampler = {
    algorithm     = "time_based"
    time_interval = 30
    time_spacing  = 30
  }
  tags = ["terraform"]
}
