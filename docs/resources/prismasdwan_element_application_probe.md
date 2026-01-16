## Documentation for Prisma SDWAN Resource "element_application_probe"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_application_probe` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/application_probe` (`ApplicationProbeScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/application_probe` (`ApplicationProbeScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "source_interface_id" : {
      "description" : "Source Interface Id",
      "type" : "string"
    },
    "enable_probe" : {
      "description" : "Enable Probe",
      "type" : "boolean"
    },
    "tags" : {
      "description" : "Tags",
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
      "description" : "Description: Size(max = 256, APPLICATION_PROBE_CONFIG_DESCRIPTION_INVALID, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotEmpty(APPLICATION_PROBE_CONFIG_NAME_REQD) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
 to="prismasdwan_element_application_probe.my_resource_name"
 id="<resource_id>"
}
```

