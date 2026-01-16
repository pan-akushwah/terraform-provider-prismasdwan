## Documentation for Prisma SDWAN Resource "element_radius"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_radius` |
| Get Api  | `/sdwan/v2.0/api/elements/{element_id}/radii/{radius_id}` (`ElementRadiusScreen`) |
| Post Api  | `/sdwan/v2.0/api/elements/{element_id}/radii` (`ElementRadiusScreen`) |
| Put Api  | `/sdwan/v2.0/api/elements/{element_id}/radii/{radius_id}` (`ElementRadiusScreen`) |
| Delete Api  | `/sdwan/v2.0/api/elements/{element_id}/radii/{radius_id}` |


### JSON Schema

```json
{
  "properties" : {
    "override_indicator" : {
      "description" : "Override Indicator",
      "type" : "array",
      "items" : {
        "description" : "Override Indicator",
        "type" : "string"
      }
    },
    "radius_profile_id" : {
      "description" : "Radius Profile Id",
      "type" : "string"
    },
    "source_interface_id" : {
      "description" : "Source Interface Id",
      "type" : "string"
    },
    "radius_configuration" : {
      "description" : "Radius Configuration: ListObject(allowDuplicate = false, allowEmpty = true, allowNull = true, listMaxSize = 2, message = RADIUS_CONFIG_INVALID_CONFIG_PARAMETERS, required = false) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "priority" : {
            "description" : "Priority: Range(max = 255L, message = RADIUS_CONFIG_INVALID_PRIORITY, min = 0L) ",
            "format" : "int32",
            "type" : "integer"
          },
          "shared_secret_encrypted" : {
            "description" : "Shared Secret Encrypted: JsonIgnore(value = true) ",
            "type" : "string",
            "additionalProperties" : {
              "properties" : {
                "x_flag_sensitive" : {
                  "type" : "boolean"
                }
              }
            }
          },
          "shared_secret" : {
            "description" : "Shared Secret",
            "type" : "string",
            "additionalProperties" : {
              "properties" : {
                "x_flag_sensitive" : {
                  "type" : "boolean"
                }
              }
            }
          },
          "retain_shared_secret" : {
            "description" : "Retain Shared Secret",
            "type" : "boolean",
            "additionalProperties" : {
              "properties" : {
                "x_flag_sensitive" : {
                  "type" : "boolean"
                }
              }
            }
          },
          "accounting_port" : {
            "description" : "Accounting Port: Range(max = 65535L, message = RADIUS_CONFIG_INVALID_ACCOUNTING_PORT, min = 0L) ",
            "format" : "int32",
            "type" : "integer"
          },
          "authentication_port" : {
            "description" : "Authentication Port: Range(max = 65535L, message = RADIUS_CONFIG_INVALID_AUTH_PORT, min = 0L) ",
            "format" : "int32",
            "type" : "integer"
          },
          "server_ip_address" : {
            "description" : "Server Ip Address",
            "type" : "string"
          },
          "ip_version" : {
            "description" : "Ip Version",
            "format" : "int32",
            "type" : "integer"
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
 to="prismasdwan_element_radius.my_resource_name"
 id="<resource_id>:element_id=<some_element_id>"
}
```

