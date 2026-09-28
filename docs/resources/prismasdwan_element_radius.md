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
      "description" : "Radius Configuration",
      "maxItems" : 2,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "properties" : {
          "priority" : {
            "description" : "Priority",
            "format" : "int32",
            "maximum" : 255,
            "minimum" : 0,
            "type" : "integer"
          },
          "shared_secret_encrypted" : {
            "description" : "Shared Secret Encrypted",
            "readOnly" : true,
            "type" : "string",
            "additionalProperties" : {
              "properties" : {
                "x_flag_sensitive" : {
                  "type" : "boolean"
                }
              }
            },
            "x-json-ignore" : true
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
            "description" : "Accounting Port",
            "format" : "int32",
            "maximum" : 65535,
            "minimum" : 0,
            "type" : "integer"
          },
          "authentication_port" : {
            "description" : "Authentication Port",
            "format" : "int32",
            "maximum" : 65535,
            "minimum" : 0,
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
        },
        "required" : [ "priority", "shared_secret_encrypted", "shared_secret", "retain_shared_secret", "accounting_port", "authentication_port", "server_ip_address", "ip_version" ]
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
  "required" : [ "override_indicator", "radius_profile_id", "source_interface_id", "radius_configuration", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_radius.my_resource_name"
 id="<resource_id>:element_id=<some_element_id>"
}
```

