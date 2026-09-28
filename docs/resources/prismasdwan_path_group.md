## Documentation for Prisma SDWAN Resource "path_group"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `path_group` |
| Get Api  | `/sdwan/v2.1/api/pathgroups/{path_group_id}` (`PathGroupScreen`) |
| Post Api  | `/sdwan/v2.1/api/pathgroups` (`PathGroupScreen`) |
| Put Api  | `/sdwan/v2.1/api/pathgroups/{path_group_id}` (`PathGroupScreen`) |
| Delete Api  | `/sdwan/v2.1/api/pathgroups/{path_group_id}` |


### JSON Schema

```json
{
  "properties" : {
    "paths" : {
      "description" : "Paths",
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "path_type" : {
            "description" : "Path Type",
            "type" : "string",
            "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
          },
          "label" : {
            "description" : "Label",
            "pattern" : "(public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))",
            "type" : "string"
          }
        },
        "required" : [ "path_type", "label" ]
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
  "required" : [ "paths", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_path_group.my_resource_name"
 id="<resource_id>"
}
```

