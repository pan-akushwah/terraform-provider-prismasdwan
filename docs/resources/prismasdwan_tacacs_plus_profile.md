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
      "description" : "Authentication Protocol: ValidateEnum(enumClass = classOf[TacacsAuthenticationProtocolEnum], error = TACACS_PLUS_PROFILE_INVALID_PROTOCOL: Invalid authentication protocol value. Should be either pap or chap., nullAllowed = false) ",
      "type" : "string"
    },
    "tacacs_plus_servers" : {
      "description" : "Tacacs Plus Servers: Valid ListObject(allowDuplicate = true, allowEmpty = false, allowNull = false, listMaxSize = 4, error = TACACS_PLUS_PROFILE_REQUIRED_SERVERS: Invalid number of TACACS servers configured. Minimum: 1 Maximum 4, required = false) ",
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
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
    },
    "id" : {
      "description" : "Id: Transient Id ",
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
  "required" : [ "authentication_protocol", "tacacs_plus_servers", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_tacacs_plus_profile.my_resource_name"
 id="<resource_id>"
}
```

