# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_element_dns_service: Manages a Prisma SD-WAN Element Dns Service.
#
# Required x_parameters (the parent's ids; the plan fails without them): site_id, element_id.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Tested end to end by the provider suite: resources/element_dns_service/example,
# data_sources/element_dns_service/filters.
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
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  name                       = "SomeDnsName"
  description                = "Managed by Prisma SDWAN Terraform IaaC Provider"
  tags                       = ["lorem", "ipsum"]
  max_concurrent_dns_queries = 150
  dnsservice_profile_id      = prismasdwan_resource_locator.dnsservice_profile_id.result
  enabled                    = false
  dnsservicerole_bindings = [
    {
      dnsservicerole_id = prismasdwan_dns_service_role.example.id # from the prismasdwan_dns_service_role example
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

#
# Reading element dns service objects back with the data source
#
# filters keys are paths into each object's JSON and values are compared as strings; an object is returned
# when every filter matches. items is null when nothing matches.
#

# by name
data "prismasdwan_element_dns_service" "find_by_name" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "name" = prismasdwan_element_dns_service.first_element_dns_service.name
  }
  depends_on = [prismasdwan_element_dns_service.first_element_dns_service]
}

# by id
data "prismasdwan_element_dns_service" "find_by_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "id" = prismasdwan_element_dns_service.first_element_dns_service.id
  }
  depends_on = [prismasdwan_element_dns_service.first_element_dns_service]
}

# by a reference: every object with this dnsservice_profile_id
data "prismasdwan_element_dns_service" "find_by_dnsservice_profile_id" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "dnsservice_profile_id" = prismasdwan_element_dns_service.first_element_dns_service.dnsservice_profile_id
  }
  depends_on = [prismasdwan_element_dns_service.first_element_dns_service]
}

# by a value in the tags list (gjson query: <list>.#(=="value"))
data "prismasdwan_element_dns_service" "find_by_tags_member" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.element_site.result
    element_id = prismasdwan_resource_locator.element_shell.result
  }
  filters = {
    "tags.#(==\"lorem\")" = "lorem"
  }
  depends_on = [prismasdwan_element_dns_service.first_element_dns_service]
}

output "element_dns_service_found" {
  value = [for o in coalesce(data.prismasdwan_element_dns_service.find_by_name.items, []) : o.id]
}
