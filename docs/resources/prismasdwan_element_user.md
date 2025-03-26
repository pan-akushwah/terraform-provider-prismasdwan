## Documentation for Prisma SDWAN Resource "element_user"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_user` |
| Get Api  | `/sdwan/v2.1/api/elementusers/{user_id}` (`ElementUserCredentials`) |
| Post Api  | `/sdwan/v2.1/api/elementusers` (`ElementUserCredentials`) |
| Put Api  | `/sdwan/v2.1/api/elementusers/{user_id}` (`ElementUserCredentials`) |
| Delete Api  | `/sdwan/v2.1/api/elementusers/{user_id}` |


### JSON Schema

```json
{
  "properties" : {
    "password" : {
      "description" : "Password: Password(alphabetReq = true, error = ELEMENTUSER_INVALID_PASSWORD: Invalid Password, password should have atleast one alphabet, one numeric and a special character. Allowed special characters are * ! @ #  % ^ & _ - Password Length should be between 8 to 64., nonAlphaNumericReq = true, numberReq = true, xssSafeCharsReq = true) ",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_sensitive" : {
            "type" : "boolean"
          }
        }
      }
    },
    "role" : {
      "description" : "Role",
      "type" : "string",
      "enum" : [ "SUPER", "READONLY", "MONITOR", "EVAL" ]
    },
    "is_tenant_level" : {
      "description" : "Is Tenant Level",
      "type" : "boolean"
    },
    "login_id" : {
      "description" : "Login Id",
      "type" : "string"
    },
    "username" : {
      "description" : "Username",
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_user.my_resource_name"
 id="<resource_id>"
}
```

