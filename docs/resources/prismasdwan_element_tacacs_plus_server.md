## Documentation for Prisma SDWAN Resource "element_tacacs_plus_server"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_tacacs_plus_server` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{tacacs_plus_server_id}` (`TacacsPlusServerScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers` (`TacacsPlusServerScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{tacacs_plus_server_id}` (`TacacsPlusServerScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{tacacs_plus_server_id}` |


### JSON Schema

```json
{
  "properties" : {
    "authentication_protocol" : {
      "description" : "Authentication Protocol",
      "type" : "string",
      "enum" : [ "chap", "pap" ]
    },
    "tacacs_plus_servers" : {
      "description" : "Tacacs Plus Servers",
      "maxItems" : 4,
      "type" : "array",
      "items" : {
        "properties" : {
          "secret" : {
            "description" : "Secret",
            "type" : "string",
            "additionalProperties" : {
              "properties" : {
                "x_flag_sensitive" : {
                  "type" : "boolean"
                }
              }
            }
          },
          "timeout" : {
            "description" : "Timeout",
            "format" : "int32",
            "type" : "integer"
          },
          "server_port" : {
            "description" : "Server Port",
            "format" : "int32",
            "type" : "integer"
          },
          "server_fqdn" : {
            "description" : "Server Fqdn",
            "type" : "string"
          },
          "server_ipv6" : {
            "description" : "Server Ipv6",
            "type" : "string"
          },
          "server_ip" : {
            "description" : "Server Ip",
            "type" : "string"
          }
        },
        "required" : [ "secret", "timeout", "server_port", "server_fqdn", "server_ipv6", "server_ip" ]
      }
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "source_interface_id" : {
      "description" : "Source Interface Id",
      "type" : "string"
    },
    "tacacs_plus_profile_id" : {
      "description" : "Tacacs Plus Profile Id",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
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
    "description" : {
      "description" : "Description",
      "maxLength" : 1024,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "type" : "string"
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
  "required" : [ "authentication_protocol", "tacacs_plus_servers", "enabled", "source_interface_id", "tacacs_plus_profile_id", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_tacacs_plus_server.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

