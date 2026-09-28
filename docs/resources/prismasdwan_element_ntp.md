## Documentation for Prisma SDWAN Resource "element_ntp"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_ntp` |
| Get Api  | `/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}` (`ElementNTPV2N1`) |
| Put Api  | `/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}` (`ElementNTPV2N1`) |


### JSON Schema

```json
{
  "properties" : {
    "source_interface_ids" : {
      "description" : "Source Interface Ids",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Source Interface Ids",
        "type" : "string"
      }
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
  "required" : [ "source_interface_ids", "ntp_servers", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_ntp.my_resource_name"
 id="<resource_id>"
}
```

