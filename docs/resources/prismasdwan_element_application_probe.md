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
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "minLength" : 1,
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
  "required" : [ "source_interface_id", "enable_probe", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_application_probe.my_resource_name"
 id="<resource_id>"
}
```

