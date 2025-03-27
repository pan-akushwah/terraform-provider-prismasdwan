# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_dns_service"
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

resource "prismasdwan_resource_locator" "element_site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "element_shell_site"
}

resource "prismasdwan_resource_locator" "element_shell" {
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "manual_device_shell"
}

resource "prismasdwan_resource_locator" "dnsservice_profile_id" {
  resource_type           = "prismasdwan_dns_service_profile"
  resource_property       = "name"
  resource_property_value = "Default DNSServiceProfile"
}

resource "prismasdwan_resource_locator" "dnsservice_role_id" {
  resource_type           = "prismasdwan_dns_service_role"
  resource_property       = "name"
  resource_property_value = "TfManagedDNSServiceRole"
}

resource "prismasdwan_resource_locator" "element_port_1_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "1"
}

resource "prismasdwan_resource_locator" "element_port_2_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "2"
}

resource "prismasdwan_resource_locator" "element_port_3_id" {
  x_parameters = {
    element_id = prismasdwan_resource_locator.element_shell.result
    site_id    = prismasdwan_resource_locator.element_site.result
  }
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "3"
}



output "element_name_id" {
  value = prismasdwan_resource_locator.element_shell.result
}

output "default_dns_profile_id" {
  value = prismasdwan_resource_locator.dnsservice_profile_id.result
}

resource "prismasdwan_element_dns_service" "first_element_dns_service" {
  name                       = "SomeDnsName"
  description                = "Managed by Terraform IaaC (Modified)"
  tags                       = ["lorem", "ipsum"]
  max_concurrent_dns_queries = 150
  dnsservice_profile_id      = prismasdwan_resource_locator.dnsservice_profile_id.result
  enabled                    = false
  dnsservicerole_bindings = [
    {
      dnsservicerole_id = prismasdwan_resource_locator.dnsservice_role_id.result
      interfaces = [
        {
          interface_id = prismasdwan_resource_locator.element_port_1_id.result
        },
        {
          interface_id = prismasdwan_resource_locator.element_port_2_id.result
        },
        {
          interface_id = prismasdwan_resource_locator.element_port_3_id.result
        },
        {
          interface_ip = "10.10.1.0"
        }
        ,
        {
          interface_ip = "10.1.1.12"
        }
      ]
    }
  ]
  cache_config = {
    cache_size = 150
  }
  dns_queries_metadata = {
    add_customer_premises_equipment = {
      type            = "text"
      identifier_text = "Test"
    }
    add_subnets = [
      {
        ipv4_address       = "12.12.12.12"
        ipv4_prefix_length = 24
        ipv6_address       = ""
        ipv6_prefix_length = 0
      }
    ]
  }
  domains_to_addresses = [
    {
      domain_names = ["acme.com"]
      ipv4_address = "10.1.2.3"
    }
  ]
  domains_to_interfaces = [
    {
      domain_names = [
        "acme3.com"
      ],
      interface_id = prismasdwan_resource_locator.element_port_3_id.result
    }
  ]
}
