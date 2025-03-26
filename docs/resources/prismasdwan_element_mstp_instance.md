## Documentation for Prisma SDWAN Resource "element_mstp_instance"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_mstp_instance` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/mstp_instances/{mstp_instance_id}` (`MSTPInstanceScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/mstp_instances` (`MSTPInstanceScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/mstp_instances/{mstp_instance_id}` (`MSTPInstanceScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/mstp_instances/{mstp_instance_id}` |


### JSON Schema

```json
{
  "properties" : {
    "instance_priority" : {
      "description" : "Instance Priority: Range(max = 15L, error = MSTP_INSTANCE_INVALID_STP_PRIORITY: Invalid MSTP Instance STP Priority. Valid values are 0-15, min = 0L) ",
      "type" : "integer"
    },
    "instance_number" : {
      "description" : "Instance Number: Range(max = 255L, error = MSTP_INSTANCE_INVALID_INSTANCE_NUMBER: Invalid MSTP Instance number. Valid values 0-255, min = 0L) ",
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_mstp_instance.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

