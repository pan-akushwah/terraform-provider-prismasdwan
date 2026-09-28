## Documentation for Prisma SDWAN Resource "sdwanapps_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `sdwanapps_config` |
| Get Api  | `/sdwan/v2.0/api/sdwanapps/{app_id}/configs/{cid}` (`SDWANAppConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sdwanapps/{app_id}/configs` (`SDWANAppConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sdwanapps/{app_id}/configs/{cid}` (`SDWANAppConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sdwanapps/{app_id}/configs/{cid}` |


### JSON Schema

```json
{
  "properties" : {
    "user_config" : {
      "type" : "object"
    },
    "state" : {
      "description" : "State",
      "type" : "string",
      "enum" : [ "enabled", "disabled", "paused" ]
    },
    "version" : {
      "description" : "Version",
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
  "required" : [ "user_config", "state", "version", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_sdwanapps_config.my_resource_name"
 id="<resource_id>:app_id=<some_app_id>"
}
```

