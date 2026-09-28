## Documentation for Prisma SDWAN Resource "vrf_context"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `vrf_context` |
| Get Api  | `/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}` (`VRFContextScreen`) |
| Post Api  | `/sdwan/v2.0/api/vrfcontexts` (`VRFContextScreen`) |
| Put Api  | `/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}` (`VRFContextScreen`) |
| Delete Api  | `/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}` |


### JSON Schema

```json
{
  "properties" : {
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
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
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "minLength" : 1,
      "pattern" : "^[A-Za-z][A-Za-z0-9_\\s-]*$",
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
  "required" : [ "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_vrf_context.my_resource_name"
 id="<resource_id>"
}
```

