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
      },
      "required" : [ "active_sase_label" ]
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "cg-transit", "non-cg-transit", "sase" ]
    },
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
        "pattern" : "[^,\\s]+",
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
  "required" : [ "sase_properties", "type", "description", "name", "tags", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_service_group.my_resource_name"
 id="<resource_id>"
}
```

