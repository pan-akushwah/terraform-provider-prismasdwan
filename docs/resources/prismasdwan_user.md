## Documentation for Prisma SDWAN Resource "user"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `user` |
| Get Api  | `/sdwan/v2.0/api/users/{user_id}` (`UserIdentity`) |
| Post Api  | `/sdwan/v2.0/api/users` (`UserIdentity`) |
| Put Api  | `/sdwan/v2.0/api/users/{user_id}` (`UserIdentity`) |
| Delete Api  | `/sdwan/v2.0/api/users/{user_id}` |


### JSON Schema

```json
{
  "properties" : {
    "user_dn" : {
      "description" : "User Dn",
      "type" : "string"
    },
    "user_fqn" : {
      "description" : "User Fqn",
      "type" : "string"
    },
    "last_name" : {
      "description" : "Last Name",
      "type" : "string"
    },
    "middle_name" : {
      "description" : "Middle Name",
      "type" : "string"
    },
    "first_name" : {
      "description" : "First Name",
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_user.my_resource_name"
 id="<resource_id>"
}
```

