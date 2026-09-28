## Documentation for Prisma SDWAN Resource "site_iot_device_id_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_iot_device_id_config` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/deviceidconfigs/{config_id}` (`DeviceIdConfigV2N1`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs` (`DeviceIdConfigV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/deviceidconfigs/{config_id}` (`DeviceIdConfigV2N1`) |


### JSON Schema

```json
{
  "properties" : {
    "deviceid_profile_id" : {
      "description" : "Deviceid Profile Id",
      "type" : "string"
    },
    "site_id" : {
      "description" : "Site Id",
      "maxLength" : 50,
      "pattern" : "^-?[0-9]{1,50}$",
      "type" : "string"
    },
    "cfg_device_id_enabled" : {
      "description" : "Cfg Device Id Enabled",
      "type" : "boolean"
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
  "required" : [ "deviceid_profile_id", "site_id", "cfg_device_id_enabled", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_iot_device_id_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

