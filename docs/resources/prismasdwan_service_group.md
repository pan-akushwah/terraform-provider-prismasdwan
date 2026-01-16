## Documentation for Prisma SDWAN Resource "service_group"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `service_group` |
| Get Api  | `/sdwan/v2.1/api/servicelabels/{service_label_id}` (`ServiceLabelV2N1`) |
| Post Api  | `/sdwan/v2.1/api/servicelabels` (`ServiceLabelV2N1`) |
| Put Api  | `/sdwan/v2.1/api/servicelabels/{service_label_id}` (`ServiceLabelV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/servicelabels/{service_label_id}` |


### JSON Schema

```json
{
  "properties" : {
    "sase_properties" : {
      "properties" : {
        "active_sase_label" : {
          "description" : "Active Sase Label",
          "type" : "boolean"
        }
      }
    },
    "type" : {
      "description" : "Type: ValidateEnum(enumClass = classOf[NetworkServiceType], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = DESCRIPTION_SIZE_EXCEEDED: Description size exceeded., min = 0) Valid ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = SERVICELABEL_NAME_REQD: Service label name required.) Size(max = 128, error = SERVICELABEL_NAME_EXCEEDS_LIMIT: Service label name exceeds limit., min = 0) Valid ",
      "type" : "string"
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
  "required" : [ "type", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_service_group.my_resource_name"
 id="<resource_id>"
}
```

