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
      "description" : "Pin: Size(max = 256, error = SIM_SECURITY_CONFIG_INVALID_PIN: Sim security invalid pin - Null pin allowed. For non-null pin, must be numeric with minimum 4 and maximum 8 digits, and must be sent as a base64 encoded string., min = 0) ",
      "type" : "string"
    },
    "remove_pin" : {
      "description" : "Remove Pin: Required(error = SIM_SECURITY_CONFIG_REMOVE_PIN_REQD: Sim security remove pin required. Must be false when pin is non-null and must be true when pin is null.) ",
      "type" : "boolean"
    },
    "slot_number" : {
      "description" : "Slot Number: NotNull(error = SIM_SECURITY_CONFIG_SLOT_NUMBER_REQD: Sim slot number required.) ",
      "format" : "int32",
      "type" : "integer"
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
  "required" : [ "remove_pin", "slot_number", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_cellular_module_sim_security.my_resource_name"
 id="<resource_id>"
}
```

