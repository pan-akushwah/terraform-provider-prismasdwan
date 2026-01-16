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
      "description" : "Vni: Required(error = VNI_REQD: VNI is a mandatory property.) Range(max = 64511L, error = INVALID_VNI_VALUE: VNI is invalid. It should be between 0 to 64511., min = 0L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = WANOVERLAY_CONFIG_DESCRIPTION_INVALID: Wan overlay config description invalid., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = WANOVERLAY_CONFIG_NAME_REQD: WAN Overlay name required.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "vni", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_wan_overlay.my_resource_name"
 id="<resource_id>"
}
```

