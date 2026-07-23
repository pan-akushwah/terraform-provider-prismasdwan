# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_ipfix"
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

resource "prismasdwan_element_ipfix" "example" {
  name             = "TestProfile"
  ipfixtemplate_id = "1769252467908022596"
  ipfixprofile_id  = "1769252570956010396"

  collector_config {
    protocol                 = "udp"
    ipfixcollectorcontext_id = "1769252432167011196"
    host                     = "10.11.12.13"
    host_port                = 1011
    max_message_size         = 1372
  }

  filters {
    dst_prefixes_id = "1706693389496005796"
    src_prefixes_id = "1706693389496005796"

    dst_ports {
      start = 130
      end   = 131
    }

    src_ports {
      start = 120
      end   = 121
    }

    protocols = ["tcp", "udp"]
  }
}
