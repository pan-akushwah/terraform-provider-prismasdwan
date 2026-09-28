## Documentation for Prisma SDWAN Resource "nat_policy_pool"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `nat_policy_pool` |
| Get Api  | `/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}` (`NATPolicyPool`) |
| Post Api  | `/sdwan/v2.0/api/natpolicypools` (`NATPolicyPool`) |
| Put Api  | `/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}` (`NATPolicyPool`) |
| Delete Api  | `/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}` |


### JSON Schema

```json
{
  "properties" : {
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
  "required" : [ "description", "name", "tags", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_policy_pool.my_resource_name"
 id="<resource_id>"
}
```

