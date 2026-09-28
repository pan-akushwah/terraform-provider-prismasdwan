## Documentation for Prisma SDWAN Resource "ntp_template"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ntp_template` |
| Get Api  | `/sdwan/v2.0/api/templates/ntp/{ntp_id}` (`NTPTemplate`) |
| Post Api  | `/sdwan/v2.0/api/templates/ntp` (`NTPTemplate`) |
| Put Api  | `/sdwan/v2.0/api/templates/ntp/{ntp_id}` (`NTPTemplate`) |
| Delete Api  | `/sdwan/v2.0/api/templates/ntp/{ntp_id}` |


### JSON Schema

```json
{
  "properties" : {
    "default_template" : {
      "description" : "Default Template",
      "type" : "boolean"
    },
    "ntp_servers" : {
      "description" : "Ntp Servers",
      "maxItems" : 10,
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "max_poll" : {
            "description" : "Max Poll",
            "format" : "int32",
            "maximum" : 17,
            "minimum" : 4,
            "type" : "integer"
          },
          "min_poll" : {
            "description" : "Min Poll",
            "format" : "int32",
            "maximum" : 17,
            "minimum" : 4,
            "type" : "integer"
          },
          "version" : {
            "description" : "Version",
            "format" : "int32",
            "maximum" : 4,
            "minimum" : 2,
            "type" : "integer"
          },
          "host" : {
            "description" : "Host",
            "format" : "hostname",
            "type" : "string"
          }
        },
        "required" : [ "max_poll", "min_poll", "version", "host" ]
      }
    },
    "tags" : {
      "description" : "Tags",
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
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "minLength" : 1,
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
  "required" : [ "default_template", "ntp_servers", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ntp_template.my_resource_name"
 id="<resource_id>"
}
```

