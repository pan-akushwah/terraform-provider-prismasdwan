## Documentation for Prisma SDWAN Resource "wan_overlay"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `wan_overlay` |
| Get Api  | `/sdwan/v2.0/api/wanoverlays/{wan_overlay_id}` (`WanOverlay`) |
| Post Api  | `/sdwan/v2.0/api/wanoverlays` (`WanOverlay`) |
| Put Api  | `/sdwan/v2.0/api/wanoverlays/{wan_overlay_id}` (`WanOverlay`) |
| Delete Api  | `/sdwan/v2.0/api/wanoverlays/{wan_overlay_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vni" : {
      "description" : "Vni",
      "format" : "int32",
      "maximum" : 64511,
      "minimum" : 0,
      "type" : "integer"
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
  "required" : [ "vni", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_wan_overlay.my_resource_name"
 id="<resource_id>"
}
```

