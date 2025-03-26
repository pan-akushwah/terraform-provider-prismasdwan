## Documentation for Prisma SDWAN Resource "permissions"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `permissions` |
| Get Api  | `/sdwan/v2.0/api/permissions/{permission_id}` (`CustomPermission`) |
| Put Api  | `/sdwan/v2.0/api/permissions/{permission_id}` (`CustomPermission`) |
| Delete Api  | `/sdwan/v2.0/api/permissions/{permission_id}` |


### JSON Schema

```json
{
  "properties" : {
    "disallow_permission" : {
      "description" : "Disallow Permission",
      "type" : "boolean"
    },
    "allowed_before_ms" : {
      "description" : "Allowed Before Ms",
      "format" : "int64",
      "type" : "integer"
    },
    "allowed_after_ms" : {
      "description" : "Allowed After Ms",
      "format" : "int64",
      "type" : "integer"
    },
    "value" : {
      "description" : "Value: Pattern(error = INVALID_PERMISSION_VALUE: Permission value contains invalid characters. Check data {}, regexp = ^[/0-9a-zA-+_\\\\[\\\\]-]{1,500}$) NotEmpty ",
      "type" : "string"
    },
    "region" : {
      "description" : "Region: Transient ",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
    },
    "id" : {
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
  "required" : [ "value" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_permissions.my_resource_name"
 id="<resource_id>"
}
```

