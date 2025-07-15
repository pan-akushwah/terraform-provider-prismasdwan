## Documentation for Prisma SDWAN Resource "site_iot_device_id_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_iot_device_id_config` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/deviceidconfigs/{config_id}` (`DeviceIdConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs` (`DeviceIdConfigScreen`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/deviceidconfigs/{config_id}` (`DeviceIdConfigScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "cfg_device_id_enabled" : {
      "description" : "Cfg Device Id Enabled",
      "type" : "boolean"
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_iot_device_id_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

