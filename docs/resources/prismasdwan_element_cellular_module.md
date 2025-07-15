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
      "description" : "Primary Sim: NotNull(error = CELLULAR_MODULE_CONFIG_PRIMARY_SIM_REQD: Primary SIM attribute cannot be null.) ",
      "type" : "integer"
    },
    "gps_enable" : {
      "description" : "Gps Enable: NotNull(error = CELLULAR_MODULE_CONFIG_GPS_ENABLE_REQD: GPS enable attribute cannot be null.) ",
      "type" : "boolean"
    },
    "radio_on" : {
      "description" : "Radio On: NotNull(error = CELLULAR_MODULE_CONFIG_RADIO_ON_REQD: Radio On attribute cannot be null.) ",
      "type" : "boolean"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "primary_sim", "gps_enable", "radio_on", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_cellular_module.my_resource_name"
 id="<resource_id>"
}
```

