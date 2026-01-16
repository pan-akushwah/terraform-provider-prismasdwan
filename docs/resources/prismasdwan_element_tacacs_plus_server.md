## Documentation for Prisma SDWAN Resource "element_tacacs_plus_server"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_tacacs_plus_server` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{id}` (`TacacsPlusServerScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers` (`TacacsPlusServerScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{id}` (`TacacsPlusServerScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "authentication_protocol" : {
      "description" : "Authentication Protocol: ValidateEnum(enumClass = classOf[TacacsAuthenticationProtocolEnum], error = TACACS_PLUS_SERVER_INVALID_PROTOCOL: Invalid authentication protocol value. Should be either pap or chap., nullAllowed = true) ",
      "type" : "string"
    },
    "tacacs_plus_servers" : {
      "description" : "Tacacs Plus Servers: Valid ListObject(allowDuplicate = true, allowEmpty = true, allowNull = true, listMaxSize = 4, error = TACACS_PLUS_SERVER_REQUIRED_SERVERS: Invalid number of TACACS servers configured. Minimum: 1 Maximum 4, required = false) ",
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
        }
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
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Tags",
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
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
    }
  },
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_tacacs_plus_server.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

