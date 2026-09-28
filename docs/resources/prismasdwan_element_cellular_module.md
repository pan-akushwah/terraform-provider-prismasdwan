## Documentation for Prisma SDWAN Resource "element_cellular_module"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_cellular_module` |
| Get Api  | `/sdwan/v2.0/api/elements/{element_id}/cellular_modules/{cellular_module_id}` (`CellularModuleScreen`) |
| Put Api  | `/sdwan/v2.0/api/elements/{element_id}/cellular_modules/{cellular_module_id}` (`CellularModuleScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "primary_sim" : {
      "description" : "Primary Sim",
      "type" : "integer"
    },
    "gps_enable" : {
      "description" : "Gps Enable",
      "type" : "boolean"
    },
    "radio_on" : {
      "description" : "Radio On",
      "type" : "boolean"
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
  "required" : [ "primary_sim", "gps_enable", "radio_on", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_cellular_module.my_resource_name"
 id="<resource_id>"
}
```

