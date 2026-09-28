## Documentation for Prisma SDWAN Resource "tacacs_plus_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `tacacs_plus_profile` |
| Get Api  | `/sdwan/v2.0/api/tacacs_plus_profiles/{profile_id}` (`TacacsPlusProfileScreen`) |
| Post Api  | `/sdwan/v2.0/api/tacacs_plus_profiles` (`TacacsPlusProfileScreen`) |
| Put Api  | `/sdwan/v2.0/api/tacacs_plus_profiles/{profile_id}` (`TacacsPlusProfileScreen`) |
| Delete Api  | `/sdwan/v2.0/api/tacacs_plus_profiles/{profile_id}` |


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
      "minItems" : 1,
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
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
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
  "required" : [ "authentication_protocol", "tacacs_plus_servers", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_tacacs_plus_profile.my_resource_name"
 id="<resource_id>"
}
```

