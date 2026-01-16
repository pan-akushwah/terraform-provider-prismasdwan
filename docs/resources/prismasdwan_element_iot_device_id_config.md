## Documentation for Prisma SDWAN Resource "element_iot_device_id_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_iot_device_id_config` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{config_id}` (`DeviceIdElementConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs` (`DeviceIdElementConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{deviceid_config_id}` (`DeviceIdElementConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{deviceid_config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "snmp_discovery_source_interface_id" : {
      "description" : "Snmp Discovery Source Interface Id",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_iot_device_id_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

