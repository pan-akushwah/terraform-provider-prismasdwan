## Documentation for Prisma SDWAN Resource "ws_extensions"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ws_extensions` |
| Get Api  | `/sdwan/v2.0/api/ws/extensions/{extension_id}` (`Extension`) |
| Post Api  | `/sdwan/v2.0/api/ws/extensions` (`Extension`) |
| Put Api  | `/sdwan/v2.0/api/ws/extensions/{extension_id}` (`Extension`) |
| Delete Api  | `/sdwan/v2.0/api/ws/extensions/{extension_id}` |


### JSON Schema

```json
{
  "properties" : {
    "conf" : {
      "type" : "object"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "namespace" : {
      "description" : "Namespace: NotEmpty(error = EXTENSION_NAMESPACE_REQD: Provide valid {} attribute) Pattern(error = INVALID_EXTENSION_NAMESPACE: Provide valid {} attribute. Invalid value {}, regexp = ^[a-z][a-z0-9/]*[a-z0-9]+$) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotEmpty(error = EXTENSION_NAME_REQD: Provide valid {} attribute) Size(max = 128, error = INVALID_EXTENSION_NAME: Provide valid {} attribute. Invalid value {}, min = 0) ",
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
    "entity_id" : {
      "description" : "Entity Id: Pattern(error = INVALID_ENTITY_ID: Invalid entity id. Only numbers are allowed., regexp = [0-9]+$) ",
      "type" : "string"
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
  "required" : [ "conf", "namespace", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ws_extensions.my_resource_name"
 id="<resource_id>"
}
```

