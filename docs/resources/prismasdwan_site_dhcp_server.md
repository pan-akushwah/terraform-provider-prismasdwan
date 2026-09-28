## Documentation for Prisma SDWAN Resource "site_dhcp_server"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_dhcp_server` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}` (`DHCPServerScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers` (`DHCPServerScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}` (`DHCPServerScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "static_mappings" : {
      "description" : "Static Mappings",
      "type" : "array",
      "items" : {
        "properties" : {
          "client_duid" : {
            "description" : "Client Duid",
            "pattern" : "([0-9a-fA-F]{1,2}:)*[0-9a-fA-F]{1,2}|([0-9a-fA-F]{1,2}:)*(:([0-9a-fA-F]{1,2}:)*)([0-9a-fA-F]{1,2})*",
            "type" : "string"
          },
          "ip_address" : {
            "description" : "Ip Address",
            "type" : "string"
          },
          "mac" : {
            "description" : "Mac",
            "format" : "mac-address",
            "pattern" : "^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$",
            "type" : "string"
          },
          "name" : {
            "description" : "Name",
            "maxLength" : 256,
            "pattern" : "^[a-zA-Z0-9]+(([a-zA-Z0-9\\-_])|(\\.?[a-zA-Z0-9\\-]))*\\.?$",
            "type" : "string"
          }
        },
        "required" : [ "client_duid", "ip_address", "mac", "name" ]
      }
    },
    "address_family" : {
      "description" : "Address Family",
      "type" : "string",
      "enum" : [ "ipv4", "ipv6" ]
    },
    "custom_options" : {
      "description" : "Custom Options",
      "type" : "array",
      "items" : {
        "properties" : {
          "vendor_class_identifier" : {
            "description" : "Vendor Class Identifier",
            "type" : "string"
          },
          "option_value" : {
            "description" : "Option Value",
            "maxLength" : 8192,
            "minLength" : 1,
            "type" : "string"
          },
          "option_definition" : {
            "description" : "Option Definition",
            "maxLength" : 1024,
            "minLength" : 1,
            "type" : "string"
          }
        },
        "required" : [ "vendor_class_identifier", "option_value", "option_definition" ]
      }
    },
    "ip_ranges" : {
      "description" : "Ip Ranges",
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "end_ip" : {
            "description" : "End Ip",
            "type" : "string"
          },
          "start_ip" : {
            "description" : "Start Ip",
            "type" : "string"
          }
        },
        "required" : [ "end_ip", "start_ip" ]
      }
    },
    "max_lease_time" : {
      "description" : "Max Lease Time",
      "format" : "int64",
      "maximum" : 4294967295,
      "minimum" : 300,
      "type" : "integer"
    },
    "default_lease_time" : {
      "description" : "Default Lease Time",
      "format" : "int64",
      "maximum" : 4294967295,
      "minimum" : 300,
      "type" : "integer"
    },
    "dns_servers" : {
      "description" : "Dns Servers",
      "maxItems" : 3,
      "type" : "array",
      "items" : {
        "description" : "Dns Servers",
        "type" : "string"
      }
    },
    "domain_name" : {
      "description" : "Domain Name",
      "maxLength" : 256,
      "type" : "string"
    },
    "broadcast_address" : {
      "description" : "Broadcast Address",
      "type" : "string"
    },
    "gateway" : {
      "description" : "Gateway",
      "type" : "string"
    },
    "subnet" : {
      "description" : "Subnet",
      "type" : "string"
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "maxLength" : 50,
      "pattern" : "^-?[0-9]{1,50}$",
      "type" : "string"
    },
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
        "pattern" : "[^,\\s]+",
        "type" : "string"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_unordered" : {
            "type" : "boolean"
          }
        }
      }
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "_etag" : {
      "description" : "Etag for this object",
      "minimum" : 1,
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "id" : {
      "description" : "Id",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "_schema" : {
      "description" : "Schema version for this object",
      "minimum" : 1,
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    }
  },
  "required" : [ "vrf_context_id", "static_mappings", "address_family", "custom_options", "ip_ranges", "max_lease_time", "default_lease_time", "dns_servers", "domain_name", "broadcast_address", "gateway", "subnet", "network_context_id", "description", "tags", "disabled", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_dhcp_server.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

