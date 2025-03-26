## Documentation for Prisma SDWAN Resource "element_user_access"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_user_access` |
| Get Api  | `/sdwan/v2.1/api/elementusers/{user_id}/access/{access_id}` (`ElementUserAccess`) |
| Post Api  | `/sdwan/v2.1/api/elementusers/{user_id}/access` (`ElementUserAccess`) |
| Put Api  | `/sdwan/v2.1/api/elementusers/{user_id}/access/{access_id}` (`ElementUserAccess`) |
| Delete Api  | `/sdwan/v2.1/api/elementusers/{user_id}/access/{access_id}` |


### JSON Schema

```json
{
  "properties" : {
    "role" : {
      "description" : "Role: ValidateEnum(enumClass = classOf[UserRole], error = INVALID_ENUM_VALUE: Invalid Enum value., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "SUPER", "READONLY", "MONITOR", "EVAL" ]
    },
    "element_id" : {
      "description" : "Element Id: NotNull NotEmpty ",
      "type" : "string"
    },
    "user_id" : {
      "description" : "User Id",
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
  "required" : [ "role", "element_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_user_access.my_resource_name"
 id="<resource_id>:user_id=<some_user_id>"
}
```

