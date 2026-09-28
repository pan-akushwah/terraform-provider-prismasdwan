## Documentation for Prisma SDWAN Resource "element_cellular_module_sim_security"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_cellular_module_sim_security` |
| Get Api  | `/sdwan/v2.0/api/elements/{element_id}/cellular_modules/{cellular_module_id}/sim_security/{sim_security_id}` (`SimSecurityScreen`) |
| Put Api  | `/sdwan/v2.0/api/elements/{element_id}/cellular_modules/{cellular_module_id}/sim_security/{sim_security_id}` (`SimSecurityScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "pin" : {
      "description" : "Pin",
      "maxLength" : 256,
      "type" : "string"
    },
    "remove_pin" : {
      "description" : "Remove Pin",
      "type" : "boolean"
    },
    "slot_number" : {
      "description" : "Slot Number",
      "format" : "int32",
      "type" : "integer"
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
  "required" : [ "pin", "remove_pin", "slot_number", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_cellular_module_sim_security.my_resource_name"
 id="<resource_id>"
}
```

