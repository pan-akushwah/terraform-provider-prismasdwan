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
      "description" : "Paths: Valid NotNull(message = PATHGROUP_INVALID_PATHS) Size(max = 2147483647, message = PATHGROUP_INVALID_PATHS, min = 1) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "path_type" : {
            "description" : "Path Type: ValidateEnum(enumClass = classOf[PathType], message = INVALID_PATH_TYPE, nullAllowed = false) ",
            "type" : "string",
            "enum" : [ "vpn", "direct", "servicelink" ]
          },
          "label" : {
            "description" : "Label: Pattern(message = INVALID_PATH_LABEL, regexp = (public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))) ",
            "type" : "string"
          }
        },
        "required" : [ "path_type" ]
      }
    },
    "description" : {
      "description" : "Description: Size(max = 256, message = PATHGROUP_INVALID_DESCRIPTION, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, message = PATHGROUP_INVALID_NAME, min = 0) ",
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
  "required" : [ "paths" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_path_group.my_resource_name"
 id="<resource_id>"
}
```

